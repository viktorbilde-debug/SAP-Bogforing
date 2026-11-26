@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS view of konti table'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZSPAC115_I_BKONTI as select from zspac115_bkonti
{
  key konto as Konto,
  beskrivelse as Beskrivelse
}
