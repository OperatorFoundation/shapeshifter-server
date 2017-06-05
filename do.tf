# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {}
variable "pubkey" {}
variable "privkey" {}
variable "ssh_fingerprint" {}
variable "config_dir" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_ssh_key" "default" {
    name = "terraform"
    public_key = "${file("~/.ssh/id_ecdsa.pub")}"
}

# Create a web server
resource "digitalocean_droplet" "OpenVPN" {
  image = "ubuntu-16-10-x64"
  name = "OpenVPN-1"
  region = "nyc1"
  size = "512mb"
  ssh_keys = [
    "${var.ssh_fingerprint}"
  ]

  connection {
    type = "ssh"
    user = "root"
    private_key = "${file(var.privkey)}"
    agent = "false"
    timeout = "2m"
  }

  provisioner "remote-exec" {
    script = "bin/install_openvpn.sh"
  }

  provisioner "remote-exec" {
    script = "bin/install_shapeshifter-dispatcher.sh"
  }

  provisioner "file" {
    source = "etc/shapeshifter.conf"
    destination = "/etc/supervisor/conf.d/shapeshifter.conf"
  }

  provisioner "file" {
    source = "etc/server.conf"
    destination = "/etc/openvpn/server.conf"
  }

  provisioner "remote-exec" {
    script = "bin/start_openvpn.sh"
  }

  provisioner "remote-exec" {
    script = "bin/start_shapeshifter-dispatcher.sh"
  }

  provisioner "file" {
    source = "etc/before.rules.patch"
    destination = "/root/before.rules.patch"
  }

  provisioner "remote-exec" {
    script = "bin/config_firewall.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "ufw --force enable"
    ]
  }

  provisioner "local-exec" {
    command = "bin/config_client.sh ${digitalocean_droplet.OpenVPN.ipv4_address} \"${var.config_dir}\""
  }
}
