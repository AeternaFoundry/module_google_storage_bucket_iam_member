variable "storage_bucket_iam_members" {
  description = <<EOT
Map of storage_bucket_iam_members, attributes below
Required:
    - bucket
    - member
    - role
Optional:
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
    - timeouts (block):
        - create (optional)
EOT

  type = map(object({
    bucket = string
    member = string
    role   = string
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
    timeouts = optional(object({
      create = optional(string)
    }))
  }))
}

