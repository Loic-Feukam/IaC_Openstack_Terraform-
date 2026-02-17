resource "openstack_blockstorage_volume_v3" "storage" {
  name = "storage"
  size = 1
}

resource "openstack_compute_volume_attach_v2" "volume" {
  instance_id = openstack_compute_instance_v2.vm-public.id
  volume_id   = openstack_blockstorage_volume_v3.storage.id
}