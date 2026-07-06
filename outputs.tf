output "private_dns_srv_records" {
  description = "All private_dns_srv_record resources"
  value       = azurerm_private_dns_srv_record.private_dns_srv_records
}
output "private_dns_srv_records_fqdn" {
  description = "List of fqdn values across all private_dns_srv_records"
  value       = [for k, v in azurerm_private_dns_srv_record.private_dns_srv_records : v.fqdn]
}
output "private_dns_srv_records_name" {
  description = "List of name values across all private_dns_srv_records"
  value       = [for k, v in azurerm_private_dns_srv_record.private_dns_srv_records : v.name]
}
output "private_dns_srv_records_record" {
  description = "List of record values across all private_dns_srv_records"
  value       = [for k, v in azurerm_private_dns_srv_record.private_dns_srv_records : v.record]
}
output "private_dns_srv_records_resource_group_name" {
  description = "List of resource_group_name values across all private_dns_srv_records"
  value       = [for k, v in azurerm_private_dns_srv_record.private_dns_srv_records : v.resource_group_name]
}
output "private_dns_srv_records_tags" {
  description = "List of tags values across all private_dns_srv_records"
  value       = [for k, v in azurerm_private_dns_srv_record.private_dns_srv_records : v.tags]
}
output "private_dns_srv_records_ttl" {
  description = "List of ttl values across all private_dns_srv_records"
  value       = [for k, v in azurerm_private_dns_srv_record.private_dns_srv_records : v.ttl]
}
output "private_dns_srv_records_zone_name" {
  description = "List of zone_name values across all private_dns_srv_records"
  value       = [for k, v in azurerm_private_dns_srv_record.private_dns_srv_records : v.zone_name]
}

