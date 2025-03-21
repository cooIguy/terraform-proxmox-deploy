variable "vm_count" {
  description = "Number of VMs to deploy"
  type        = number
  default     = 3
}

variable "pm_api_url" {
  description = "Proxmox API URL"
  type        = string
  default     = "https://192.168.111.185:8006/api2/json"
}

variable "pm_api_token_id" {
  description = "Proxmox API Token ID"
  type        = string
  default     = "root@pam!terraform-token"
}

variable "pm_api_token_secret" {
  description = "Proxmox API Token Secret"
  type        = string
  sensitive   = true
  default     = "7cc1ff80-32d9-4652-a6c2-e6adb05b3fc6"
}

variable "target_node" {
  description = "Proxmox node where the VMs will be deployed"
  type        = string
  default     = "labor"
}

variable "template_name" {
  description = "Name of the template"
  type        = string
  default     = "ubuntu-cloud"  # buhweiwaeghiuewtagwetiguwThis should match the template's name in Proxmox
}


variable "vm_name" {
  description = "Base name of the virtual machine"
  type        = string
  default     = "VM-0"
}

variable "cpu_cores" {
  description = "Number of CPU cores per VM"
  type        = number
  default     = 4
}

variable "memory" {
  description = "Amount of RAM per VM (MB)"
  type        = number
  default     = 1000
}

variable "disk_size" {
  description = "Disk size per VM"
  type        = string
  default     = "40G"
}

variable "storage" {
  description = "Storage location for the VM disk"
  type        = string
  default     = "local-lvm"
}

variable "network_bridge" {
  description = "Network bridge for the VM"
  type        = string
  default     = "vmbr0"
}

variable "ssh_public_key" {
  description = "SSH public key for user access"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDKfKbBsR1iP9Kyh/BzE8yyfmgnICW1db3O/G2pjoISdgC+BXzyISv57HAUhP6QeWleCMRoQwXDoPOvFUTfhOaSJe8TlwaYjppBJs5YBN36X2/R4lu9Jel8IhS2yNXorNEZIepBfOWReWTZsmWcU4H6eAPMy/BKyukP+bAA2ZNCFxYnTyDg3nyH20gEKWEkuPgjiCKoc1I0KQuAhY6mA8trjusPPLunFQiwtIHk7NzuH2xMmuHW07vzNWpK94QmSJCpH3W3CKVRIWb3/ifSP9ciRW6RMv3h5TP3Z6XtIDyV630uYwQTeoU3+fm2cWuoYMsX+nI6CjPtZP5BV+PwmGweoX+pgpva/8FehlP5MRW2ERuYtZve3q2JJYUuien+WkQpouNa6QpxgJFYiPos7so4vRxAnmLD3UkciZeiHnI5nCoXXOCM0pCqe05A8ThFA7v4zmSTzi8ZOcDXk6Z7l+cAjZh70YrbvxQHFm9NG2h4+yYQhS3NP017A/9UJjK5xvm8xgi26W5BrqzxCgB1Vy3AcpfVWXRZ4FGa8rtS6KttyZW7OVwl6fmCGVCjXi/inChr6aicmv9UZXvzSwbCzB/1Wk7jXYBE6xvkYFHlHa92N5QBie59bnFaDCO178nS/9MeKDnGTgrrGxq5UDWvX4x97YgpkirdCiK+MRFzucc+Gw== root@labor"
}

variable "ciuser" {
  description = "cloud init user to login with"
  type        = string
  default     = "ubuntu"
}