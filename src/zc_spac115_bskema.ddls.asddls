@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Bskema'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.semanticKey: ['PostId']
@AbapCatalog.extensibility: {
  extensible: true,
  dataSources: ['bog_R'],
  quota: {
    maximumFields: 500,
    maximumBytes: 50000
  }, allowNewCompositions: true  
}
define root view entity ZC_SPAC115_BSKEMA
provider contract transactional_query
as projection on ZR_SPAC115_BSKEMA as bog_R
{
  key PostID,
  Konto,
  Debet,
  Kredit,
  WorkId,
  Name,
  Department,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LastChangedAt
}
