resource "openstack_networking_router_v2" "router" {
  name                = "router"
  external_network_id = "34a684b8-2889-4950-b08e-c33b3954a307"
}

resource "openstack_networking_router_interface_v2" "router-interface-public" {
  router_id = openstack_networking_router_v2.router.id
  subnet_id = openstack_networking_subnet_v2.vnet-public.id
}

resource "openstack_networking_router_interface_v2" "router-interface-prive" {
  router_id = openstack_networking_router_v2.router.id
  subnet_id = openstack_networking_subnet_v2.vnet-prive.id
}