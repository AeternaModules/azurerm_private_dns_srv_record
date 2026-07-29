resource "azurerm_private_dns_srv_record" "private_dns_srv_records" {
  for_each = var.private_dns_srv_records

  name                = each.value.name
  private_dns_zone_id = each.value.private_dns_zone_id
  ttl                 = each.value.ttl
  tags                = each.value.tags

  dynamic "record" {
    for_each = each.value.record
    content {
      port     = record.value.port
      priority = record.value.priority
      target   = record.value.target
      weight   = record.value.weight
    }
  }
}

