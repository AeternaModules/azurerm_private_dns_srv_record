output "private_dns_srv_records_id" {
  description = "Map of id values across all private_dns_srv_records, keyed the same as var.private_dns_srv_records"
  value       = { for k, v in azurerm_private_dns_srv_record.private_dns_srv_records : k => v.id }
}
output "private_dns_srv_records_fqdn" {
  description = "Map of fqdn values across all private_dns_srv_records, keyed the same as var.private_dns_srv_records"
  value       = { for k, v in azurerm_private_dns_srv_record.private_dns_srv_records : k => v.fqdn }
}
output "private_dns_srv_records_name" {
  description = "Map of name values across all private_dns_srv_records, keyed the same as var.private_dns_srv_records"
  value       = { for k, v in azurerm_private_dns_srv_record.private_dns_srv_records : k => v.name }
}
output "private_dns_srv_records_record" {
  description = "Map of record values across all private_dns_srv_records, keyed the same as var.private_dns_srv_records"
  value       = { for k, v in azurerm_private_dns_srv_record.private_dns_srv_records : k => v.record }
}
output "private_dns_srv_records_resource_group_name" {
  description = "Map of resource_group_name values across all private_dns_srv_records, keyed the same as var.private_dns_srv_records"
  value       = { for k, v in azurerm_private_dns_srv_record.private_dns_srv_records : k => v.resource_group_name }
}
output "private_dns_srv_records_tags" {
  description = "Map of tags values across all private_dns_srv_records, keyed the same as var.private_dns_srv_records"
  value       = { for k, v in azurerm_private_dns_srv_record.private_dns_srv_records : k => v.tags }
}
output "private_dns_srv_records_ttl" {
  description = "Map of ttl values across all private_dns_srv_records, keyed the same as var.private_dns_srv_records"
  value       = { for k, v in azurerm_private_dns_srv_record.private_dns_srv_records : k => v.ttl }
}
output "private_dns_srv_records_zone_name" {
  description = "Map of zone_name values across all private_dns_srv_records, keyed the same as var.private_dns_srv_records"
  value       = { for k, v in azurerm_private_dns_srv_record.private_dns_srv_records : k => v.zone_name }
}

