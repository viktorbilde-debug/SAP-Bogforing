@EndUserText.label: 'Worker'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: ['WorkId']
@AbapCatalog.extensibility: {
  extensible: true,
  dataSources: ['worker'],
  quota: {
    maximumFields: 500,
    maximumBytes: 50000
  }, allowNewCompositions: true  
}
define root view entity ZC_SPAC115_BWorker
provider contract transactional_query
as projection on ZR_SPAC115_BWorker as worker
{
@EndUserText.label: 'WorkerId'
@UI.lineItem: [{ position: 10 }]
@UI.identification: [{ position: 10 }]
  key WorkId,
@EndUserText.label: 'Name'
@UI.lineItem: [{ position: 10 }]
@UI.identification: [{ position: 10 }]
  Name,
  
@EndUserText.label: 'Department'
@UI.lineItem: [{ position: 10 }]
@UI.identification: [{ position: 10 }]
  Department,
  
  LastChangedAt
}
