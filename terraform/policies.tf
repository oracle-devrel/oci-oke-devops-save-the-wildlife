# ## Copyright (c) 2022, Oracle and/or its affiliates.
# ## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

# resource "oci_identity_dynamic_group" "devopsgroup1" {
#   provider       = oci.homeregion
#   name           = "devopsdeploypipeline-${random_id.tag.hex}"
#   description    = "DevOps deploy pipeline dynamic group"
#   compartment_id = var.compartment_ocid
#   matching_rule  = "ALL {resource.type = 'devopsdeploypipeline', resource.compartment.id = '${var.compartment_ocid}'}"
# }

# resource "oci_identity_dynamic_group" "devopsgroup2" {
#   provider       = oci.homeregion
#   name           = "devopsrepository-${random_id.tag.hex}"
#   description    = "DevOps code repository dynamic group"
#   compartment_id = var.tenancy_ocid
#   matching_rule  = "ALL {resource.type = 'devopsrepository'}"
# }


# resource "oci_identity_dynamic_group" "devopsgroup3" {
#   provider       = oci.homeregion
#   name           = "devopsbuildpipeline-${random_id.tag.hex}"
#   description    = "DevOps repository build pipeline dynamic group"
#   compartment_id = var.tenancy_ocid
#   matching_rule  = "ALL {resource.type = 'devopsbuildpipeline'}"
# }


# resource "oci_identity_policy" "devopspolicy" {
#   provider       = oci.homeregion
#   name           = "gamedevdevops-policies-${random_id.tag.hex}"
#   description    = "policy created for devops"
#   compartment_id = var.compartment_ocid

#   statements = [
#     "Allow dynamic-group ${oci_identity_dynamic_group.devopsgroup2.name} to manage devops-family in compartment id ${var.compartment_ocid}",
#     "Allow dynamic-group ${oci_identity_dynamic_group.devopsgroup2.name} to manage all-resources in compartment id ${var.compartment_ocid}",
#     "Allow dynamic-group ${oci_identity_dynamic_group.devopsgroup2.name} to manage virtual-network-family in tenancy",
#     "Allow dynamic-group ${oci_identity_dynamic_group.devopsgroup3.name} to manage devops-family in compartment id ${var.compartment_ocid}",
#     "Allow dynamic-group ${oci_identity_dynamic_group.devopsgroup3.name} to manage all-resources in compartment id ${var.compartment_ocid}",
#     "Allow dynamic-group ${oci_identity_dynamic_group.devopsgroup3.name} to manage virtual-network-family in tenancy",
#   ]
# }

# resource "oci_identity_policy" "devopsrootpolicy" {
#   provider       = oci.homeregion
#   name           = "gamedevops-root-policies-${random_id.tag.hex}"
#   description    = "policy created for root compartment"
#   compartment_id = var.tenancy_ocid

#   statements = [
#     "Allow dynamic-group ${oci_identity_dynamic_group.devopsgroup2.name} to manage all-resources in tenancy",
#     "Allow dynamic-group ${oci_identity_dynamic_group.devopsgroup3.name} to manage all-resources in tenancy",
#   ]
# }


## Copyright (c) 2022, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

resource "oci_identity_dynamic_group" "devopsgroup1" {
  provider       = oci.homeregion
  name           = "gamedevopsdyngroup-${random_id.tag.hex}"
  description    = "DevOps deploy pipeline dynamic group"
  compartment_id = var.tenancy_ocid
  matching_rule  = "ALL {resource.type = 'devopsdeploypipeline', resource.compartment.id = '${var.compartment_ocid}'}"
}

resource "oci_identity_dynamic_group" "devopsgroup2" {
  provider       = oci.homeregion
  name           = "SaveTheWildlifeDynamicGroup-${random_id.tag.hex}"
  description    = "DevOps code repository dynamic group"
  compartment_id = var.tenancy_ocid
  matching_rule  = "ALL {resource.type = 'devopsrepository'}"
}


resource "oci_identity_dynamic_group" "devopsgroup3" {
  provider       = oci.homeregion
  name           = "GameDevOPSDynamicGroup-${random_id.tag.hex}"
  description    = "DevOps repository build pipeline dynamic group"
  compartment_id = var.tenancy_ocid
  matching_rule  = "ALL {resource.type = 'devopsbuildpipeline'}"
}


resource "oci_identity_policy" "devopspolicy" {
  provider       = oci.homeregion
  name           = "gamedevdevops-policies-${random_id.tag.hex}"
  description    = "policy created for devops"
  compartment_id = var.compartment_ocid

  statements = [
    "Allow group Administrators to manage devops-family in compartment id ${var.compartment_ocid}",
    "Allow group Administrators to manage all-artifacts in compartment id ${var.compartment_ocid}",
    "Allow dynamic-group ${oci_identity_dynamic_group.devopsgroup1.name} to manage all-resources in compartment id ${var.compartment_ocid}",
  ]
}

resource "oci_identity_policy" "devopsrootpolicy" {
  provider       = oci.homeregion
  name           = "gamedevops-root-policies-${random_id.tag.hex}"
  description    = "policy created for root compartment"
  compartment_id = var.tenancy_ocid

  statements = [
    "Allow dynamic-group ${oci_identity_dynamic_group.devopsgroup2.name} to manage all-resources in tenancy",
    "Allow dynamic-group ${oci_identity_dynamic_group.devopsgroup3.name} to manage all-resources in tenancy",
  ]
}