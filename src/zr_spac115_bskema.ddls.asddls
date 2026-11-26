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

define root view entity ZR_SPAC115_BSKEMA as select from zspac115_bskema as bog

  association [1..1] to zspac115_bkonti as _Mkonti  on $projection.Konto = _Mkonti.konto
  association [1..1] to zspac115_bworker as _Mworker  on $projection.WorkId = _Mworker.worker_id
  //association to parent ZR_SPAC115_Trans as _Transaction
    //on $projection.TransId = _Transaction.Transid
{ //key transid as TransId,
  key bog.posting_id as PostID,
  bog.konto as Konto,
  bog.debet as Debet,
  bog.kredit as Kredit,
  bog.worker_id as WorkId,
  bog.name      as Name,
  bog.department as Department, 
  local_created_by as LocalCreatedBy,
  local_created_at as LocalCreatedAt,
  local_last_changed_by as LocalLastChangedBy,
  local_last_changed_at as LocalLastChangedAt,
  last_changed_at as LastChangedAt,
  _Mkonti,
  _Mworker
}
