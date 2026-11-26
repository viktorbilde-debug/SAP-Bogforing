@EndUserText.label: 'projection transaktion'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: ['Transid']
@AbapCatalog.extensibility: {
  extensible: true,
  dataSources: ['trans'],
  quota: {
    maximumFields: 500,
    maximumBytes: 50000
  }, allowNewCompositions: true  
}
define root view entity ZC_SPAC115_Trans
provider contract transactional_query
as projection on ZR_SPAC115_Trans as Trans
{
  key Transid,
  Time,
  WorkerId,
  Name,
  LocalCreatedBy,
  LocalCreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChangedAt
  /* Associations */
 /* _skema : redirected to composition child ZC_SPAC115_BSKEMA */
}
