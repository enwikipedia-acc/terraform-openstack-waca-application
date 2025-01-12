data "openstack_images_image_v2" "image" {
  most_recent = true
  name        = var.image_name
}

data "openstack_dns_zone_v2" "rootzone" {
  name = var.dns_zone
}

data "openstack_compute_flavor_v2" "flavor" {
  vcpus    = 1
  ram      = 2048
  min_disk = 15
}

data "openstack_networking_network_v2" "network" {
  external = false
}