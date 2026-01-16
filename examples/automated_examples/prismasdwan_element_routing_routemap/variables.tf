
  
    # Site and Element Configuration (Required for resource locators)
    variable "site_name" {
      description = "Name of the site where the element is located (used for resource locator)"
      type        = string
  
      validation {
        condition     = length(var.site_name) > 0
        error_message = "Site name is required and cannot be empty."
      }
    }

    variable "element_name" {
      description = "Name of the element where the Routing Route Map will be created (used for resource locator)"
      type        = string
  
      validation {
        condition     = length(var.element_name) > 0
        error_message = "Element name is required and cannot be empty."
      }
    }

    # Routing Route Map Basic Properties (Required)
    variable "routemap_name" {
      description = "Name of the Routing Route Map"
      type        = string
  
      validation {
        condition     = length(var.routemap_name) > 0 && length(var.routemap_name) <= 128
        error_message = "Routing Route Map name must be between 1 and 128 characters."
      }
    }

    variable "used_for" {
      description = "Protocol the route map is used for"
      type        = string
  
      validation {
        condition     = contains(["bgp", "ospf"], var.used_for)
        error_message = "Used for must be either 'bgp' or 'ospf'."
      }
    }

    # Optional Properties
    variable "description" {
      description = "Description for the Routing Route Map"
      type        = string
      default     = ""
  
      validation {
        condition     = length(var.description) <= 1024
        error_message = "Description must not exceed 1024 characters."
      }
    }

    variable "tags" {
      description = "Tags for the Routing Route Map (max 10 tags, max 1024 chars each)"
      type        = list(string)
      default     = []
  
      validation {
        condition     = length(var.tags) <= 10
        error_message = "Maximum 10 tags are allowed."
      }
  
      validation {
        condition = alltrue([
          for tag in var.tags : length(tag) > 0 && length(tag) <= 1024 && can(regex("^[^,\\s]+$", tag))
        ])
        error_message = "Each tag must be between 1 and 1024 characters and cannot contain commas or whitespace."
      }
    }

    variable "auto_generated" {
      description = "Whether this Routing Route Map is auto-generated"
      type        = bool
      default     = false
    }

    # Route Map Entries Configuration
    variable "route_map_entries" {
      description = "List of route map entries for the routing route map"
      type = list(object({
        order          = number
        permit         = bool
        continue_entry = optional(string)
        match = optional(object({
          metric              = optional(number)
          tag                 = optional(number)
          community_list_id   = optional(string)
          ip_next_hop_id      = optional(string)
          ip_prefix_list_id   = optional(string)
          as_path_id          = optional(string)
        }))
        set = optional(object({
          metric             = optional(number)
          type               = optional(string)
          additive_community = optional(bool)
          tag                = optional(number)
          ip_v6_next_hop     = optional(string)
          ip_next_hop        = optional(string)
          community          = optional(string)
          weight             = optional(number)
          local_preference   = optional(number)
          as_path_prepend    = optional(string)
        }))
      }))
      default = []
  
      validation {
        condition = alltrue([
          for entry in var.route_map_entries : entry.order >= 1 && entry.order <= 65535
        ])
        error_message = "Order must be between 1 and 65535 for all route map entries."
      }
  
      validation {
        condition = length(var.route_map_entries) == length(distinct([
          for entry in var.route_map_entries : entry.order
        ]))
        error_message = "Order values must be unique across all route map entries."
      }
  
      validation {
        condition = alltrue([
          for entry in var.route_map_entries : (
            entry.continue_entry == null || 
            can(regex("^(0|[1-9][0-9]{0,3}|[1-5][0-9]{4}|6[0-4][0-9]{3}|65[0-4][0-9]{2}|655[0-2][0-9]|6553[0-5])$", entry.continue_entry))
          )
        ])
        error_message = "Continue entry must be a valid number between 0 and 65535."
      }
  
      # Separate validation for set.type to handle null values properly
      validation {
        condition = alltrue([
          for entry in var.route_map_entries : (
            entry.set == null ? true : (
              entry.set.type == null ? true : 
              contains(["type-1", "type-2"], entry.set.type)
            )
          )
        ])
        error_message = "Set type must be either 'type-1' or 'type-2' when specified."
      }
    }
  
