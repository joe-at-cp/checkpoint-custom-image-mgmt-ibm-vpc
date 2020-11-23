##############################################################################
# IBM Cloud Provider
##############################################################################
provider "ibm" {
  ibmcloud_api_key = "${var.ibmcloud_api_key}"
  generation       = 2
  region           = "${var.VPC_Region}"
  ibmcloud_timeout = 300
  resource_group   = "${var.Resource_Group}"
}

##############################################################################
# Variable block - See each variable description
##############################################################################

variable "VPC_Region" {
  default     = ""
  description = "The region where the VPC, networks, and Check Point VSI will be provisioned."
}

variable "Resource_Group" {
  default     = "Default"
  description = "The resource group that will be used when provisioning the Check Point VSI. If left unspecififed, the account's default resource group will be used."
}

variable "mgmt_image_name" {
  default     = "cloudguard-management"
  description = "The name of the Check Point Management Server that will be provisioned."
}

variable "gw_image_name" {
  default     = "cloudguard-gateway"
  description = "The name of the Check Point Management Server that will be provisioned."
}

variable "CP_Version" {
  default     = "R80.40"
  description = "The version of Check Point to deploy. R80.40, R81"
}

variable "ibmcloud_api_key" {
  default     = ""
  description = "(HIDDEN) Holds the user api key"
}

##############################################################################
# Data block 
##############################################################################

data "ibm_is_region" "region" {
  name = "${var.VPC_Region}"
}

data "ibm_resource_group" "rg" {
  name = "${var.Resource_Group}"
}

##############################################################################
# Create Custom Images
##############################################################################

locals {
  mgmt_image_url    = "cos://${var.VPC_Region}/checkpoint-${var.VPC_Region}/Check_Point_${var.CP_Version}_Cloudguard_Security_Management.qcow2"
}

resource "ibm_is_image" "cp_mgmt_custom_image" {
  href             = "${local.mgmt_image_url}"
  name             = replace("${var.mgmt_image_name}-${lower(var.CP_Version)}",".","")
  operating_system = "centos-7-amd64"
  resource_group   = "${data.ibm_resource_group.rg.id}"

  timeouts {
    create = "30m"
    delete = "10m"
  }
}

data "ibm_is_image" "cp_mgmt_custom_image" {
  name = "${ibm_is_image.cp_mgmt_custom_image.name}"
}
