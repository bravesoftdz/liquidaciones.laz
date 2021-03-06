unit liqdm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, memds, FileUtil, LResources, Forms, Controls, Dialogs,
  IBDatabase, IBQuery, IBCustomDataSet, IBSQLMonitor, IBEvents, IBSQL,
  ZConnection, ZDataset, ZSequence, ZSqlProcessor, ZIBEventAlerter, ZSqlMonitor,
  ZSqlUpdate;

type

  { Tdm }

  Tdm = class(TDataModule)
    autorizaQRYOPCION: TStringField;
    autorizaQRYPLUOPCION: TLongintField;
    autorizaQRYPLUPERFIL: TLongintField;
    BodegaQRYACTIVA: TStringField;
    BodegaQRYCIUDAD: TStringField;
    BodegaQRYCODIGO: TStringField;
    BodegaQRYDIRECCION1: TStringField;
    BodegaQRYDIR_IP: TIBStringField;
    BodegaQRYENCARGADO: TStringField;
    BodegaQRYFAX: TStringField;
    BodegaQRYLOCAL: TStringField;
    BodegaQRYLOCATIONDB: TIBStringField;
    BodegaQRYNOMBRE: TStringField;
    BodegaQRYPLUBODEGA: TLongintField;
    BodegaQRYPLUEMPRESAS: TLongintField;
    BodegaQRYTELEFONO: TStringField;
    BVendedorQRYCARGO: TStringField;
    BVendedorQRYCCARGO: TStringField;
    BVendedorQRYCCELULAR: TStringField;
    BVendedorQRYCDEPTO: TStringField;
    BVendedorQRYCDIRECCION: TStringField;
    BVendedorQRYCELULAR: TStringField;
    BVendedorQRYCEL_PROP: TStringField;
    BVendedorQRYCEXTENCION: TLongintField;
    BVendedorQRYCLUGAR_TRAB: TStringField;
    BVendedorQRYCNOMBRE: TStringField;
    BVendedorQRYCOD_VENDEDOR: TStringField;
    BVendedorQRYCOMISIONES: TFloatField;
    BVendedorQRYCOMP_CEL: TStringField;
    BVendedorQRYCONCEPTO: TStringField;
    BVendedorQRYCORRELATIVO: TLongintField;
    BVendedorQRYCPLUPROFESION: TLongintField;
    BVendedorQRYCSEXO: TStringField;
    BVendedorQRYCSUELDO: TFloatField;
    BVendedorQRYCTELEFONO: TStringField;
    BVendedorQRYCTEL_OFI: TStringField;
    BVendedorQRYCTIME_TRAB: TStringField;
    BVendedorQRYCUOTA: TFloatField;
    BVendedorQRYDEPTO_TRABAJO: TStringField;
    BVendedorQRYDIRECCION: TStringField;
    BVendedorQRYDIRECCION_TRABAJO: TStringField;
    BVendedorQRYDUI: TStringField;
    BVendedorQRYEDAD: TLongintField;
    BVendedorQRYESTADO_CIVIL: TLongintField;
    BVendedorQRYESTAT_CASA: TLongintField;
    BVendedorQRYEXT_TRABAJO: TLongintField;
    BVendedorQRYLUGAR_TRAB: TStringField;
    BVendedorQRYNIT: TStringField;
    BVendedorQRYNIT_NEG: TStringField;
    BVendedorQRYNOMBRE: TStringField;
    BVendedorQRYNUM_HIJOS: TStringField;
    BVendedorQRYOTROS_ING: TFloatField;
    BVendedorQRYPLUPROFESION: TLongintField;
    BVendedorQRYPLUVENDEDOR: TLongintField;
    BVendedorQRYPROPIETARIO: TStringField;
    BVendedorQRYSEXO: TStringField;
    BVendedorQRYSUCURSAL: TStringField;
    BVendedorQRYSUELDO: TFloatField;
    BVendedorQRYTELEFONO: TStringField;
    BVendedorQRYTEL_PROP: TStringField;
    BVendedorQRYTEL_TRABAJO: TStringField;
    BVendedorQRYTIME_TRAB: TStringField;
    BVendedorQRYTIME_VIVIR: TStringField;
    BVendedorQRYTRABAJO_OBSERVACION: TStringField;
    BodegaDS: TDatasource;
    CtasQRYCODIGO: TStringField;
    CtasQRYNOMBRE: TStringField;
    CtasQRYPLUCUENTA: TLongintField;
    fbdb: TIBDatabase;
    CtasQRY: TIBQuery;
    Eventos: TIBEvents;
    InsResSQL: TIBSQL;
    InvSQL: TIBSQL;
    IBTransInv: TIBTransaction;
    vendedorQRY: TIBQuery;
    ZSQLMonitor1: TIBSQLMonitor;
    myqry3: TIBQuery;
    myqry2: TIBQuery;
    myqry: TIBQuery;
    EmpresaQRY: TIBQuery;
    BodegaQRY: TIBQuery;
    autorizaQRY: TIBQuery;
    LBodegasQRY: TIBQuery;
    LBodegasQRYACTIVA: TIBStringField;
    LBodegasQRYCIUDAD: TIBStringField;
    LBodegasQRYCODIGO: TIBStringField;
    LBodegasQRYDIRECCION1: TIBStringField;
    LBodegasQRYDIR_IP: TIBStringField;
    LBodegasQRYENCARGADO: TIBStringField;
    LBodegasQRYFAX: TIBStringField;
    LBodegasQRYLOCAL: TIBStringField;
    LBodegasQRYLOCATIONDB: TIBStringField;
    LBodegasQRYNOMBRE: TIBStringField;
    LBodegasQRYPLUBODEGA: TIntegerField;
    LBodegasQRYPLUEMPRESAS: TIntegerField;
    LBodegasQRYTELEFONO: TIBStringField;
    UserQRY: TIBQuery;
    PeriodoQRY: TIBQuery;
    IBTransaction1: TIBTransaction;
    PeriodoDS: TDatasource;
    INVENTARIOQRYCOSTOANTERIOR: TFloatField;
    INVENTARIOQRYCOSTOPROMEDIO: TFloatField;
    INVENTARIOQRYDEBE: TFloatField;
    INVENTARIOQRYENTRADA: TFloatField;
    INVENTARIOQRYEXISTENCIA: TFloatField;
    INVENTARIOQRYFECHA: TDateTimeField;
    INVENTARIOQRYFECHA_REAL: TDateTimeField;
    INVENTARIOQRYHABER: TFloatField;
    INVENTARIOQRYITEM: TLongintField;
    INVENTARIOQRYOBSERVACIONES: TStringField;
    INVENTARIOQRYPC: TStringField;
    INVENTARIOQRYPLUCOMPRA: TLongintField;
    INVENTARIOQRYPLUDOCCLIENTES: TLongintField;
    INVENTARIOQRYPLUMOVINV: TLongintField;
    INVENTARIOQRYPLUPRODUCTO: TLongintField;
    INVENTARIOQRYPLURETACEO: TLongintField;
    INVENTARIOQRYPLUSUCURSALES: TLongintField;
    INVENTARIOQRYREFERENCIA: TStringField;
    INVENTARIOQRYSALDO: TFloatField;
    INVENTARIOQRYSALIDA: TFloatField;
    INVENTARIOQRYTIPO: TStringField;
    INVENTARIOQRYUSUARIO: TStringField;
    MSUCURSALDQRYCANTIDAD: TLongintField;
    MSUCURSALDQRYCODIGO1: TStringField;
    MSUCURSALDQRYCOSTOPROMEDIO: TFloatField;
    MSUCURSALDQRYDESCRIPCION1: TStringField;
    MSUCURSALDQRYITEM: TLongintField;
    MSUCURSALDQRYOBSERVACION: TStringField;
    MSUCURSALDQRYPENDIENTE: TLongintField;
    MSUCURSALDQRYPLUEMPRESA: TLongintField;
    MSUCURSALDQRYPLUMOVSUCURSAL: TLongintField;
    MSUCURSALDQRYPLUPRODUCTO: TLongintField;
    MSUCURSALDQRYULTIMOCOSTO: TFloatField;
    MSUCURSALDQRYUNITARIO: TFloatField;
    EmpresaDS: TDatasource;
    EmpresaQRYCODIGO: TStringField;
    EmpresaQRYNOMBRE: TStringField;
    EmpresaQRYPLUEMPRESA: TLongintField;
    MSucursalMQRYANULADO: TStringField;
    MSucursalMQRYCODIGO: TLongintField;
    MSucursalMQRYCVEND: TStringField;
    MSucursalMQRYEGRESO: TStringField;
    MSucursalMQRYENTREGADO: TStringField;
    MSucursalMQRYENVIADO: TStringField;
    MSucursalMQRYENVIO: TLongintField;
    MSucursalMQRYFECHA: TDateTimeField;
    MSucursalMQRYFECHA_ENVIADO: TDateTimeField;
    MSucursalMQRYFECHA_PROCESADO: TDateTimeField;
    MSucursalMQRYINGRESO: TStringField;
    MSucursalMQRYNOMBRE: TStringField;
    MSucursalMQRYOBSERVACIONES: TStringField;
    MSucursalMQRYPLUEMPLEADOS: TLongintField;
    MSucursalMQRYPLUEMPLEADOS_PROCESADO: TLongintField;
    MSucursalMQRYPLUEMPRESA: TLongintField;
    MSucursalMQRYPLUMOVSUCURSAL: TLongintField;
    MSucursalMQRYPLUREQSUCURSAL: TLongintField;
    MSucursalMQRYPLUSUCURSAL: TLongintField;
    MSucursalMQRYPLUSUCURSAL2: TLongintField;
    MSucursalMQRYPOST: TStringField;
    MSucursalMQRYPREPARAR: TStringField;
    MSucursalMQRYPROCESADO: TStringField;
    MSucursalMQRYRECIBIDO: TStringField;
    MSucursalMQRYTIPO: TStringField;
    InsResSQLENTRADA: TFloatField;
    InsResSQLFECHA: TDateField;
    InsResSQLITEM: TLongintField;
    InsResSQLOBSERVACIONES: TStringField;
    InsResSQLPLUBODEGAS: TLongintField;
    InsResSQLPLUDOCCLIENTES: TLongintField;
    InsResSQLPLUPRODUCTO: TLongintField;
    InsResSQLREFERENCIA: TStringField;
    InsResSQLRESERVADOS: TFloatField;
    InsResSQLSALIDA: TFloatField;
    InsResSQLTIPO: TStringField;
    PeriodoQRYDESCRIPCION: TStringField;
    PeriodoQRYFECHAFINAL: TDateTimeField;
    PeriodoQRYFECHAINICIAL: TDateTimeField;
    PeriodoQRYFECHA_CREA: TDateTimeField;
    PeriodoQRYFECHA_MOD: TDateTimeField;
    PeriodoQRYID: TLongintField;
    PeriodoQRYPLUEMPRESA: TLongintField;
    PeriodoQRYPLUSUARIO_CREA: TLongintField;
    PeriodoQRYPLUSUARIO_MOD: TLongintField;
    PeriodoQRYPOST: TStringField;
    UserQRYACTIVO: TStringField;
    UserQRYCCLAVE: TIBStringField;
    UserQRYCLAVE: TStringField;
    UserQRYFECHA_MOD: TDateField;
    UserQRYNOMBRE: TIBStringField;
    UserQRYPLUPERFIL: TLongintField;
    UserQRYPLUSUARIO: TLongintField;
    UserQRYUSUARIO: TStringField;
    vendedorQRYCODIGO: TStringField;
    vendedorQRYNOMBRE: TStringField;
    vendedorQRYPLUEMPLEADOS: TLongintField;
    vendedorQRYPLUEMPRESAS: TLongintField;
    procedure DataModuleCreate(Sender: TObject);
    procedure fbDBAfterConnect(Sender: TObject);
    procedure MSUCURSALDQRYCalcFields(DataSet: TDataSet);
    procedure MSUCURSALDQRYCODIGO1Validate(Sender: TField);
    procedure MSUCURSALDQRYCODIGOValidate(Sender: TField);
    procedure MSucursalDQRYNewRecord(DataSet: TDataSet);
    procedure MSUCURSALMDSDataChange(Sender: TObject; Field: TField);
    procedure MSucursalMQRYCalcFields(DataSet: TDataSet);
    procedure MSucursalMQRYCVENDValidate(Sender: TField);
    procedure MSucursalMQRYNewRecord(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  dm: Tdm;

implementation

uses procesos,liqmenuform;
{ Tdm }



procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  try
        // verifico que exista el archivo ini
if (Leer_Ini()= true) and ( GSBD <> '')then
begin


        fbdb.DatabaseName:=(GSBD);
        fbDB.Params.Add('user_name=SYSDBA');
        fbDB.Params.Add('password='+serverClave);
        empresaqry.Active:=true;
        Bodegaqry.Active:= true;
        periodoqry.Close;
        periodoqry.Open;


end
else
begin

if  FileExists (GSBD) = false then
begin
showmessage('Base de datos..."'+GSBD+'", no existe, Verifique!!!');

end;

menufrm.Close;
end;

EXCEPT
raise;
END;


  UserQRY.Active := true;
  //BodegaQry.Active := true;
end;

procedure Tdm.fbDBAfterConnect(Sender: TObject);
begin

end;


procedure Tdm.MSUCURSALDQRYCalcFields(DataSet: TDataSet);
begin

end;

procedure Tdm.MSUCURSALDQRYCODIGO1Validate(Sender: TField);
begin
  MYQRY.Close;
  MYQRY.SQL.Clear;
  MYQRY.SQL.ADD('select PRODUCTO.BC AS BC,PRODUCTO.CODIGO AS CODIGO,');
  MYQRY.SQL.ADD('PRODUCTO.DESCRIPCION AS DESCRIPCION,PRODUCTO.PRECIO AS PRECIO,');
  MYQRY.SQL.ADD('PRODUCTO.PRECIODISTRIBUIDOR AS PRECIODISTRIBUDOR,');
  MYQRY.SQL.ADD('PRODUCTO.PRECIOESPECIAL AS PRECIOESPECIAL,PRODUCTO.COSTOPROMEDIO,');
  MYQRY.SQL.ADD('PRODUCTO.UNIDADMEDIDA AS UNIDADMEDIDA, PRODUCTO.EXISTENCIA AS EXISTENCIA');
  MYQRY.SQL.ADD(' from PRODUCTO WHERE PLUEMPRESAS='+DM.EMPRESAQRYPLUEMPRESA.ASSTRING+' AND ');
  MYQRY.SQL.Add(' CODIGO=:CODIGO AND');
  MYQRY.SQL.ADD(' ACTIVO=''T''  ');
  MYQRY.ParamByName('CODIGO').value := MSUCURSALDQRYCODIGO1.Value;
  MYQRY.Open;

  IF MYQRY.IsEmpty THEN
  BEGIN
   SHOWMESSAGE('Codigo de producto no existe!!');
   exit;
  end
  else
  begin

     MSUCURSALDQRYDESCRIPCION1.Value   := MYQRY.FieldByName('DESCRIPCION').Value;
     MSUCURSALDQRYUNITARIO.Value      := MYQRY.FieldByName('PRECIO').Value;
     MSUCURSALDQRYPLUPRODUCTO.Value   := MYQRY.FieldByName('PLUPRODUCTO').Value;
     MSUCURSALDQRYCOSTOPROMEDIO.Value := MYQRY.FieldByName('COSTOPROMEDIO').Value;


  end;
end;

procedure Tdm.MSUCURSALDQRYCODIGOValidate(Sender: TField);
begin



end;

procedure Tdm.MSucursalDQRYNewRecord(DataSet: TDataSet);
begin

  //MSUCURSALDQRYPLUMOVSUCURSAL.Value:= MSUCURSALMQRYPLUMOVSUCURSAL.Value;
   MSUCURSALDQRYCANTIDAD.Value:= 1;
end;

procedure Tdm.MSUCURSALMDSDataChange(Sender: TObject; Field: TField);
begin

end;

procedure Tdm.MSucursalMQRYCalcFields(DataSet: TDataSet);
begin
    IF MsucursalMQrypost.Value = 'T' then
       MSucursalMQryprocesado.Value := '**Procesado'
       else
       MSucursalMQryprocesado.Value := 'SinProcesar';

end;

procedure Tdm.MSucursalMQRYCVENDValidate(Sender: TField);
begin
    DM.myqry.Close;
    DM.myqry.SQL.Clear;
    DM.myqry.SQL.Add('select pluempleados,codigo,nombre from empleados where codigo like :codigo ');
    DM.myqry.SQL.Add('  and plusucursal=:plusucursal ');
    DM.myqry.ParamByName('codigo').Value := DM.MsucursalMqrycvend.Value;
    DM.myqry.ParamByName('plusucursal').Value := DM.bodegaqryplubodega.Value;
    DM.myqry.Open;


    if DM.myqry.IsEmpty then
    begin
       showmessage('Vendedor no Existe, o No pertenes a esta Sucursal!!');
       exit;

    end
    else
    begin

      DM.MSucursalMQrypluempleados.value := DM.myqry.FieldByName('pluempleados').value;
      DM.MSucursalMQrynombre.value := DM.myqry.FieldByName('nombre').value;

    end;



end;

procedure Tdm.MSucursalMQRYNewRecord(DataSet: TDataSet);
var
i:integer;
begin

    myqry.Close;
    myqry.SQL.Clear;
    myqry.SQL.Add('select max(codigo) codigo from Mov_SucursalM where pluempresa=:pluempresa ');
    myqry.ParamByName('pluempresa').Value := EmpresaQrypluempresa.Value;
    myqry.Open;

    if myqry.fieldbyname('codigo').Value > 0 then
      i:= myqry.fieldbyname('codigo').Value +1
      else i:= 1;


    MSucursalMQryCodigo.Value := i;
    MSucursalMQrypluempresa.Value := EmpresaQrypluempresa.Value;
    MSucursalMQryplusucursal.Value:= BodegaQryplubodega.Value;
    MSucursalMqryfecha.Value:= now;

end;

initialization
  {$I liqdm.lrs}

end.

