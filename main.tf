terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.49.0"
    }

    cloudvps = {
      source  = "terraform.wmcloud.org/registry/cloudvps"
      version = "~> 0.1.2"
    }
  }

  required_version = "~> 1.3.6"
}

resource "openstack_compute_instance_v2" "application" {
  name            = var.resource_prefix
  image_id        = data.openstack_images_image_v2.image.id
  flavor_id       = var.instance_type
  user_data       = file("${path.module}/userdata.sh")
  security_groups = var.security_groups

  metadata = {
    terraform   = "Yes"
    environment = var.environment
  }

  network {
    uuid = var.network
  }

  lifecycle {
    ignore_changes = [
      image_id
    ]
  }
}

resource "openstack_dns_recordset_v2" "application" {
  name    = var.dns_name
  zone_id = var.dns_zone_id
  ttl     = 180
  type    = "A"
  records = [openstack_compute_instance_v2.application.access_ip_v4]
}