*"* components of interface /IWBEP/IF_MGW_ODATA_ANNOTATION
interface /IWBEP/IF_MGW_ODATA_ANNOTATION
  public .


  types S type CHAR1 .

  data NAMESPACE type /IWBEP/MED_ANNO_NAMESPACE read-only .

  methods ADD
    importing
      !IV_KEY type /IWBEP/MED_ANNOTATION_KEY
      !IV_VALUE type /IWBEP/MED_ANNOTATION_VALUE
      !IV_REF_ANNO type ABAP_BOOL default ABAP_TRUE .
  methods ADD_CHILD
    importing
      !IV_PARENT_KEY type /IWBEP/MED_ANNOTATION_KEY
      !IV_KEY type /IWBEP/MED_ANNOTATION_KEY
      !IV_VALUE type /IWBEP/MED_ANNOTATION_VALUE .
endinterface.