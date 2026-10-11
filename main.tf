resource "google_storage_bucket_iam_member" "storage_bucket_iam_members" {
  for_each = var.storage_bucket_iam_members

  bucket = each.value.bucket
  member = each.value.member
  role   = each.value.role

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
    }
  }
}

