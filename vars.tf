variable "ssh_key" {
  default = ""
}
variable "proxmox_host" {
  default = "proxmox1"
}
variable "template_id" {
  default = "8000"
}

# variable "virtual_environment_api_token" {
#     default = ""
# }
variable "proxmox_password" {
  default = "Par240XXX"
}

variable "proxmox_endpoint" {
    default = "https://192.168.111.185:8006/api2/json"
}