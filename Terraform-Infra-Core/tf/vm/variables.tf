variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "nsg_name" {
  type = string
}
variable "sgrule_name" {
  type = string
}
variable "nic_name" {
  type = string
} 

variable "ipconfig_name" {
  type = string
} 
variable "tags" {
  type = map(string)
}

variable "ssh_public_key" {
  type = string
}

# variable "custom_data_file" {
#   type = string
# }
variable "stage" {
  type = string
}

variable "vms" {
  type = map(any)
}
