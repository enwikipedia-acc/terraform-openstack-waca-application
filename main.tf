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
