# Import an existing "element_ipfix" resource by its id.
# For nested resources the id is a composite of the parent path parameters and the resource id.
terraform import prismasdwan_element_ipfix.example "<resource_id>:site_id=<site_id>:element_id=<element_id>"
