
resource "openstack_networking_port_v2" "prive-port" {
  name               = "prive-port"
  network_id         = openstack_networking_network_v2.vnet.id
  admin_state_up     = "true"
  security_group_ids = [openstack_networking_secgroup_v2.secgroup-prive.id]

  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.vnet-prive.id
    ip_address = "10.0.2.10"
  }
}

resource "openstack_compute_instance_v2" "vm-prive" {
  name            = "vm-prive"
  image_id        = "359e3ea8-a295-496f-9b41-06db46b23e14"
  key_pair        = openstack_compute_keypair_v2.keypair2.name
  flavor_name     = "a1-ram2-disk20-perf1"
  security_groups = [openstack_networking_secgroup_v2.secgroup-prive.name]

  network {
    port = openstack_networking_port_v2.prive-port.id
  }
}

resource "openstack_compute_keypair_v2" "keypair2" {
  name       = "pubkeypair2"
  public_key = file("~/.ssh/id_rsa-vmprive.pub")

}
