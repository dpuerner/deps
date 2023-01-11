*"* components of interface /IWBEP/IF_MGW_ODATA_ANNOTATABL
interface /IWBEP/IF_MGW_ODATA_ANNOTATABL
  public .


  types S type CHAR1 .

  methods CREATE_ANNOTATION
    importing
      !IV_ANNOTATION_NAMESPACE type /IWBEP/MED_ANNO_NAMESPACE
    returning
      value(RO_ANNOTATION) type ref to /IWBEP/IF_MGW_ODATA_ANNOTATION
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
endinterface.