resource "openstack_networking_secgroup_v2" "secgroup-prive" {
  name        = "secgroup-prive"
  description = "a prive security group"
}

resource "openstack_networking_secgroup_rule_v2" "prive-rule_1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "10.0.1.0/24"
  security_group_id = openstack_networking_secgroup_v2.secgroup-prive.id
}

resource "openstack_networking_secgroup_rule_v2" "prive-rule_2" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "10.0.1.0/24"
  security_group_id = openstack_networking_secgroup_v2.secgroup-prive.id
}
