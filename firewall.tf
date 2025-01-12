resource "openstack_networking_secgroup_v2" "app" {
  name                 = local.instance_name
  description          = "Managed by Terraform"
  delete_default_rules = true
}

resource "openstack_networking_secgroup_rule_v2" "app-v4-http" {
  direction        = "ingress"
  ethertype        = "IPv4"
  protocol         = "tcp"
  port_range_min   = 80
  port_range_max   = 80
  remote_ip_prefix = "172.16.0.0/21"
  description      = "HTTP inbound from within WMCS"

  security_group_id = openstack_networking_secgroup_v2.app.id
}

