@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'datadefitnion for transaktion table'
@AbapCatalog.extensibility: {
  extensible: true,
  allowNewDatasources: false,
  quota: {
    maximumFields: 500,
    maximumBytes: 50000
  },
  allowNewCompositions: true
}
define root view entity ZR_SPAC115_Trans
 as select from zspac115_trans
 // composition [0..*] of ZR_SPAC115_BSKEMA as _skema
{
  key transid as Transid,
  time       as Time,
  worker_id as WorkerId,
  name as Name,
  local_created_by as LocalCreatedBy,
  local_created_at as LocalCreatedAt,
  local_last_changed_by as LocalLastChangedBy,
  local_last_changed_at as LocalLastChangedAt,
  last_changed_at as LastChangedAt
 // _skema // Make association public
}
