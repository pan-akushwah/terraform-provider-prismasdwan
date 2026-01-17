## Documentation for Prisma SDWAN Data Sources

The data sources in Prisma SD-WAN Provider are generic in nature and support below conventions:

Each data source will follow below schema:

```terraform
data "prismasdwan_resource_type" "some_name" {
    filters = {
        "json.path.1" : "string value.1"
        "json.path.2" : "string value.2"
        ...
        "json.path.N" : "string value.N"
    }
    // items are auto generated
    items = [
        {
            // items which matches ALL the JSON Path and Values given in filter
        }
    ]
}

```


### Examples

> All SDWAN Sites
```json
data "prismasdwan_site" "all_sites" {
  filters = {
  }
}

output "total_matches" {
  value = length(data.prismasdwan_site.all_sites.items)
}
```

> All SDWAN SPOKE Sites
```json
data "prismasdwan_site" "spoke_sites" {
  filters = {
    "element_cluster_role" = "SPOKE"
  }
}

output "spoke_sites_matches" {
  value = length(data.prismasdwan_site.spoke_sites.items)
}
```

> All SDWAN Sites within India
```json
data "prismasdwan_site" "india_sites" {
  filters = {
    "address.country" = "India"
  }
}

output "india_sites_matches" {
  value = length(data.prismasdwan_site.india_sites.items)
}
```


> All SDWAN Hub (DC) Sites within India
```json
data "prismasdwan_site" "india_hub_sites" {
  filters = {
    "address.country"      = "India"
    "element_cluster_role" = "HUB"
  }
}

output "india_hub_sites_matches" {
  value = length(data.prismasdwan_site.india_hub_sites.items)
}
```

> Sample Output
```text
Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

india_hub_sites_matches = 1
india_sites_matches = 5
spoke_sites_matches = 5
total_matches = 6
```