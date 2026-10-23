# Import an existing "element_interface" resource by its id.
# For nested resources the id is a composite of the parent path parameters and the resource id.
terraform import prismasdwan_element_interface.example "<resource_id>:site_id=<site_id>:element_id=<element_id>"
