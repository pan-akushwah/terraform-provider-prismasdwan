# Import an existing "site_hub_cluster_member" resource by its id.
# For nested resources the id is a composite of the parent path parameters and the resource id.
terraform import prismasdwan_site_hub_cluster_member.example "<resource_id>:site_id=<site_id>:hub_cluster_id=<hub_cluster_id>"
