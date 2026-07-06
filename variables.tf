variable "private_dns_srv_records" {
  description = <<EOT
Map of private_dns_srv_records, attributes below
Required:
    - name
    - resource_group_name
    - ttl
    - zone_name
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
    resource_group_name = string
    ttl                 = number
    zone_name           = string
    tags                = optional(map(string))
    record = object({
      port     = number
      priority = number
      target   = string
      weight   = number
    })
  }))
  validation {
    condition = alltrue([
      for k, v in var.private_dns_srv_records : (
        length(v.zone_name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.private_dns_srv_records : (
        v.record.priority >= 0 && v.record.priority <= 65535
      )
    ])
    error_message = "must be between 0 and 65535"
  }
  validation {
    condition = alltrue([
      for k, v in var.private_dns_srv_records : (
        v.record.weight >= 0 && v.record.weight <= 65535
      )
    ])
    error_message = "must be between 0 and 65535"
  }
  validation {
    condition = alltrue([
      for k, v in var.private_dns_srv_records : (
        v.record.port >= 1 && v.record.port <= 65535
      )
    ])
    error_message = "must be between 1 and 65535"
  }
  validation {
    condition = alltrue([
      for k, v in var.private_dns_srv_records : (
        length(v.record.target) > 0
      )
    ])
    error_message = "must not be empty"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_private_dns_srv_record's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    validate.LowerCasedString: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: ttl
  #   source:    validation.IntBetween(1, math.MaxInt32) - bound(s) not a literal int (e.g. a named constant like math.MaxInt32) - resolve manually
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

