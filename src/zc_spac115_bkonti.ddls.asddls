@EndUserText.label: 'Konti'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: ['Konto']
@AbapCatalog.extensibility: {
  extensible: true,
  dataSources: ['konti'],
  quota: {
    maximumFields: 500,
    maximumBytes: 50000
  }, allowNewCompositions: true  
}
define root view entity ZC_SPAC115_BKONTI
provider contract transactional_query
as projection on ZR_SPAC115_BKONTI as konti
{
@EndUserText.label: 'Konto'
@UI.lineItem: [{ position: 10 }]
@UI.identification: [{ position: 10 }]
  key Konto,
@EndUserText.label: 'Beskrivelse'
@UI.lineItem: [{ position: 10 }]
@UI.identification: [{ position: 10 }]
  beskrivelse,
  
  LastChangedAt
}
