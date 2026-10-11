data "oci_data_safe_audit_archive_retrievals" "data_safe_audit_archive_retrievals_lookup" {
  for_each = var.data_safe_audit_archive_retrievals_lookup

  compartment_id             = each.value.compartment_id
  access_level               = each.value.access_level
  audit_archive_retrieval_id = each.value.audit_archive_retrieval_id
  compartment_id_in_subtree  = each.value.compartment_id_in_subtree
  display_name               = each.value.display_name
  state                      = each.value.state
  target_database_group_id   = each.value.target_database_group_id
  target_id                  = each.value.target_id
  time_of_expiry             = each.value.time_of_expiry

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

