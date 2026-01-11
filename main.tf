resource "azurerm_private_dns_srv_record" "private_dns_srv_records" {
  for_each = var.private_dns_srv_records

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
  zone_name           = each.value.zone_name
  tags                = each.value.tags

  record {
    port     = each.value.record.port
    priority = each.value.record.priority
    target   = each.value.record.target
    weight   = each.value.record.weight
  }
}

