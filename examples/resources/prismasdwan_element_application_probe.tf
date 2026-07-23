# Copyright Palo Alto Networks Inc. 2025
#
# Sample resource example for "element_application_probe"
#
# To be able to use this template, first use the Prisma SDWAN provider:
# terraform {
#    required_providers {
#      prismasdwan = {
#        source  = "paloaltonetworks/terraform-provider-prismasdwan"
#        version = "a.b.c.d[-beta]"
#      }
#    }
#  }
#
#
# Configure the Provider with appropriate Service Account Credentials
#
#  provider "prismasdwan" {
#    host          = "api.sase.paloaltonetworks.com"
#    client_id     = "acmeuser@12345.iam.panserviceaccount.com"
#    client_secret = "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"
#    scope         = "tsg_id:12345"
#    auth_url      = "https://auth.apps.paloaltonetworks.com/am/oauth2/access_token"
#  }
#
#

# ============================================================================
# Example 1: Basic Application Probe Configuration
# ============================================================================

# Resource locator for site (required)
resource "prismasdwan_resource_locator" "site" {
  resource_type           = "prismasdwan_site"
  resource_property       = "name"
  resource_property_value = "Branch-Site-01"
}

# Resource locator for element (required)
resource "prismasdwan_resource_locator" "element" {
  resource_type           = "prismasdwan_element"
  resource_property       = "name"
  resource_property_value = "ION-Device-01"
}

# Basic application probe configuration
resource "prismasdwan_element_application_probe" "basic_probe" {
  # Required: Element-specific parameters
  x_parameters = {
    site_id    = prismasdwan_resource_locator.site.result
    element_id = prismasdwan_resource_locator.element.result
  }

  # Required fields
  name = "ApplicationProbe-Basic"

  # Optional fields
  description  = "Basic application probe configuration"
  enable_probe = true
  tags         = ["production", "monitoring"]
}

# ============================================================================
# Example 2: Application Probe with Source Interface
# ============================================================================

# Resource locator for source interface
resource "prismasdwan_resource_locator" "source_interface" {
  resource_type           = "prismasdwan_element_interface"
  resource_property       = "name"
  resource_property_value = "LAN-Interface-1"

  x_parameters = {
    site_id    = prismasdwan_resource_locator.site.result
    element_id = prismasdwan_resource_locator.element.result
  }
}

# Application probe with source interface specified
resource "prismasdwan_element_application_probe" "probe_with_source" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.site.result
    element_id = prismasdwan_resource_locator.element.result
  }

  name                = "ApplicationProbe-WithSource"
  description         = "Application probe using specific source interface"
  enable_probe        = true
  source_interface_id = prismasdwan_resource_locator.source_interface.result
  tags                = ["production", "monitoring", "lan"]
}

# ============================================================================
# Example 3: Disabled Application Probe
# ============================================================================

resource "prismasdwan_element_application_probe" "disabled_probe" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.site.result
    element_id = prismasdwan_resource_locator.element.result
  }

  name         = "ApplicationProbe-Disabled"
  description  = "Application probe currently disabled for maintenance"
  enable_probe = false
  tags         = ["maintenance", "disabled"]
}

# ============================================================================
# Example 4: Using Direct IDs (without resource locators)
# ============================================================================

resource "prismasdwan_element_application_probe" "direct_ids_probe" {
  x_parameters = {
    site_id    = "1234567890abcdef"
    element_id = "abcdef1234567890"
  }

  name         = "ApplicationProbe-DirectIDs"
  description  = "Application probe using direct site and element IDs"
  enable_probe = true
  tags         = ["test"]
}

# ============================================================================
# Example 5: Minimal Configuration
# ============================================================================

resource "prismasdwan_element_application_probe" "minimal" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.site.result
    element_id = prismasdwan_resource_locator.element.result
  }

  name = "ApplicationProbe-Minimal"
}

# ============================================================================
# Example 6: Conditional Source Interface
# ============================================================================

variable "use_source_interface" {
  description = "Whether to use a specific source interface"
  type        = bool
  default     = false
}

variable "source_interface_name" {
  description = "Name of the source interface (if used)"
  type        = string
  default     = null
}

# Conditional resource locator for source interface
resource "prismasdwan_resource_locator" "conditional_source_interface" {
  count = var.use_source_interface && var.source_interface_name != null ? 1 : 0

  resource_type           = "prismasdwan_element_interface"
  resource_property       = "name"
  resource_property_value = var.source_interface_name

  x_parameters = {
    site_id    = prismasdwan_resource_locator.site.result
    element_id = prismasdwan_resource_locator.element.result
  }
}

resource "prismasdwan_element_application_probe" "conditional_probe" {
  x_parameters = {
    site_id    = prismasdwan_resource_locator.site.result
    element_id = prismasdwan_resource_locator.element.result
  }

  name         = "ApplicationProbe-Conditional"
  description  = "Application probe with conditional source interface"
  enable_probe = true

  # Conditionally set source_interface_id
  source_interface_id = var.use_source_interface && var.source_interface_name != null ? (
    prismasdwan_resource_locator.conditional_source_interface[0].result
  ) : null

  tags = ["conditional"]
}

# ============================================================================
# Outputs
# ============================================================================

output "basic_probe_id" {
  description = "ID of the basic application probe"
  value       = prismasdwan_element_application_probe.basic_probe.id
}

output "probe_with_source_id" {
  description = "ID of the application probe with source interface"
  value       = prismasdwan_element_application_probe.probe_with_source.id
}

# ============================================================================
# Notes:
# ============================================================================
#
# 1. Application Probe is an element-level resource that requires both
#    site_id and element_id in the x_parameters block.
#
# 2. This resource uses a PUT-only API pattern (no POST), meaning it
#    configures/updates an existing application probe setting on the element
#    rather than creating a new resource.
#
# 3. Key Attributes:
#    - name: Name of the application probe configuration
#    - enable_probe: Boolean to enable/disable the probe
#    - source_interface_id: (Optional) ID of the interface to use as source
#    - description: (Optional) Description of the probe
#    - tags: (Optional) Set of tags for organization
#
# 4. The source_interface_id should reference an existing element interface.
#    Use prismasdwan_resource_locator to look up interface IDs by name.
#
# 5. Common use cases:
#    - Application performance monitoring
#    - Network path quality measurement
#    - Service availability testing
#    - SaaS application monitoring
#
# 6. Import existing configuration:
#    terraform import prismasdwan_element_application_probe.example \
#      "site_id=<site_id>:<element_id=<element_id>"
#
