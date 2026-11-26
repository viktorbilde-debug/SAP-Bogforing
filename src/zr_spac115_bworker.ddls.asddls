@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Datadefinition'
@AbapCatalog.extensibility: {
  extensible: true,
  allowNewDatasources: false,
  quota: {
    maximumFields: 500,
    maximumBytes: 50000
  },
  allowNewCompositions: true
}

define root view entity ZR_SPAC115_BWorker as select from zspac115_bworker as worker

{
  key worker.worker_id as WorkId,
  worker.name as Name,
  worker.department as Department,
  local_created_by as LocalCreatedBy,
  local_created_at as LocalCreatedAt,
  local_last_changed_by as LocalLastChangedBy,
  local_last_changed_at as LocalLastChangedAt,
  last_changed_at as LastChangedAt
}
