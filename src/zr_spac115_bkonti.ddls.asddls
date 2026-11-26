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

define root view entity ZR_SPAC115_BKONTI as select from zspac115_bkonti as konti

{
  key konti.konto as Konto,
  konti.beskrivelse as beskrivelse,
  local_created_by as LocalCreatedBy,
  local_created_at as LocalCreatedAt,
  local_last_changed_by as LocalLastChangedBy,
  local_last_changed_at as LocalLastChangedAt,
  last_changed_at as LastChangedAt
}
