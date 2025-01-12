resource "openstack_compute_instance_v2" "application" {
  name = local.instance_name

  image_id  = data.openstack_images_image_v2.image.id
  flavor_id = data.openstack_compute_flavor_v2.flavor.id

  user_data = file("${path.module}/userdata.sh")
  security_groups = flatten([[
    "${var.resource_prefix}default",
    openstack_networking_secgroup_v2.app.name
  ], var.security_groups])

  metadata = {
    terraform   = "Yes"
    environment = var.environment
  }

  network {
    uuid = data.openstack_networking_network_v2.network.id
  }

  lifecycle {
    ignore_changes = [
      image_id
    ]
  }
}
