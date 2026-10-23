# Import an existing "nat_policy_rule" resource by its id.
# For nested resources the id is a composite of the parent path parameters and the resource id.
terraform import prismasdwan_nat_policy_rule.example "<resource_id>:nat_policy_set_id=<nat_policy_set_id>"
