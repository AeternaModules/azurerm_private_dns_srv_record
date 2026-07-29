variable "private_dns_srv_records" {
  description = <<EOT
Map of private_dns_srv_records, attributes below
Required:
    - name
    - private_dns_zone_id
    - ttl
    - record (block):
        - port (required)
        - priority (required)
        - target (required)
        - weight (required)
Optional:
    - tags
EOT

  type = map(object({
    name                = string
    private_dns_zone_id = string
    ttl                 = number
    tags                = optional(map(string))
    record = list(object({
      port     = number
      priority = number
      target   = string
      weight   = number
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.private_dns_srv_records : (
        length(v.record) >= 1
      )
    ])
    error_message = "Each record list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.private_dns_srv_records : (
        length(trimspace(v.name)) > 0
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
  validation {
    condition = alltrue([
      for k, v in var.private_dns_srv_records : (
        alltrue([for item in v.record : (item.priority >= 0 && item.priority <= 65535)])
      )
    ])
    error_message = "must be between 0 and 65535"
  }
  validation {
    condition = alltrue([
      for k, v in var.private_dns_srv_records : (
        alltrue([for item in v.record : (item.weight >= 0 && item.weight <= 65535)])
      )
    ])
    error_message = "must be between 0 and 65535"
  }
  validation {
    condition = alltrue([
      for k, v in var.private_dns_srv_records : (
        alltrue([for item in v.record : (item.port >= 1 && item.port <= 65535)])
      )
    ])
    error_message = "must be between 1 and 65535"
  }
  validation {
    condition = alltrue([
      for k, v in var.private_dns_srv_records : (
        alltrue([for item in v.record : (length(item.target) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.private_dns_srv_records : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 6 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

