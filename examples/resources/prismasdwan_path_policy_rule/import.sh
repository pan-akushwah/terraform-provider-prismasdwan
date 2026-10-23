# Import an existing "path_policy_rule" resource by its id.
# For nested resources the id is a composite of the parent path parameters and the resource id.
terraform import prismasdwan_path_policy_rule.example "<resource_id>:policy_set_id=<policy_set_id>"
