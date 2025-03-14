provider "proxmox" {
  endpoint = var.proxmox_endpoint  # Set the Proxmox endpoint URL
  username = "root@pam"  # Use your specific username for Proxmox
  password = var.proxmox_password  # Set this in your variables.tf file for sensitive information
  insecure = true

  ssh {
    agent = true
  }
}

resource "proxmox_virtual_environment_download_file" "ubuntu_cloud_image" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = var.proxmox_host  # Replace with the hostname of your Proxmox node

  url = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"  # You can replace with your desired Ubuntu version
}

resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
  count     = 3  # Define the number of VMs you want to create (3 VMs in this case)
  name      = "test-ubuntu-${count.index + 1}"
  node_name = var.proxmox_host  # Replace with the hostname of your Proxmox node

  initialization {
    ip_config {
      ipv4 {
        address = "192.168.111.${186 + count.index}/24"  # Dynamically assign IPs starting from 192.168.111.186
        gateway = "192.168.111.1"  # Replace with your gateway IP
      }
    }

    user_account {
      username = "ubuntu"
      keys     = [var.ssh_key]  # Replace with your SSH key variable
    }
  }

  disk {
    datastore_id = "local-lvm"
    file_id      = proxmox_virtual_environment_download_file.ubuntu_cloud_image.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 20
  }

  network_device {
    bridge = "vmbr0"
  }
}
