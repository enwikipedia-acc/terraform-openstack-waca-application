resource "openstack_dns_recordset_v2" "application" {
  name    = "${var.instance_name}.${data.openstack_dns_zone_v2.rootzone.name}"
  zone_id = data.openstack_dns_zone_v2.rootzone.id
  ttl     = 180
  type    = "A"
  records = [openstack_compute_instance_v2.application.access_ip_v4]
}
