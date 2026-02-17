resource "openstack_networking_network_v2" "vnet" {
  name           = "vnet"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "vnet-public" {
  name       = "vnet-public"
  network_id = openstack_networking_network_v2.vnet.id
  cidr       = "10.0.1.0/24"
  ip_version = 4
}

resource "openstack_networking_subnet_v2" "vnet-prive" {
  name       = "vnet-prive"
  network_id = openstack_networking_network_v2.vnet.id
  cidr       = "10.0.2.0/24"
  ip_version = 4
}
