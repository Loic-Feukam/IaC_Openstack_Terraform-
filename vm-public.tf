
resource "openstack_networking_port_v2" "public-port" {
  name               = "public-port"
  network_id         = openstack_networking_network_v2.vnet.id
  admin_state_up     = "true"
  security_group_ids = [openstack_networking_secgroup_v2.secgroup-public.id]

  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.vnet-public.id
    ip_address = "10.0.1.10"
  }
}

resource "openstack_compute_instance_v2" "vm-public" {
  name            = "vm-public"
  image_id        = "359e3ea8-a295-496f-9b41-06db46b23e14"
  key_pair        = openstack_compute_keypair_v2.keypair1.name
  flavor_name     = "a1-ram2-disk20-perf1"
  security_groups = [openstack_networking_secgroup_v2.secgroup-public.name]

  network {
    port = openstack_networking_port_v2.public-port.id
  }
}

resource "openstack_compute_keypair_v2" "keypair1" {
  name       = "pubkeypair1"
  public_key = file("~/.ssh/id_rsa.pub")

}

resource "openstack_networking_floatingip_v2" "fip" {
  pool = "ext-floating1"
}

# resource "openstack_compute_floatingip_associate_v2" "assoc" {
#  floating_ip = openstack_networking_floatingip_v2.fip.address
#  instance_id = openstack_compute_instance_v2.vm-public.id
# }

data "openstack_networking_port_v2" "public-port" {
  device_id  = openstack_compute_instance_v2.vm-public.id
}

resource "openstack_networking_floatingip_associate_v2" "fip" {
  floating_ip = openstack_networking_floatingip_v2.fip.address
  port_id     = data.openstack_networking_port_v2.public-port.id
}