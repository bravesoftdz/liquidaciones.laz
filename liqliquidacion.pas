unit liqLiquidacion;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, FileUtil, DBDateTimePicker, LResources, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, StdCtrls, DbCtrls, DBGrids, Buttons, LR_Class,
  LR_Desgn, LR_DBSet, frametools, ComCtrls, db, LCLType, Menus, IBQuery,
  IBUpdateSQL, IBCustomDataSet, IBSQL;


type

  { TliquidFRM }

  TliquidFRM = class(TForm)
    BitBtn1: TBitBtn;
    btnBuscar: TSpeedButton;
    btnBuscaVend: TSpeedButton;
    btnprocesar: TSpeedButton;
    btnDESprocesar: TSpeedButton;
    canalQRYCANAL: TStringField;
    canalQRYIDCANAL: TLongintField;
    Datasource1: TDatasource;
    LIQUIDDQRYPRECIO: TCurrencyField;
    PRECIOSQL: TIBSQL;
    prodQRY2BC: TIntegerField;
    prodQRY2CODIGO: TIBStringField;
    prodQRY2DESCRIPCION: TIBStringField;
    prodQRY2PLUPRODUCTO: TIntegerField;
    prodQRY2PORCENTAJE_PRECIO: TFloatField;
    prodQRY2PRECIO: TFloatField;
    prodQRY2PRECIO_CANAL: TIBStringField;
    rptMovDS2: TDatasource;
    EDTFECHA: TDBDateTimePicker;
    DBGrid1: TDBGrid;
    DBText3: TDBText;
    fpagods: TDatasource;
    frDBDataSet1: TfrDBDataSet;
    frDBDataSet2: TfrDBDataSet;
    frfpago: TfrDBDataSet;
    canalQRY: TIBQuery;
    lrpt2: TfrReport;
    rptMOVqry2: TIBQuery;
    liquidAntQRY: TIBQuery;
    LIQUIDDQRY2: TIBQuery;
    LIQUIDDSQL: TIBUpdateSQL;
    LIQUIDDQRY: TIBQuery;
    LIQUIDDQRYMONTO_COMISION: TIBBCDField;
    LIQUIDDQRYPORC_COMISION: TIBBCDField;
    LIQUIDDQRYPOR_COMISION: TIBBCDField;
    prodQRY2: TIBQuery;
    prodQRY: TIBQuery;
    RptFpago: TIBQuery;
    RptFpagoTIPO: TIBStringField;
    rptMOVqry: TIBQuery;
    rptMOVqry2BODEGA: TIBStringField;
    rptMOVqry2CODVEND: TIBStringField;
    rptMOVqry2DOC: TIntegerField;
    rptMOVqry2EMPRESA: TIBStringField;
    rptMOVqry2estatus1: TStringField;
    rptMOVqry2FECHA: TDateField;
    rptMOVqry2PLULIQUIDACION: TIntegerField;
    rptMOVqry2SUPERVISOR: TIBStringField;
    rptMOVqry2TOTALES: TIBBCDField;
    rptMOVqry2USUARIO: TIBStringField;
    rptMOVqry2VENDEDOR: TIBStringField;
    vendedoresQRY: TIBQuery;
    LIQUIDMQRY: TIBQuery;
    LIQUIDMQRYBODEGA: TIBStringField;
    LIQUIDMQRYCHEQUE: TIBBCDField;
    LIQUIDMQRYCODIGO: TIntegerField;
    LIQUIDMQRYCSUPER: TIntegerField;
    LIQUIDMQRYCVEND: TIBStringField;
    LIQUIDMQRYDIFERENCIA: TIBBCDField;
    LIQUIDMQRYEFECTIVO: TIBBCDField;
    LIQUIDMQRYestatus: TStringField;
    LIQUIDMQRYFECHA: TDateField;
    LIQUIDMQRYFECHA_CREA: TDateTimeField;
    LIQUIDMQRYNOMBRE: TIBStringField;
    LIQUIDMQRYOBSERVACION: TIBStringField;
    LIQUIDMQRYPLUBODEGA: TIntegerField;
    LIQUIDMQRYPLUEMPRESA: TIntegerField;
    LIQUIDMQRYPLULIQUIDACION: TIntegerField;
    LIQUIDMQRYPLULIQUIDACION2: TIntegerField;
    LIQUIDMQRYPLUSUARIO: TIntegerField;
    LIQUIDMQRYPLUSUPERVISOR: TIntegerField;
    LIQUIDMQRYPLUVENDEDOR: TIntegerField;
    LIQUIDMQRYPOST: TIBStringField;
    LIQUIDMQRYREMESA: TIBBCDField;
    LIQUIDMQRYSUPNOMBRE: TIBStringField;
    LIQUIDMQRYTOTAL: TIBBCDField;
    LIQUIDMSQL: TIBUpdateSQL;
    LIQUIDDQRY2CODIGO: TStringField;
    LIQUIDDQRY2DESCRIPCION: TStringField;
    LIQUIDDQRY2DESCUENTO: TFloatField;
    LIQUIDDQRY2DEVOLUCION: TFloatField;
    LIQUIDDQRY2FINAL: TFloatField;
    LIQUIDDQRY2FISICO: TFloatField;
    LIQUIDDQRY2INICIAL: TFloatField;
    LIQUIDDQRY2MONTO_COMISION: TFloatField;
    LIQUIDDQRY2PED_BODEGA: TFloatField;
    LIQUIDDQRY2PED_RUTA: TFloatField;
    LIQUIDDQRY2PLULIQUIDACION: TLongintField;
    LIQUIDDQRY2PLUPRODUCTO: TLongintField;
    LIQUIDDQRY2PORC_COMISION: TFloatField;
    LIQUIDDQRY2POR_COMISION: TFloatField;
    LIQUIDDQRY2PRECIO: TFloatField;
    LIQUIDDQRY2SALDO: TFloatField;
    LIQUIDDQRY2SUBTOTAL: TFloatField;
    LIQUIDDQRY2TOTAL: TFloatField;
    LIQUIDDQRY2TRANSFER: TFloatField;
    LIQUIDDQRYCODIGO: TStringField;
    LIQUIDDQRYDESCRIPCION: TStringField;
    LIQUIDDQRYDESCUENTO: TFloatField;
    LIQUIDDQRYDEVOLUCION: TFloatField;
    LIQUIDDQRYFINAL: TFloatField;
    LIQUIDDQRYFISICO: TFloatField;
    LIQUIDDQRYINICIAL: TFloatField;
    LIQUIDDQRYPED_BODEGA: TFloatField;
    LIQUIDDQRYPED_RUTA: TFloatField;
    LIQUIDDQRYPLULIQUIDACION: TLongintField;
    LIQUIDDQRYPLUPRODUCTO: TLongintField;
    LIQUIDDQRYSALDO: TFloatField;
    LIQUIDDQRYSUBTOTAL: TFloatField;
    LIQUIDDQRYTOTAL: TFloatField;
    LIQUIDDQRYTRANSFER: TFloatField;
    liquidDS: TDatasource;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label4: TLabel;
    LIQUIDMDS: TDatasource;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBMemo1: TDBMemo;
    DBText1: TDBText;
    DBText2: TDBText;
    edtcodigo: TDBEdit;
    edtVendedor: TDBEdit;
    GRIDDET: TDBGrid;
    GroupBox4: TGroupBox;
    Label10: TLabel;
    Label37: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LIQUIDMQRY2BODEGA: TStringField;
    LIQUIDMQRY2CHEQUE: TFloatField;
    LIQUIDMQRY2CODIGO: TLongintField;
    LIQUIDMQRY2CSUPER: TLongintField;
    LIQUIDMQRY2CVEND: TStringField;
    LIQUIDMQRY2DIFERENCIA: TFloatField;
    LIQUIDMQRY2EFECTIVO: TFloatField;
    LIQUIDMQRY2estatus: TStringField;
    LIQUIDMQRY2FECHA: TDateField;
    LIQUIDMQRY2NOMBRE: TStringField;
    LIQUIDMQRY2OBSERVACION: TStringField;
    LIQUIDMQRY2PLUBODEGA: TLongintField;
    LIQUIDMQRY2PLUEMPRESA: TLongintField;
    LIQUIDMQRY2PLULIQUIDACION: TLongintField;
    LIQUIDMQRY2PLUSUARIO: TLongintField;
    LIQUIDMQRY2PLUSUPERVISOR: TLongintField;
    LIQUIDMQRY2PLUVENDEDOR: TLongintField;
    LIQUIDMQRY2POST: TStringField;
    LIQUIDMQRY2REMESA: TFloatField;
    LIQUIDMQRY2SUPNOMBRE: TStringField;
    LIQUIDMQRY2TOTAL: TFloatField;
    lrpt: TfrReport;
    lrpt1: TfrReport;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    prodQRYBC: TLongintField;
    prodQRYCODIGO: TStringField;
    prodQRYDESCRIPCION: TStringField;
    prodQRYPLUPRODUCTO: TLongintField;
    prodQRYPORCENTAJE_PRECIO: TFloatField;
    prodQRYPRECIO: TFloatField;
    prodQRYPRECIO_CANAL: TStringField;
    RptFpagoCODIGO: TStringField;
    RptFpagoDESCRIPCION: TStringField;
    RptFpagoITEM: TLongintField;
    RptFpagoMONTO: TFloatField;
    RptFpagoOBSERVACION: TStringField;
    RptFpagoPLULIQUIDACION: TLongintField;
    RptFpagoTOTAL1: TCurrencyField;
    rptMovDS: TDatasource;
    rptMOVqryBODEGA: TStringField;
    rptMOVqryCODPROD: TStringField;
    rptMOVqryCODVEND: TStringField;
    rptMOVqryDESCUENTO: TFloatField;
    rptMOVqryDEVOLUCION: TFloatField;
    rptMOVqryDOC: TLongintField;
    rptMOVqryEMPRESA: TStringField;
    rptMOVqryESTATUS1: TStringField;
    rptMOVqryFECHA: TDateField;
    rptMOVqryFINAL: TFloatField;
    rptMOVqryFISICO: TFloatField;
    rptMOVqryINICIAL: TFloatField;
    rptMOVqryPED_BODEGA: TFloatField;
    rptMOVqryPED_RUTA: TFloatField;
    rptMOVqryPLULIQUIDACION: TLongintField;
    rptMOVqryPLUPRODUCTO: TLongintField;
    rptMOVqryPRECIO: TFloatField;
    rptMOVqryPRODUCTO: TStringField;
    rptMOVqrySALDO: TFloatField;
    rptMOVqrySUBTOTAL: TFloatField;
    rptMOVqrySUPERVISOR: TStringField;
    rptMOVqryTOTAL: TFloatField;
    rptMOVqryTOTALES: TFloatField;
    rptMOVqryTRANSFER: TFloatField;
    rptMOVqryUSUARIO: TStringField;
    rptMOVqryVENDEDOR: TStringField;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton8: TSpeedButton;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    vendedoresQRYACTIVO: TStringField;
    vendedoresQRYCANAL: TStringField;
    vendedoresQRYCODIGO: TStringField;
    vendedoresQRYNOMBRE: TStringField;
    vendedoresQRYPLUEMPLEADOS: TLongintField;
    vendedoresQRYPLUSUCURSAL: TLongintField;
    procedure BitBtn1Click(Sender: TObject);
    procedure LIQUIDDQRYAfterDelete(DataSet: TDataSet);
    procedure LIQUIDDQRYAfterEdit(DataSet: TDataSet);
    procedure LIQUIDDQRYBeforeCancel(DataSet: TDataSet);
    procedure LIQUIDDQRYBeforeEdit(DataSet: TDataSet);
    procedure LIQUIDDQRYBeforePost(DataSet: TDataSet);
    procedure LIQUIDDQRYCalcFields(DataSet: TDataSet);
    procedure LIQUIDDQRYCODIGOValidate(Sender: TField);
    procedure LIQUIDDQRYFINALValidate(Sender: TField);
    procedure LIQUIDDQRYTOTALValidate(Sender: TField);
    procedure LIQUIDMQRYAfterDelete(DataSet: TDataSet);
    procedure LIQUIDMQRYAfterPost(DataSet: TDataSet);
    procedure LIQUIDMQRYBeforeCancel(DataSet: TDataSet);
    procedure LIQUIDMQRYBeforeEdit(DataSet: TDataSet);
    procedure LIQUIDMQRYBeforePost(DataSet: TDataSet);
    procedure LIQUIDMQRYCalcFields(DataSet: TDataSet);
    procedure LIQUIDMQRYCSUPERValidate(Sender: TField);
    procedure LIQUIDMQRYCVENDValidate(Sender: TField);
    procedure LIQUIDMQRYNewRecord(DataSet: TDataSet);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Recalcular;
    procedure btnBuscarClick(Sender: TObject);
    procedure btnBuscaSupClick(Sender: TObject);
    procedure btnBuscaVendClick(Sender: TObject);
    procedure btnDESprocesarClick(Sender: TObject);
    procedure btnprocesarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBMemo1Change(Sender: TObject);
    procedure edtcodigoEnter(Sender: TObject);
    procedure edtcodigoExit(Sender: TObject);
    procedure edtcodigoKeyPress(Sender: TObject; var Key: char);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GroupBox4Click(Sender: TObject);
    procedure LIQUIDDQRYAfterPost(DataSet: TDataSet);
    procedure LIQUIDDQRYDESCUENTOValidate(Sender: TField);
    procedure LIQUIDDQRYFISICOValidate(Sender: TField);
    procedure LiquidDQRYNewRecord(DataSet: TDataSet);
    procedure LIQUIDDQRYSALDOValidate(Sender: TField);
    procedure LIQUIDMQRY2AfterDelete(DataSet: TDataSet);
    procedure LIQUIDMQRY2AfterPost(DataSet: TDataSet);
    procedure LIQUIDMQRY2BeforeCancel(DataSet: TDataSet);
    procedure LIQUIDMQRY2BeforeEdit(DataSet: TDataSet);
    procedure LIQUIDMQRY2BeforePost(DataSet: TDataSet);
    procedure LIQUIDMQRY2CalcFields(DataSet: TDataSet);
    procedure LIQUIDMQRY2CSUPERValidate(Sender: TField);
    procedure LIQUIDMQRY2CVENDValidate(Sender: TField);
    procedure LIQUIDMQRY2NewRecord(DataSet: TDataSet);
    procedure MenuItem1Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure PopupCalBtnClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure RptFpagoCalcFields(DataSet: TDataSet);
    procedure rptMOVqry2CalcFields(DataSet: TDataSet);
    procedure rptMOVqryCalcFields(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure ToolBar2Click(Sender: TObject);
  private
    procedure borrarDetalle;
    { private declarations }
    procedure controles(estado:boolean);
    function compruebatecla(key:char):char;
    procedure inventario ;
    procedure inventario2 ;
    function _precio(pluproducto: integer): currency;
    function precio_canal(pluvendedor, pluproducto: integer): currency;
    function Saldo_ini(producto,pluliquida:integer):integer;
    function validarExisIni: boolean;

  public
    { public declarations }
    function movimientos(pluprod:integer;TIPO:STRING;PLUTIPO:INTEGER):variant;
    procedure sumar;
  end; 

var
  liquidFRM: TliquidFRM;
  plu:integer;
  cual_existencia,IdLog:integer;
  nuevo :string;

implementation

uses
liqbliqform,
liqDM,
pickdate,
Liqbvendedorform,
liqbsuperform,
LIQMENUFORM,
procesos,
liqprogresoform,
liqdetpliqform,
liqfrmdexis,
dbutils,
ufrmmontotes;

{ TliquidFRM }

procedure TliquidFrm.sumar;
var
total:currency;
begin

  dm.myqry.close;
  dm.myqry.sql.clear;
  dm.myqry.sql.add('select sum(total) total from liquidaciond where pluliquidacion=:pluliquid ');
  dm.myqry.ParamByName('pluliquid').value := LIQUIDMQRYPLULIQUIDACION.value;
  dm.myqry.open;

  if dm.myqry.fieldbyname('total').Value > 0 then
     total := dm.myqry.fieldbyname('total').Value
     else
     total := 0;

  LIQUIDMQRY.Edit;
  LIQUIDMQRYTOTAL.Value := total;
  LIQUIDMQRY.Post;


end;

procedure TliquidFRM.controles(estado:boolean);
var
i:integer;
begin

        for I := 0 to Panel1.ControlCount - 1 do    { Iterate }
        begin
                if Panel1.Controls[i].ClassType.ClassType<> Ttoolbar then
                Panel1.Controls[i].Enabled := estado;

        end;    { for }

       griddet.Columns[12].ReadOnly:=  TRUE;
       IF NOT (LIQUIDMQRYPLULIQUIDACION.VALUE >0) OR
       (LIQUIDMQRYPOST.Value='T') THEN
       BEGIN

        griddet.Columns[6].ReadOnly:=  TRUE;
        griddet.Columns[10].ReadOnly:=  TRUE;
        griddet.Columns[11].ReadOnly:=  TRUE;


       END
       ELSE
       BEGIN

           griddet.Columns[6].ReadOnly:=  estado;
           griddet.Columns[10].ReadOnly:=  estado;
           griddet.Columns[11].ReadOnly:=  TRUE;

       end;


end;

procedure TliquidFRM.SpeedButton8Click(Sender: TObject);
begin
  close;
end;

procedure TliquidFRM.ToolBar2Click(Sender: TObject);
begin

end;

procedure TliquidFRM.PopupCalBtnClick(Sender: TObject);
begin

 with TBrDateForm.Create(SELF) do
  try

   if ShowModal = mrOk then
    begin

     {if  strtodate(Calendar1.Date)<now then
     begin

       showmessage('Fecha de liquidacion no puede ser menor que la del dia!!');
       exit;
     end;}

     //LIQUIDMQRY.Edit;
     //LIQUIDMQRYFECHA.AsString := Calendar1.Date;
     //EdtFecha.SelectAll;

    end;
  finally

end;

end;

procedure TliquidFRM.PopupMenu1Popup(Sender: TObject);
var
proceso:boolean;
begin
    if MessageDlg('Desea Desprocesar este Documento...?',
   mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin

     dm.IBTransInv.Active:=false;
     dm.IBTransInv.StartTransaction;
  try

  //Cierro el query de la tabla inv_reservas y la abro


  //DM.INVENTARIOQRY.CLOSE;
  //DM.INVENTARIOQRY.OPEN;
  //

  //abro el detalle de la  liquidacion
  LiquidDQRY2.close;
  LiquidDQRY2.Params[0].value := LIQUIDMQRY2PLULIQUIDACION.Value;
  LiquidDQRY2.Open;

  LiquidDQRY2.First;

  while NOT LiquidDQRY2.EOF do
  begin


  // procesado de la orden, inserta datos en la tabla de inventario
  // muevo la existencia en la bodega

{  function procesar_inventario(Transaccion:string;pluproducto:integer;fecha:Tdatetime;referencia:string;
tipo:string;entrada,salida:integer;observaciones:String;plubodega,pludoc:integer):boolean;
 }

 if LiquidDQRY2saldo.Value>0 then
 begin

  PROCESO := procesar_reserva('LIQ',LiquidDQRY2pluproducto.Value,
  LIQUIDMQRY2FECHA.Value,'LIQ-'+LIQUIDMQRY2CODIGO.asstring,
  'LIQ',0,LiquidDQRY2saldo.Value,LIQUIDMQRY2OBSERVACION.AsString,
  LIQUIDMQRY2PLUVENDEDOR.Value,LIQUIDMQRY2PLULIQUIDACION.Value);

  // si ocurre algun error al procesar, rompo el lazo

  if not PROCESO then
  begin

     showmessage('error al procesar');
     //dm.InsResSQL.CancelUpdates;
     dm.IBTransInv.Rollback;
     exit;
  end;


  end;


  LiquidDQRY2.Next;
  end;

   // si todo se ejecuta con exito, se aplican los cambios
   dm.IBTransInv.Commit;

   LIQUIDMQRY.Edit;
   LIQUIDMQRYPOST.Value:='T';
   LIQUIDMQRY.Post;

   dm.MyQry.close;
   dm.MyQry.SQL.Clear;
   dm.MyQry.sql.Add(' update  MOV_SUCURSALM set pluliquidacion=:plul WHERE  PLUEMPLEADOS=:pluempl AND PLULIQUIDACION=0');
   dm.MyQry.ParamByName('plul').Value := LIQUIDMQRYPLULIQUIDACION.Value;
   dm.MyQry.ParamByName('pluempl').Value := LIQUIDMQRYPLUVENDEDOR.Value;
   dm.MyQry.ExecSQL;

   dm.MyQry.close;
   dm.MyQry.SQL.Clear;
   dm.MyQry.sql.Add(' update  MOV_SUCURSALM set PLUREQSUCURSAL=:plul WHERE  PLUSUCURSAL2=:pluempl AND PLUREQSUCURSAL=0 AND TIPO=''TRA'' ');
   dm.MyQry.ParamByName('plul').Value := LIQUIDMQRY2PLULIQUIDACION.Value;
   dm.MyQry.ParamByName('pluempl').Value := LIQUIDMQRY2PLUVENDEDOR.Value;
   dm.MyQry.ExecSQL;

 except
  on e : exception do
    begin

      //si hay algun error , se deshacen los cambios

      dm.IBTransInv.Rollback;
      ShowMessage ('Clase de error: ' + e.ClassName + chr(13) + chr(13) +
          'Mensaje del error: ' + e.Message+', Error al Procesar...');


    end;

  end; //try

  end; //desea continuar
end;

procedure TliquidFRM.RptFpagoCalcFields(DataSet: TDataSet);
begin

  DM.MYQRY.CLOSE;
  DM.MYQRY.SQL.CLEAR;
  DM.MYQRY.SQL.ADD('SELECT SUM(MONTO) MONTO FROM LIQUIDACION_DET WHERE PLULIQUIDACION=:PLUL ');
  DM.MYQRY.ParamByName('PLUL').VALUE := LIQUIDMQRYPLULIQUIDACION.Value;
  DM.MYQRY.Open;

  RPTFPAGOTOTAL1.VALUE := DM.MYQRY.FIELDBYNAME('MONTO').VALUE;
end;

procedure TliquidFRM.rptMOVqry2CalcFields(DataSet: TDataSet);
begin
   if LIQUIDMQRYPOST.Value ='T' THEN
      RPTMOVQRY2ESTATUS1.Value := '**PROCESADO'
      ELSE
      RPTMOVQRY2ESTATUS1.Value := '**SIN PROCESAR';
end;

procedure TliquidFRM.rptMOVqryCalcFields(DataSet: TDataSet);
begin

      if LIQUIDMQRYPOST.Value ='T' THEN
      RPTMOVQRYESTATUS1.Value := '**PROCESADO'
      ELSE
      RPTMOVQRYESTATUS1.Value := '**SIN PROCESAR';

end;

procedure TliquidFRM.SpeedButton1Click(Sender: TObject);
begin

 if idlog>0 then
         actualiza_logliq(idlog,'','N','N','N','N','N');


  BtnBuscaVend.Enabled := true;
   EdtVendedor.enabled:= true;
  LIQUIDMQRY.Insert;
end;

procedure TliquidFRM.SpeedButton2Click(Sender: TObject);
begin
   if LIQUIDMQRYPOST.Value ='T' then
    exit;

    LIQUIDMQRY.Cancel;

end;

procedure TliquidFRM.SpeedButton3Click(Sender: TObject);
begin


 if LIQUIDMQRYPOST.Value ='T' then
    exit;

   IF LIQUIDMQRY.IsEmpty THEN
      EXIT;

  dm.myqry3.close;
  dm.myqry3.sql.clear;
  dm.myqry3.sql.add('select post  from liquidacionm where pluliquidacion=:plul ');
  dm.myqry3.parambyname('plul').value := LIQUIDMQRYPLULIQUIDACION.value;
  dm.myqry3.open;

  if dm.myqry3.FieldByName('post').value='T' then
  begin
    plu := LIQUIDMQRY2PLULIQUIDACION.Value;
    showmessage('Documento ya fue procesado, no puede Borrarlo!!');
    Liquiddqry.Close;
    LIQUIDMQRY.Close;
    LIQUIDMQRY.Locate('pluliquidacion',plu,[]);
    liquiddqry.Open;
    exit;
  end;

   if MessageDlg('Desea Borrar Registro...?',
   mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin

     if idlog>0 then
         actualiza_logliq(idlog,'','N','N','N','S','N');

    LIQUIDMQRY.Delete;

  end;



end;

procedure TliquidFRM.SpeedButton4Click(Sender: TObject);
begin



   if LIQUIDMQRYPOST.Value ='T' then
        exit;

  dm.myqry3.close;
  dm.myqry3.sql.clear;
  dm.myqry3.sql.add('select post  from liquidacionm where pluliquidacion=:plul ');
  dm.myqry3.parambyname('plul').value := LIQUIDMQRYPLULIQUIDACION.value;
  dm.myqry3.open;

  if dm.myqry3.FieldByName('post').value='T' then
  begin
    plu := LIQUIDMQRYPLULIQUIDACION.Value;
    showmessage('Documento ya fue procesado!!');
    Liquiddqry.Close;
    LIQUIDMQRY.Close;
    LIQUIDMQRY.Locate('pluliquidacion',plu,[]);
    liquiddqry.Open;
    exit;
  end;

       IF LIQUIDMQRYPLUVENDEDOR.IsNull THEN
         begin
         SHOWMESSAGE('Debe digitar Vendedor');
         edtVendedor.SetFocus;
         exit;
         end;

      IF LIQUIDMQRYPLUSUPERVISOR.IsNull THEN
         begin
         SHOWMESSAGE('Debe digitar Liquidador');
         //edtsuper.SetFocus;
         exit;
         end;
    ShortDateFormat := 'MM/DD/YY';
       dm.MyQry2.close;
       dm.myqry2.SQL.Clear;
       dm.MyQry2.SQL.Add('select count(*) cnt from liquidacionm where pluvendedor='+
       LIQUIDMQRYPLUVENDEDOR.ASSTRING+' and fecha >='''+ LIQUIDMQRYFECHA.asstring+''' ');
       dm.myqry2.Open;

       if dm.myqry2.fieldbyname('cnt').value >0 then
       begin
            showmessage(' Vendedor ya posee liquidacion en esta Fecha, o en fecha posterior a esta!!! ');
            exit;
       end;

       if ( LIQUIDMQRY.State = dsinsert) or ( LIQUIDMQRY.State = dsedit) then
            LIQUIDMQRY.Post;

  ShortDateFormat := 'DD/MM/YY';
  bitbtn1.Enabled:=true;
end;

procedure TliquidFRM.SpeedButton5Click(Sender: TObject);
begin

    if LIQUIDMQRYPOST.Value ='T' then
       exit;
    IF LIQUIDMQRY.IsEmpty THEN
       EXIT;

  dm.myqry.close;
  dm.myqry.sql.clear;
  dm.myqry.sql.add('select post  from liquidacionm where pluliquidacion=:plul ');
  dm.myqry.parambyname('plul').value := LIQUIDMQRYPLULIQUIDACION.value;
  dm.myqry.open;

  if dm.myqry.FieldByName('post').value='T' then
  begin
    plu := LIQUIDMQRYPLULIQUIDACION.Value;
    showmessage('Documento ya fue procesado!!');
    Liquiddqry.Close;
    LIQUIDMQRY.Close;
    LIQUIDMQRY.Locate('pluliquidacion',plu,[]);
    liquiddqry.Open;
    exit;
  end;

    LIQUIDMQRY.edit;

end;

procedure TliquidFRM.SpeedButton6Click(Sender: TObject);
begin


   if LIQUIDMQRYPOST.Value ='F' then
   BEGIN
    SHOWMESSAGE('Debe Procesar Para Poder Imprimir!!!');
    lrpt1.PreviewButtons:=[];
    //[pbZoom,pbLoad,pbSave,pbPrint,pbFind,pbHelp,pbExit];

   end ;

  rptmovqry.Close;
  rptmovqry.Params[0].Value:= LIQUIDMQRYPLULIQUIDACION.Value;
  rptmovqry.Open;

  RPTFPAGO.CLOSE ;
  RPTFPAGO.Params[0].VALUE :=LIQUIDMQRYPLULIQUIDACION.Value;
  RPTFPAGO.Open;



  if  rptmovqry.IsEmpty then
  begin
      if (gtes='S') then
      begin
          rptmovqry2.Close;
          rptmovqry2.Params[0].Value:= LIQUIDMQRYPLULIQUIDACION.Value;
          rptmovqry2.Open;

          if not (rptmovqry2.IsEmpty) then
          begin
              lrpt2.ShowReport;
              exit;
          end;


      end
      else
      exit;

  end;

  lrpt1.ShowReport;

end;

procedure TliquidFRM.LIQUIDMQRYCVENDValidate(Sender: TField);
var
 lista:string;
begin

  dm.myqry.close;
  dm.myqry.sql.clear;
  dm.myqry.sql.add('select pluempleados,codigo,nombre,activo,plusucursal from empleados where codigo like :codigo '+
  ' and pluempresas=:pluempresa ');
  dm.myqry.parambyname('codigo').value :=  LIQUIDMQRYCVEND.Value;
  dm.myqry.parambyname('pluempresa').value :=  dm.empresaqrypluempresa.value;
  dm.myqry.open;

  if dm.myqry.IsEmpty then
  //if not(vendedoresqry.Locate('codigo',LIQUIDMQRYCVEND.Value,[])) then
  begin
    showmessage('codigo de Vendedor no existe!!!');
    edtvendedor.SetFocus;
    exit;
  end;

  if dm.myqry.FieldByName('activo').value='F' then
 //  if vendedoresqryactivo.Value='F' then
  begin
       showmessage('Vendedor en estado inactivo!!!');
       edtvendedor.SetFocus;
       exit;
  end;

  if dm.myqry.FieldByName('plusucursal').value<>dm.BodegaQRYPLUBODEGA.value then
  //if vendedoresqry.FieldByName('plusucursal').value<>dm.BodegaQRYPLUBODEGA.value then
  begin
       showmessage('El vendedor no pertenece a esta sucursal!!!');
       edtvendedor.SetFocus;
       exit;
  end;


  dm.MyQry2.close;
  dm.myqry2.SQL.Clear;
  dm.MyQry2.SQL.Add('select codigo,tipo,cast(fecha as date) fecha from mov_sucursalm where pluempleados=:pluvendedor '+
  ' and pluliquidacion=0 and cast(fecha as date)<:fecha  ');
  dm.myqry2.ParamByName('pluvendedor').value := dm.myqry.FieldByName('pluempleados').value;//vendedoresqrypluempleados.Value;//
  dm.myqry2.ParamByName('fecha').value := LIQUIDMQRYFECHA.Value;
  dm.myqry2.Open;

  if not(dm.myqry2.IsEmpty) then
  begin

   lista:= '';
   while not dm.myqry2.EOF do
   begin

     lista := lista +dm.MyQry2.fieldbyname('tipo').asstring+'-'+dm.MyQry2.fieldbyname('codigo').asstring+
     '->'+dm.MyQry2.fieldbyname('fecha').asstring+',';
     dm.myqry2.Next;
   end;

   showmessage(' Vendedor posee movimientos sin liquidar con una fecha anterior, liquidelos para poder hacer liquidacion con fecha actual!!! '+lista);
   exit;

  end;


  dm.MyQry2.close;
  dm.myqry2.SQL.Clear;
  dm.MyQry2.SQL.Add('select codigo,tipo,cast(fecha as date) fecha  from mov_sucursalm where plusucursal2=:pluvendedor '+
  ' and PLUREQSUCURSAL=0 and cast(fecha as date)<:fecha  AND TIPO=''TRA'' ');
  dm.myqry2.ParamByName('pluvendedor').value := dm.myqry.FieldByName('pluempleados').value;//vendedoresqrypluempleados.Value;//
  dm.myqry2.ParamByName('fecha').value := LIQUIDMQRYFECHA.Value;
  dm.myqry2.Open;

  if not(dm.myqry2.IsEmpty) then
  begin

  lista:= '';
   while not dm.myqry2.EOF do
   begin

     lista := lista +dm.MyQry2.fieldbyname('tipo').asstring+'-'+dm.MyQry2.fieldbyname('codigo').asstring+
     '->'+dm.MyQry2.fieldbyname('fecha').asstring+',';
     dm.myqry2.Next;
   end;

   showmessage(' Vendedor posee Transferencia sin liquidar con una fecha anterior, liquidela para poder hacer liquidacion con fecha actual!!! :'+lista);
   exit;

  end;

  dm.MyQry2.close;
  dm.myqry2.SQL.Clear;
  dm.MyQry2.SQL.Add('select fecha,codigo from liquidacionm where pluvendedor=:pluvendedor ');
  dm.myqry2.sql.add(' and post=''T'' and fecha=:fecha AND PLULIQUIDACION<>:PLULIQUIDACION ');
  dm.myqry2.ParamByName('pluvendedor').value := dm.myqry.FieldByName('pluempleados').value;//vendedoresqrypluempleados.Value
  dm.myqry2.ParamByName('fecha').value := LIQUIDMQRYFECHA.Value;
  dm.myqry2.ParamByName('PLULIQUIDACION').value := LIQUIDMQRYPLULIQUIDACION.Value;
  dm.myqry2.Open;

  if not(dm.myqry2.IsEmpty) then
  begin
   showmessage(' Vendedor ya posee liquidacion en esta Fecha!!! Liq:'+dm.myqry2.fieldbyname('codigo').AsString);
   exit;

  end;


  LIQUIDMQRYPLUVENDEDOR.Value := dm.myqry.FieldByName('pluempleados').value;//vendedoresqrypluempleados.Value;//
  LIQUIDMQRYNOMBRE.Value := dm.myqry.FieldByName('nombre').value;
  //LiquidMQryplusucursal2.Value := dm.myqry.FieldByName('pluempleados').value;


end;

procedure TliquidFRM.LIQUIDMQRYNewRecord(DataSet: TDataSet);
begin

     CONTROLES(TRUE);
     nuevo := 'S';

     LIQUIDMQRYFECHA.value := DATE;
     LIQUIDMQRYPLUEMPRESA.Value:= DM.EmpresaQRYPLUEMPRESA.Value;
     LIQUIDMQRYPLUBODEGA.Value:= DM.BodegaQRYPLUBODEGA.Value;
     LIQUIDMQRYPOST.Value:= 'F';
     LIQUIDMQRYBODEGA.AsString:= DM.BodegaQRYNOMBRE.AsString;
     LIQUIDMQRYPLUSUARIO.Value:= DM.UserQRYPLUSUARIO.Value;


     DM.MyQry.CLOSE;
     DM.MYQRY.SQL.CLEAR;
     DM.MYQRY.SQL.ADD('SELECT PLUSUPERVISOR,CODIGO,NOMBRE FROM SUPERVISORES WHERE PLUSUARIO=:PLUSUARIO'+
     ' AND PLUBODEGA=:PLUBODEGA ') ;
     DM.MYQRY.PARAMBYNAME('PLUSUARIO').VALUE := DM.UserQRYPLUSUARIO.VALUE;
     DM.MYQRY.PARAMBYNAME('PLUBODEGA').VALUE := DM.BodegaQRYPLUBODEGA.Value;
     DM.MYQRY.Open;

     IF DM.MYQRY.FieldByName('PLUSUPERVISOR').ValUE >0 THEN
     LIQUIDMQRYCSUPER.Value := DM.MYQRY.FieldByName('CODIGO').ValUE
     ELSE
     BEGIN
       SHOWMESSAGE('Usuario no asociado a ningun Liquidador, contacte al Administrador del Sistema!!');
       exit;

     end;
     EDTFECHA.SetFocus;


end;

procedure TliquidFRM.MenuItem1Click(Sender: TObject);
begin

  ShortDateFormat := 'MM/DD/YY';
 IF LIQUIDMQRY.IsEmpty THEN
 EXIT;

 if LIQUIDMQRYPOST.Value ='F' then
    exit;

  if permisos(dm.UserQRYPLUPERFIL.Value,85)='S' then//cambiar forma de pago
  begin

  with TfrmLiqPago.Create(SELF) do
  try

   if ShowModal = mrOk then
    begin



    end;

  finally
  end;

  end
  else showmessage('Opcion no Autorizada!!!') ;



end;

procedure TliquidFRM.Panel2Click(Sender: TObject);
begin

end;





procedure TliquidFRM.LIQUIDMQRYCSUPERValidate(Sender: TField);
begin

  dm.myqry.close;
  dm.myqry.sql.clear;
  dm.myqry.sql.add('select plusupervisor,codigo,nombre,activo,plubodega from supervisores where codigo like  :codigo ');
  dm.myqry.parambyname('codigo').value :=  LIQUIDMQRYCSUPER.Value;
  dm.myqry.open;

  if dm.myqry.IsEmpty then
  begin
    showmessage('codigo de Supervisor no existe!!!');
//    edtSuper.SetFocus;
    exit;
  end;

  if dm.myqry.FieldByName('activo').value='F' then
  begin
       showmessage('Supervisor en estado inactivo!!!');
       edtvendedor.SetFocus;
       exit;
  end;


  if dm.myqry.FieldByName('plubodega').value<>dm.BodegaQRYPLUBODEGA.value then
  begin
       showmessage('El supervisor no pertenese a esta sucursal!!!');
       edtvendedor.SetFocus;
       exit;
  end;

  dm.MyQry2.close;
  dm.myqry2.SQL.Clear;
  dm.MyQry2.SQL.Add('select count(*) cnt from liquidacionm where plusupervisor=:plus ');
  dm.myqry2.sql.add(' and post=''F'' ');
  dm.myqry2.ParamByName('plus').value := dm.myqry.FieldByName('plusupervisor').value;
  dm.myqry2.Open;

  if dm.myqry2.fieldbyname('cnt').value >0 then
  begin
   showmessage('Supervisor Tiene otra liquidacion pendiente de procesar, debe terminar esa primero para poder liquidar este vendedor!!! ');
   exit;

  end;

  LIQUIDMQRYPLUSUPERVISOR.Value := dm.myqry.FieldByName('plusupervisor').value;
  LIQUIDMQRYSUPNOMBRE.Value := dm.myqry.FieldByName('nombre').value;

end;

procedure TliquidFRM.LIQUIDMQRYCalcFields(DataSet: TDataSet);
begin
    if LIQUIDMQRYPOST.Value ='T' then
     LIQUIDMQRYestatus.value := '**PROCESADO'
     ELSE
     LIQUIDMQRYestatus.value := '**SIN PROCESAR';
end;



procedure TliquidFRM.btnBuscarClick(Sender: TObject);
begin


  with Tliqbliqfrm.Create(SELF) do
  try

   if ShowModal = mrOk then
    begin

    IF NOT BliqQRY.IsEmpty THEN
    BEGIN


     LIQUIDMQRY.CLOSE;
     LIQUIDMQRY.Params[0].VALUE := DM.EmpresaQRYPLUEMPRESA.Value;
     LIQUIDMQRY.Params[1].VALUE := DM.BodegaQRYPLUBODEGA.Value;
     LIQUIDMQRY.Params[2].VALUE := BliqQRY.FIELDBYNAME('PLUliquidacion').VALUE;
     LIQUIDMQRY.OPEN;

     if not(LIQUIDMQRYPOST.Value ='T') then
     begin

     dm.myqry.close;
     dm.myqry.sql.clear;
     dm.myqry.sql.add('select count(*) cnt from liquidacion_log where '+
     ' pluliquidacion='+BliqQRY.FIELDBYNAME('PLUliquidacion').asstring+' and '+
     ' ocupado=''S''  ');
     dm.myqry.open;

       if dm.myqry.FieldByName('cnt').AsInteger>0 then
       begin

        dm.myqry.close;
        dm.myqry.sql.clear;
        dm.myqry.sql.add('select id  from liquidacion_log where '+
        ' pluliquidacion='+BliqQRY.FIELDBYNAME('PLUliquidacion').asstring+' and '+
        ' ocupado=''S'' and plusuario='+dm.UserQRYPLUSUARIO.AsString+' ');
        dm.myqry.open;

        if dm.myqry.FieldByName('id').value > 0 then
          idlog := dm.myqry.FieldByName('id').AsInteger
        else
        begin
          showmessage('Liquidacion esta siendo utilizada por otro usuario!!!');
          exit;
        end;

       end;

     end;

       ShortDateFormat := 'MM/DD/YY';
       if idlog>0 then
         actualiza_logliq(idlog,datetostr(now),'N','N','N','N','N');


       idlog := insertar_logliq(BliqQRY.FIELDBYNAME('PLUliquidacion').VALUE,
       dm.UserQRYPLUSUARIO.value);

        ShortDateFormat := 'DD/MM/YY';

     LIQUIDDQRY.Close;
     LIQUIDDQRY.OPEN;

     CONTROLES(FALSE);

    END;

  end;

  finally

     liqbliqfrm.Free;
  end;


end;

procedure TliquidFRM.Recalcular;
begin

      IF LIQUIDMQRY.IsEmpty THEN
       EXIT;

      if LIQUIDMQRYPOST.Value ='T' then
        exit;

         ShortDateFormat := 'MM/DD/YY';

  try

  dm.myqry.close;
  dm.myqry.sql.clear;
  dm.myqry.sql.add('select post  from liquidacionm where pluliquidacion=:plul ');
  dm.myqry.parambyname('plul').value := LIQUIDMQRYPLULIQUIDACION.value;
  dm.myqry.open;

  if dm.myqry.FieldByName('post').value='T' then
  begin
    plu := LIQUIDMQRYPLULIQUIDACION.Value;
    showmessage('Documento ya fue procesado!!');
    Liquiddqry.Close;
    LIQUIDMQRY.Close;
    LIQUIDMQRY.Locate('pluliquidacion',plu,[]);
    liquiddqry.Open;
    exit;
  end;


       IF LIQUIDMQRYPLUVENDEDOR.IsNull THEN
         begin
         SHOWMESSAGE('Debe digitar Vendedor');
         edtVendedor.SetFocus;
         exit;
         end;

      IF LIQUIDMQRYPLUSUPERVISOR.IsNull THEN
         begin
         SHOWMESSAGE('Debe digitar Liquidador');
         //edtsuper.SetFocus;
         exit;
         end;

  if MessageDlg('Seguro que desea Refrescar Movimientos...?!!!',
   mtConfirmation, [mbYes, mbNo], 0) = mrNO then
   exit;

  LIQUIDFRM.Refresh;

  Application.CreateForm(Tprogresofrm,progresofrm);
  progresofrm.ProgressBar1.Step:=1;
  progresofrm.Caption := 'Verificando Inventario!!';
  progresofrm.Show;

  INVENTARIO;

  progresofrm.Refresh;
  progresofrm.Close;

  liquidfrm.Refresh;

  ShortDateFormat := 'DD/MM/YY';
  bitbtn1.Enabled:= false;

  finally
      progresofrm.Close;
  end;
end;

procedure TliquidFRM.BitBtn1Click(Sender: TObject);
begin
  //borrarDetalle;
  recalcular;
end;

procedure TliquidFRM.LIQUIDDQRYAfterDelete(DataSet: TDataSet);
begin
   if LIQUIDMQRYpost.Value ='T' then
    exit;
   //IF MSUCURSALMQRY.IsEmpty THEN
   //   EXIT;

   LIQUIDMQRY.ApplyUpdates;
end;

procedure TliquidFRM.LIQUIDDQRYAfterEdit(DataSet: TDataSet);
begin

end;

procedure TliquidFRM.LIQUIDDQRYBeforeCancel(DataSet: TDataSet);
begin

end;

procedure TliquidFRM.LIQUIDDQRYBeforeEdit(DataSet: TDataSet);
begin

end;

procedure TliquidFRM.LIQUIDDQRYBeforePost(DataSet: TDataSet);
begin

end;

procedure TliquidFRM.LIQUIDDQRYCalcFields(DataSet: TDataSet);
begin
  //IF ((LIQUIDDQRYSUBTOTAL.Value>0) AND (LIQUIDDQRYSALDO.Value>0) ) THEN
  LIQUIDDQRYPRECIO.Value:= _precio(liquiddqrypluproducto.Value);//LIQUIDDQRYSUBTOTAL.Value / LIQUIDDQRYSALDO.Value;
end;

procedure TliquidFRM.LIQUIDDQRYCODIGOValidate(Sender: TField);
var
 pluproducto : integer;
 var
  precio:currency;
begin

   if prodqry.Locate('codigo',LIQUIDDQRYCODIGO.Value,[]) then
    begin

       pluproducto := prodqrypluproducto.Value;
       liquiddqrypluproducto.Value := pluproducto;
       liquiddqrydescripcion.Value := prodqrydescripcion.Value;

        if prodqryprecio_canal.Value='S' then
             precio := precio_canal(LIQUIDMQRYPLUVENDEDOR.Value,pluproducto)
        else
        begin
           if prodqry.FieldByName('porcentaje_precio').Value>0 then
           precio     := roundd(((prodqry.FieldByName('precio').Value-
           ((prodqry.FieldByName('precio').Value*prodqry.FieldByName('porcentaje_precio').Value)/100))*1.13),5)
           else
           precio     := roundd((prodqry.FieldByName('precio').Value*1.13),3);
        end;

        liquiddqryprecio.Value := precio;

    end
   else
   begin
     showmessage('codigo de producto no existe!!!!');
   end;


end;

procedure TliquidFRM.LIQUIDDQRYFINALValidate(Sender: TField);
begin
       if LIQUIDDQRYFINAL.Value<0 then
         LIQUIDDQRYFINAL.Value := 0;
end;

procedure TliquidFRM.LIQUIDDQRYTOTALValidate(Sender: TField);
begin

end;

procedure TliquidFRM.LIQUIDMQRYAfterDelete(DataSet: TDataSet);
begin
    if idlog>0 then
        begin
         ShortDateFormat := 'MM/DD/YY';
         actualiza_logliq(idlog,datetostr(now),'','','','S','N');
         ShortDateFormat := 'DD/MM/YY';
         idlog := 0;
        end;
        LIQUIDMQRY.ApplyUpdates;
        CONTROLES(FALSE);
end;

procedure TliquidFRM.LIQUIDMQRYAfterPost(DataSet: TDataSet);
begin

   IF NUEVO = 'S' THEN
   BEGIN
     NUEVO := 'N' ;
      if idlog>0 then
        begin
         actualiza_logliq(idlog,'','N','N','N','N','N');
        end;

        idlog := insertar_logliq(LIQUIDMQRY.FIELDBYNAME('PLUliquidacion').VALUE,
        dm.UserQRYPLUSUARIO.value);
   END;

   LIQUIDMQRY.ApplyUpdates;
   CONTROLES(FALSE);
end;

procedure TliquidFRM.LIQUIDMQRYBeforeCancel(DataSet: TDataSet);
begin
  CONTROLES(FALSE);
end;


procedure TliquidFRM.LIQUIDMQRYBeforePost(DataSet: TDataSet);
VAR
CODIGO:INTEGER;
begin


   IF LIQUIDMQRY.State =DSINSERT THEN
   BEGIN

     DM.MyQry.CLOSE;
     DM.MYQRY.SQL.Clear;
     DM.MyQry.SQL.Add('SELECT MAX(CODIGO) CODIGO FROM LIQUIDACIONM WHERE PLUEMPRESA=:PLUEMPRESA ');
     DM.MyQry.SQL.Add(' AND PLUVENDEDOR=:PLUVENDEDOR ');
     DM.MYQRY.ParamByName('PLUEMPRESA').VALUE := DM.EMPRESAQRYPLUEMPRESA.VALUE;
     DM.MYQRY.ParamByName('PLUVENDEDOR').VALUE := LIQUIDMQRYPLUVENDEDOR.VALUE;
     DM.MYQRY.OPEN;

     IF DM.MYQRY.FIELDBYNAME('CODIGO').VALUE > 0 THEN
     CODIGO := DM.MYQRY.FIELDBYNAME('CODIGO').VALUE +1
     ELSE
     CODIGO := 1;

     LIQUIDMQRYCODIGO.VALUE := CODIGO;
    // LIQUIDMQRY.ApplyUpdates;

  END;

end;


procedure TliquidFRM.borrarDetalle;
begin
   dm.IBTransInv.Active:=false;
   dm.IBTransInv.StartTransaction;
   try

     dm.myqry3.Close;
     dm.myqry3.SQL.Clear;
     dm.myqry3.SQL.Add(' delete from liquidaciond where pluliquidacion=:pluliquidacion');
     dm.myqry3.Params[0].Value:= LIQUIDMQRYpluliquidacion.Value ;
     dm.myqry3.ExecSQL;

     dm.IBTransInv.Commit;

     liquiddqry.Close;
     liquiddqry.Open;

     bitbtn1.Enabled:=true;

    except
  on e : exception do
    begin


      //si hay algun error , se deshacen los cambios
      dm.IBTransInv.Rollback;
      ShowMessage ('Clase de error: ' + e.ClassName + chr(13) + chr(13) +
          'Mensaje del error: ' + e.Message+', Error al Borrar Detalle...');
     bitbtn1.Enabled:=false;

    end;
   end;

end;


procedure TliquidFRM.MenuItem2Click(Sender: TObject);
begin

   IF LIQUIDMQRY.IsEmpty THEN
 EXIT;


 if LIQUIDMQRYPOST.Value ='T' then
    exit;


 borrarDetalle;
 //liquiddqry.First;
 //while not liquiddqry.EOF do
 //begin
 //   liquiddqry.First;
 //   liquiddqry.Delete;
 //end;
 //
end;

procedure TliquidFRM.MenuItem3Click(Sender: TObject);
begin

    if dbgrid1.Visible then
    dbgrid1.Visible:= false
    else
    dbgrid1.Visible :=true;
end;

procedure TliquidFRM.Panel1Click(Sender: TObject);
begin

end;

procedure TliquidFRM.btnBuscaSupClick(Sender: TObject);
begin

  with TFrmBSuper.Create(SELF) do
  try

   if ShowModal = mrOk then
    begin

    IF NOT BSUPERQRY.IsEmpty THEN
    BEGIN

         LIQUIDMQRYCSUPER.VALUE :=BSUPERQRYcodigo.VALUE;

    END;

    end;
  finally

  end;

end;

procedure TliquidFRM.btnBuscaVendClick(Sender: TObject);
begin

  with Tbvendedorfrm.Create(SELF) do
  try

   if ShowModal = mrOk then
    begin

    IF NOT VENDQRY.IsEmpty THEN
    BEGIN

     LIQUIDMQRYCVEND.VALUE := VENDQRYcodigo.VALUE;

    END;

    end;
  finally
      bvendedorfrm.Free;
  end;

end;

procedure TliquidFRM.btnDESprocesarClick(Sender: TObject);
VAR PROCESO:BOOLEAN;
EXISTENCIA,pluliq:INTEGER;
begin


 IF LIQUIDMQRY.IsEmpty THEN
 EXIT;


 if LIQUIDMQRYPOST.Value ='F' then
    exit;

 shortdateformat:='MM/DD/YYYY';
if not ((LIQUIDMQRYFECHA.Value>strtodate('09/30/2014')) and (LIQUIDMQRYFECHA.Value<strtodate('11/30/2014'))) then
begin



 dm.MyQry.Close;
 dm.MyQry.SQL.Clear;
 dm.MyQry.SQL.Add('select count(*) cnt from liquidacionm where fecha>:fecha and  ');
 dm.MyQry.SQL.Add(' pluvendedor=:pluvendedor  ');
 dm.myqry.ParamByName('fecha').value := LIQUIDMQRYFECHA.Value;
 dm.myqry.ParamByName('pluvendedor').value := LIQUIDMQRYPLUVENDEDOR.Value;
 dm.MyQry.Open;

 if dm.myqry.FieldByName('cnt').Value >0 then
 begin
      shortdateformat:='DD/MM/YYYY';
      showmessage('Vendedor Posee liquidacion(es) con fecha(s) posterior(es) a la de esta liquidacion, no puede Desprocesar!!!!!!');
      exit;
 end;

end;

shortdateformat:='DD/MM/YYYY';


 if NOT (permisos(dm.UserQRYPLUPERFIL.Value,73)='S') then
  begin
    SHOWMESSAGE('Opcion no Autorizada!!!');
    EXIT;
  END;


  if MessageDlg('Desea Desprocesar este Documento...?',
   mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin

  pluliq := LIQUIDMQRYPLULIQUIDACION.Value;
  dm.IBTransInv.Active:=false;
  dm.IBTransInv.StartTransaction;
  try

  Application.CreateForm(Tprogresofrm,progresofrm);
  progresofrm.Caption := 'DesProcesando Liquidacion!!';
  progresofrm.ProgressBar1.Style:=pbstMarquee;
  progresofrm.Show;

     //elimino los registro de INV RESERVAS
   dm.myqry3.Close;
   dm.myqry3.sql.Clear;
   dm.MyQry3.sql.Add(' delete from  INV_RESERVAS where PLUDOCCLIENTES=:plumovinv ');
   dm.MyQry3.sql.Add(' and tipo LIKE ''%LIQ%''  ');
   dm.myqry3.parambyname('plumovinv').value := pluliq;
   dm.myqry3.ExecSQL;


   //elimino los registro de la liquidaciones
   dm.myqry3.Close;
   dm.myqry3.sql.Clear;
   dm.MyQry3.sql.Add(' delete from inventario where plumovinv=:plumovinv ');
   dm.MyQry3.sql.Add(' and tipo=''LIQ''  ');
   dm.myqry3.parambyname('plumovinv').value := pluliq;
   dm.myqry3.ExecSQL;

   dm.MyQry3.close;
   dm.MyQry3.SQL.Clear;
   dm.MyQry3.sql.Add(' update  MOV_SUCURSALM set pluliquidacion=0 WHERE  PLUEMPLEADOS=:pluempl AND PLULIQUIDACION=:plul ');
   dm.MyQry3.ParamByName('plul').Value := pluliq;
   dm.MyQry3.ParamByName('pluempl').Value := LIQUIDMQRYPLUVENDEDOR.Value;
   dm.MyQry3.ExecSQL;

   dm.MyQry3.close;
   dm.MyQry3.SQL.Clear;
   dm.MyQry3.sql.Add(' update  MOV_SUCURSALM set PLUREQSUCURSAL=0 WHERE  PLUSUCURSAL2=:pluempl AND PLUREQSUCURSAL=:plul AND TIPO=''TRA'' ');
   dm.MyQry3.ParamByName('plul').Value := pluliq;
   dm.MyQry3.ParamByName('pluempl').Value := LIQUIDMQRYPLUVENDEDOR.Value;
   dm.MyQry3.ExecSQL;

     //DM.INVENTARIOQRY.ApplyUpdates;
   LIQUIDMQRY.Edit;
   LIQUIDMQRYPOST.Value:='F';
   LIQUIDMQRY.Post;


   progresofrm.ProgressBar1.Refresh;
   progresofrm.Close;

   dm.IBTransInv.Commit;

 except
  on e : exception do
    begin

    progresofrm.ProgressBar1.Style:=pbstNormal;
    progresofrm.close;
      //si hay algun error , se deshacen los cambios
      dm.IBTransInv.Rollback;
      ShowMessage ('Clase de error: ' + e.ClassName + chr(13) + chr(13) +
          'Mensaje del error: ' + e.Message+', Error al DesProcesar...');


    end;

  end; //try

  end; //desea continuar

end;

procedure TliquidFRM.btnprocesarClick(Sender: TObject);
VAR PROCESO:BOOLEAN;
EXISTENCIA, i:INTEGER;
progreso:variant;
kardex:string;
outil : TDButil;
begin



  try

   outil := TDbutil.Create;

  ShortDateFormat := 'MM/DD/YY';
 IF LIQUIDMQRY.IsEmpty THEN
 EXIT;

 if LIQUIDMQRYPOST.Value ='T' then
    exit;

  plu := LIQUIDMQRYPLULIQUIDACION.Value;

  dm.myqry3.close;
  dm.myqry3.sql.clear;
  dm.myqry3.sql.add('select post  from liquidacionm where pluliquidacion=:plul ');
  dm.myqry3.parambyname('plul').value := plu ;
  dm.myqry3.open;

  if dm.myqry3.FieldByName('post').value='T' then
  begin

    showmessage('Documento ya fue procesado!!');
    Liquiddqry.Close;
    LIQUIDMQRY.Close;
    LIQUIDMQRY.open;
    LIQUIDMQRY.Locate('pluliquidacion',plu,[]);
    liquiddqry.Open;
    exit;
  end;

 //validar



 borrar_inventario('LIQ-'+LIQUIDMQRYCODIGO.asstring,'LIQ',LIQUIDMQRYPLULIQUIDACION.Value);
 borrar_inv_reserva('LIQ-'+LIQUIDMQRYCODIGO.asstring,'LIQ',LIQUIDMQRYPLULIQUIDACION.Value);


   //verifico si liquidacion tiene detalle con inv final negativo
  dm.myqry.close;
  dm.myqry.sql.clear;
  dm.myqry.sql.add('select COUNT(*) CONT   from liquidacionD where pluliquidacion=:plul and final<0 ');
  dm.myqry.parambyname('plul').value := LIQUIDMQRYPLULIQUIDACION.value;
  dm.myqry.open;

     if (dm.myqry.fieldbyname('cont').value>0) then
     begin

      showmessage('Liquidacion no puede poseer un saldo negativo!!!, no puede procesar Liquidacion!!');
      exit;

     end;



  //verifico si liquidacion tiene detalle
  dm.myqry.close;
  dm.myqry.sql.clear;
  dm.myqry.sql.add('select COUNT(*) CONT   from liquidacionD where pluliquidacion=:plul ');
  dm.myqry.parambyname('plul').value := LIQUIDMQRYPLULIQUIDACION.value;
  dm.myqry.open;

  if ((dm.myqry.fieldbyname('cont').value>0) and (LIQUIDMQRYTOTAL.Value >0)) then
     begin

     if not(validarExisIni) then
  begin
      showmessage('Existe un producto con existencia inicial erronea, recalcule la liquidacion e intente nuevamente, si el error persiste contacte a contabilidad!!!');
     exit;
  end;


        application.CreateForm(TfrmLiqPago,frmLiqPago);
        frmLiqPago.tipo:= 'DSV';
        frmLiqPago.ShowModal;


        dm.myqry.close;
        dm.myqry.sql.clear;
        dm.myqry.sql.add('select sum(monto) monto from liquidacion_det where pluliquidacion=:plul and tipo=''DSV'' ');
        dm.myqry.parambyname('plul').value := plu;
        dm.myqry.open;

       if dm.myqry.isempty then
       begin
        showmessage('No selecciono ninguna forma de pago, no puede procesar Liquidacion!!');
        exit;
       end;

       if dm.myqry.fieldbyname('monto').value <> LIQUIDMQRYTOTAL.value then
      begin
        showmessage('monto de pago difiere de Venta Total, no puede Procesar Liquidacion!!!');
        exit;
      end;



     end;
     //else
     //begin

       if (GTES='S') then
       begin
           application.CreateForm(Tfrmmontotes,frmmontotes);
           frmmontotes.ShowModal;

         // dm.myqry.close;
         // dm.myqry.sql.clear;
         // dm.myqry.sql.add('select coalesce(sum(monto),0) monto from liquidacion_det where pluliquidacion=:plul and tipo=''TES'' ');
         // dm.myqry.parambyname('plul').value := plu;
         // dm.myqry.open;
         //
         //if not(dm.myqry.fieldbyname('monto').Value>0) then
         //begin
         // showmessage('No selecciono ninguna forma de pago TES, no puede procesar Liquidacion!!');
         // exit;
         //end;
       end;




     //end;


  if MessageDlg('Desea Procesar este Documento...?',
   mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin

  dm.IBTransInv.Active:=false;
  dm.IBTransInv.StartTransaction;
  try

  Application.CreateForm(Tprogresofrm,progresofrm);



  //abro el detalle de la  liquidacion
  LiquidDQRY2.close;
  LiquidDQRY2.Params[0].value := plu;
  LiquidDQRY2.Open;


  progresofrm.ProgressBar1.Max:= Liquiddqry2.RecordCount;
  progresofrm.ProgressBar1.Step:=1;
  progresofrm.Caption := 'Procesando Liquidacion!!';
  progresofrm.Show;

  LIQUIDDQRY2.First;



  while NOT LiquidDQRY2.EOF do
  begin



 if LiquidDQRY2saldo.Value>0 then
 begin

  //SACO LA VENTA DE INV_RESERVAS
  PROCESO := procesar_reserva('LIQ',LiquidDQRY2pluproducto.Value,
  LIQUIDMQRYFECHA.Value,'LIQ-'+LIQUIDMQRYCODIGO.asstring,
  'LIQ',0,LiquidDQRY2saldo.Value,LIQUIDMQRYOBSERVACION.AsString,
  LIQUIDMQRYPLUVENDEDOR.Value,plu);
  //showmessage(booltostr(proceso));
  // si ocurre algun error al procesar, rompo el lazo

  if not PROCESO then
  begin
     progresofrm.Close;
     showmessage('error al procesar Reserva');
     //dm.InsResSQL.CancelUpdates;
     dm.IBTransInv.Rollback;
     exit;
  end;


  kardex := outil.ExecuteStringEscalar('select tp.INVENTARIO from producto pr '+
  ' inner join TIPO_PRODUCTO tp on (pr.PLUTIPOPROD=tp.PLUTIPOPROD) '+
  '  where pluproducto='+liquidDQRY2pluproducto.AsString);

     // si tipo de productos aplica kardex
     if (kardex='T') then
     begin

       // SACO LA VENTAS DE INVENTARIO
       PROCESO := procesar_inventario('LIQ',LiquidDQRY2pluproducto.Value,
       LIQUIDMQRYFECHA.Value,'LIQ-'+LIQUIDMQRYCODIGO.asstring,
       'LIQ',0,LiquidDQRY2saldo.Value,LIQUIDMQRYOBSERVACION.AsString,
       DM.BodegaQRYPLUBODEGA.Value,plu);

       // si ocurre algun error al procesar, rompo el lazo

       if not PROCESO then
       begin
            progresofrm.CLOSE;
            showmessage('error al procesar inventario');
            dm.IBTransInv.Rollback;
            exit;
       end;

     end;
  end;

  //progresofrm.ProgressBar1.Position:=progresofrm.ProgressBar1.Position+progreso;
  progresofrm.ProgressBar1.StepIt;
  progresofrm.ProgressBar1.Refresh;

  LiquidDQRY2.Next;



 end;

   progresofrm.Close;

   LIQUIDMQRY.Edit;
   LIQUIDMQRYPOST.Value:='T';
   LIQUIDMQRY.Post;


   dm.MyQry3.close;
   dm.MyQry3.SQL.Clear;
   dm.MyQry3.sql.Add(' update  MOV_SUCURSALM set pluliquidacion=:plul WHERE  PLUEMPLEADOS=:pluempl AND PLULIQUIDACION=0 and post=''T'' ');
   dm.MyQry3.sql.Add('  and cast(fecha as date)=:fecha  ');
   dm.MyQry3.ParamByName('plul').Value := PLU;
   dm.MyQry3.ParamByName('pluempl').Value := LIQUIDMQRYPLUVENDEDOR.Value;
   dm.MyQry3.ParamByName('fecha').Value := LIQUIDMQRYFECHA.Value ;
   dm.MyQry3.ExecSQL;


   dm.MyQry3.close;
   dm.MyQry3.SQL.Clear;
   dm.MyQry3.sql.Add(' update  MOV_SUCURSALM set PLUREQSUCURSAL=:plul WHERE  PLUSUCURSAL2=:pluempl AND PLUREQSUCURSAL=0 AND TIPO=''TRA'' and post=''T'' ');
   dm.MyQry3.sql.Add('  and cast(fecha as date)=:fecha  ');
   dm.MyQry3.ParamByName('plul').Value := PLU;
   dm.MyQry3.ParamByName('pluempl').Value := LIQUIDMQRYPLUVENDEDOR.Value;
   dm.MyQry3.ParamByName('fecha').Value := LIQUIDMQRYFECHA.Value ;
   dm.MyQry3.ExecSQL;

    // si todo se ejecuta con exito, se aplican los cambios
   dm.IBTransInv.Commit;


     progresofrm.Close;

 except
  on e : exception do
    begin

      progresofrm.close;
      //si hay algun error , se deshacen los cambios

      dm.IBTransInv.Rollback;
      ShowMessage ('Clase de error: ' + e.ClassName + chr(13) + chr(13) +
          'Mensaje del error: ' + e.Message+', Error al Procesar  (PP)...');

    end;

  end; //try

  end; //desea continuar



   finally
     progresofrm.Close;
     ShortDateFormat := 'DD/MM/YY';
     outil.free;
   end;
end;

procedure TliquidFRM.Button1Click(Sender: TObject);
begin
  LIQUIDDQRY.Insert;
end;

procedure TliquidFRM.DBMemo1Change(Sender: TObject);
begin

end;

procedure TliquidFRM.edtcodigoEnter(Sender: TObject);
begin
  menufrm.entrar(sender);
end;

procedure TliquidFRM.edtcodigoExit(Sender: TObject);
begin
  menufrm.salir(sender);
end;

procedure TliquidFRM.edtcodigoKeyPress(Sender: TObject; var Key: char);
begin
  key := compruebatecla(key);
end;

procedure TliquidFRM.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
        if idlog>0 then
        begin
         ShortDateFormat := 'MM/DD/YY';
         actualiza_logliq(idlog,datetostr(now),'','','','','N');
         ShortDateFormat := 'DD/MM/YY';
         idlog := 0;
        end;
end;

procedure TliquidFRM.FormCreate(Sender: TObject);
begin
    GBLCODIGO := '';
    GBLVENDEDOR := '';
end;


procedure TliquidFRM.FormShow(Sender: TObject);
begin

  LIQUIDMQRY.CLOSE;
  LIQUIDMQRY.Params[0].VALUE := DM.EmpresaQRYPLUEMPRESA.Value;
  LIQUIDMQRY.Params[1].VALUE := DM.BodegaQRYPLUBODEGA.Value;
  LIQUIDMQRY.Params[2].VALUE := 0;//PLUMOVSUCURSAL
  LIQUIDMQRY.OPEN;

  LIQUIDDQRY.Close;
  LIQUIDDQRY.OPEN;

  vendedoresqry.Close;
  vendedoresqry.Open;

  prodqry.Close;
  prodqry.Open;

  canalqry.Close;
  canalqry.Open;

  CONTROLES(FALSE);

end;



procedure TliquidFRM.GroupBox4Click(Sender: TObject);
begin

end;

procedure TliquidFRM.LIQUIDDQRYAfterPost(DataSet: TDataSet);
var
plu:integer;
begin

  if LIQUIDMQRYpost.Value ='T' then
    exit;

  if liquiddqryfisico.Value<0 then
  begin
    liquiddqry.close;
    liquiddqry.Open;
    exit;
  end;

  if ((liquiddqryfisico.Value) > ((LIQUIDDQRYINICIAL.Value + LIQUIDDQRYPED_RUTA.Value)+
  (LIQUIDDQRYDEVOLUCION.Value))) then
  begin
    showmessage('Fisico no puede ser mayor que inv del vendedor!!');
    liquiddqry.close;
    liquiddqry.Open;
    exit;
  end;

  LIQUIDdQRY.ApplyUpdates;
  plu := liquiddqrypluproducto.Value;
  sumar();
  liquiddqry.Locate('pluproducto',plu,[]);


end;

procedure TliquidFRM.LIQUIDDQRYDESCUENTOValidate(Sender: TField);
begin

  IF ABS(LIQUIDDQRYDESCUENTO.Value) > (LIQUIDDQRYSALDO.Value * LIQUIDDQRYPRECIO.Value ) THEN
     LIQUIDDQRYDESCUENTO.Value :=0 ;

  LIQUIDDQRYTOTAL.Value := (LIQUIDDQRYSALDO.Value * LIQUIDDQRYPRECIO.Value )+LIQUIDDQRYDESCUENTO.Value;

end;

procedure TliquidFRM.LIQUIDDQRYFISICOValidate(Sender: TField);
var
venta,fisico,precio:double;
begin


  fisico := LIQUIDDQRYFISICO.Value;

  if fisico <0 then
    begin

     showmessage('Saldo no debe ser Menor que Cero!!');
     LIQUIDDQRYFISICO.Value :=0;

     exit;
    end;


  venta := ((LIQUIDDQRYINICIAL.Value + LIQUIDDQRYPED_RUTA.Value)+
  (LIQUIDDQRYDEVOLUCION.Value)-fisico)+LIQUIDDQRYTRANSFER.Value;

  if venta < 0 then
  begin
    showmessage('La venta no puede ser negativa!!!!') ;
    venta := 0;
    fisico :=0;
    LIQUIDDQRYFISICO.Value := fisico;
    bitbtn1.Enabled:= false;
  end
  else
    bitbtn1.Enabled:= true;

  LIQUIDDQRYSALDO.Value := venta;

  precio:= 0;
  precio := LIQUIDDQRYPRECIO.Value;//_precio(liquiddqrypluproducto.Value);

  LIQUIDDQRYSUBTOTAL.Value := (venta * precio ); //LIQUIDDQRYPRECIO.Value
  LIQUIDDQRYTOTAL.Value := LIQUIDDQRYSUBTOTAL.Value + LIQUIDDQRYDESCUENTO.Value ;

  LIQUIDDQRYFINAL.Value :=  fisico + LIQUIDDQRYPED_BODEGA.Value;


end;

function TliquidFRM._precio(pluproducto:integer):currency;
var
precio:currency;
begin


    precio := 0;
    if prodqry.Locate('pluproducto',pluproducto,[]) then
        begin

       if prodqryprecio_canal.Value='S' then
               precio := precio_canal(LIQUIDMQRYPLUVENDEDOR.Value,pluproducto);


           if precio=0 then
           begin

             if prodqry.FieldByName('porcentaje_precio').Value>0 then
             precio     := roundd(((prodqry.FieldByName('precio').Value-
             ((prodqry.FieldByName('precio').Value*prodqry.FieldByName('porcentaje_precio').Value)/100))*1.13),5)
             else
             precio     := roundd((prodqry.FieldByName('precio').Value*1.13),3);
           end;
      end;

     result := precio;

end;

procedure TliquidFRM.LiquidDQRYNewRecord(DataSet: TDataSet);
begin

  LIQUIDDQRYPLULIQUIDACION.Value:= LIQUIDMQRYPLULIQUIDACION.Value;
  liquiddqryinicial.Value:= 0;
  liquiddqryped_ruta.Value:= 0;
  liquiddqryfisico.Value:= 0;
  liquiddqrysaldo.Value:= 0;
  liquiddqrydevolucion.Value:= 0;
  liquiddqryped_bodega.Value:= 0;
  liquiddqryTRANSFER.Value:= 0;
  liquiddqryfinal.Value:= 0;
  liquiddqrysubtotal.Value:= 0 ;
  liquiddqrydescuento.Value:= 0;
  liquiddqrytotal.Value:= 0;

end;

procedure TliquidFRM.LIQUIDDQRYSALDOValidate(Sender: TField);
begin

end;

procedure TliquidFRM.LIQUIDMQRY2AfterDelete(DataSet: TDataSet);
begin

  if LIQUIDMQRYpost.Value ='T' then
    exit;


   LIQUIDMQRY.ApplyUpdates;

end;

procedure TliquidFRM.LIQUIDMQRY2AfterPost(DataSet: TDataSet);
begin

end;

procedure TliquidFRM.LIQUIDMQRY2BeforeCancel(DataSet: TDataSet);
begin

end;

procedure TliquidFRM.LIQUIDMQRY2BeforeEdit(DataSet: TDataSet);
begin

end;

procedure TliquidFRM.LIQUIDMQRY2BeforePost(DataSet: TDataSet);
begin

end;

procedure TliquidFRM.LIQUIDMQRY2CalcFields(DataSet: TDataSet);
begin

end;

procedure TliquidFRM.LIQUIDMQRY2CSUPERValidate(Sender: TField);
begin

end;

procedure TliquidFRM.LIQUIDMQRY2CVENDValidate(Sender: TField);
begin

end;

procedure TliquidFRM.LIQUIDMQRY2NewRecord(DataSet: TDataSet);
begin

end;




function Tliquidfrm.validarExisIni:boolean;
var
lsql:string;
return : boolean;
pluliquida,pluproducto :integer;
begin


   return := true;

   //if NOT liquiddqry.IsEmpty then exit;

   dm.myqry.close;
   dm.myqry.sql.clear;
   dm.myqry.sql.add(' select first 1 pluliquidacion as plul from liquidacionm where ');
   dm.myqry.sql.add(' pluvendedor=:pluvendedor and post=''T'' and fecha< :fecha order by fecha desc ');
   dm.myqry.parambyname('pluvendedor').value:= LIQUIDMQRYPLUVENDEDOR.Value;
//   dm.myqry.parambyname('pluliquidacion').value:= LIQUIDMQRYPLULIQUIDACION.Value;
   dm.myqry.parambyname('fecha').value:= LIQUIDMQRYFECHA.Value;
   dm.myqry.open;

    if dm.myqry.fieldbyname('plul').value >0 then
      pluliquida := dm.myqry.fieldbyname('plul').value
      else
      pluliquida :=0;


  ////*************************************************
   //   nuevo proceso 23.11.13
   // ****************    insertamos los registros con saldo final en liquidacion anterior

   lsql := 'select d.pluproducto,d.final,d.precio,p.codigo,p.descripcion from liquidaciond d '+
   ' inner join producto p on (d.pluproducto=p.pluproducto) '+
   ' where d.pluliquidacion='+inttostr(pluliquida)+' and  '+
  '  d.final>0 ';

   liquidAntQRY.close;
   liquidAntQRY.sql.clear;
   liquidAntQRY.sql.add(lsql);
   liquidAntQRY.Open;

   liquiddqry.First;

   while not liquidAntQRY.EOF  and (pluliquida>0) do
   begin

     pluproducto :=  liquidAntQRY.FieldByName('pluproducto').Value;

     if (liquiddqry.Locate('pluproducto',pluproducto,[])) then
     begin
          if liquiddqryinicial.Value <> liquidAntQRY.fieldbyname('final').value then
          begin
            return := false;
            result := return;
             exit;
          end;
     end
     else
     begin
            return := false;
            result := return;
            exit;
     end;


       liquidAntQRY.next;

     end;

     result := return;

end;



procedure Tliquidfrm.inventario2 ;
var
pluproducto,pluliquida :integer;
 inicial,Devolucion,transfer,ped_ruta,venta :variant;
precio : currency;
lsql:string;
begin

   if LIQUIDMQRYPOST.Value ='T' then
      exit;


   //if NOT liquiddqry.IsEmpty then exit;

   dm.myqry.close;
   dm.myqry.sql.clear;
   dm.myqry.sql.add(' select first 1 pluliquidacion as plul from liquidacionm where ');
   dm.myqry.sql.add(' pluvendedor=:pluvendedor and post=''T''  '+
   ' and fecha < :fecha  order by fecha desc ');
   dm.myqry.parambyname('pluvendedor').value:= LIQUIDMQRYPLUVENDEDOR.Value;
  // dm.myqry.parambyname('pluliquidacion').value:= LIQUIDMQRYPLULIQUIDACION.Value;
   dm.myqry.parambyname('fecha').value:= LIQUIDMQRYFECHA.Value;
   dm.myqry.open;



   if dm.myqry.fieldbyname('plul').value >0 then
      pluliquida := dm.myqry.fieldbyname('plul').value
      else
      pluliquida :=0;



   ////*************************************************
   //   nuevo proceso 23.11.13
   // ****************    insertamos los registros con saldo final en liquidacion anterior

   lsql := 'select p.codigo,d.precio,d.final,d.pluproducto,d.pluliquidacion,p.descripcion from liquidaciond d '+
   ' inner join producto p on (d.pluproducto=p.pluproducto) '+
   ' where d.pluliquidacion='+inttostr(pluliquida)+' and  '+
  '  d.final>0 ';

   liquidAntQRY.close;
   liquidAntQRY.sql.clear;
   liquidAntQRY.sql.add(lsql);
   liquidAntQRY.Open;

   liquiddqry.First;

   while not liquidAntQRY.EOF do
   begin

     pluproducto :=  liquidAntQRY.FieldByName('pluproducto').Value;

     precio     := liquidAntQRY.FieldByName('precio').Value;


      if prodqry.Locate('pluproducto',pluproducto,[]) then
        begin

       if prodqryprecio_canal.Value='S' then
               precio := precio_canal(LIQUIDMQRYPLUVENDEDOR.Value,pluproducto);


           if precio=0 then
           begin

             if prodqry.FieldByName('porcentaje_precio').Value>0 then
             precio     := roundd(((prodqry.FieldByName('precio').Value-
             ((prodqry.FieldByName('precio').Value*prodqry.FieldByName('porcentaje_precio').Value)/100))*1.13),5)
             else
             precio     := roundd((prodqry.FieldByName('precio').Value*1.13),3);
           end;
      end;

     if not(liquiddqry.Locate('pluproducto',pluproducto,[])) then
     begin
     liquiddqry.Insert;
     liquiddqrypluproducto.Value := pluproducto ;
     liquiddqryinicial.Value:= liquidAntQRY.FieldByName('final').Value;
     liquiddqryped_ruta.Value:= 0;
     liquiddqryfisico.Value:= 0;
     liquiddqrysaldo.Value:= 0;
     liquiddqrydevolucion.Value:= 0;
     liquiddqryped_bodega.Value:= 0;
     liquiddqryTRANSFER.Value:= 0;
     liquiddqryfinal.Value:= 0;
     liquiddqrysubtotal.Value:= 0 ;
     liquiddqrydescuento.Value:= 0;
     liquiddqrytotal.Value:= 0;
     liquiddqrycodigo.Value := liquidAntQRY.FieldByName('codigo').Value;
     liquiddqrydescripcion.Value := liquidAntQRY.FieldByName('descripcion').Value;
     liquiddqryprecio.Value := precio ;
     liquiddqry.Post;
     end
     else
     begin
           liquiddqry.edit;
           liquiddqryinicial.Value:= liquidAntQRY.FieldByName('final').Value;
           //liquiddqryinicial.Value:= liquidAntQRY.FieldByName('final').Value;
     liquiddqryped_ruta.Value:= 0;
     liquiddqryfisico.Value:= 0;
     liquiddqrysaldo.Value:= 0;
     liquiddqrydevolucion.Value:= 0;
     liquiddqryped_bodega.Value:= 0;
     liquiddqryTRANSFER.Value:= 0;
     liquiddqryfinal.Value:= 0;
     liquiddqrysubtotal.Value:= 0 ;
     liquiddqrydescuento.Value:= 0;
     liquiddqrytotal.Value:= 0;
     liquiddqrycodigo.Value := liquidAntQRY.FieldByName('codigo').Value;
     liquiddqrydescripcion.Value := liquidAntQRY.FieldByName('descripcion').Value;
     liquiddqryprecio.Value := precio ;
     liquiddqry.Post;
       end;

       liquidAntQRY.next;

     end;





   // producto con movimientos
   prodQRY2.close;
   prodQRY2.SQL.Clear;
   prodQRY2.sql.add(' select a.codigo,a.pluproducto,a.descripcion,a.precio,a.porcentaje_precio  '+
  '  from producto a                '+
  '  inner join MOV_SUCURSALD md on (a.PLUPRODUCTO=md.PLUPRODUCTO)   '+
  '  INNER JOIN MOV_SUCURSALM mm ON (md.PLUMOVSUCURSAL=mm.PLUMOVSUCURSAL)  '+
  ' where  mm.POST=''T'' AND  (mm.PLULIQUIDACION=0 AND mm.PLUEMPLEADOS=:PLUEMPLEADOS) '+
  ' OR (mm.PLUSUCURSAL2=:PLUEMPLEADOS AND mm.PLUREQSUCURSAL=0 AND mm.TIPO=''TRA'' ) '+
   ' AND mm.pluempresa=:PLUEMPRESA   ');
   prodQRY2.parambyname('pluempleados').value := LIQUIDMQRYPLUVENDEDOR.Value;
   prodQRY2.parambyname('PLUEMPRESA').value := dm.EmpresaQRYPLUEMPRESA.value;
   prodQRY2.Open;


   progresofrm.ProgressBar1.Max:= prodqry.RecordCount;
   progresofrm.ProgressBar1.Position:=0;
   progresofrm.ProgressBar1.Step:=1;
   progresofrm.Caption := 'Verificando Productos Con Movimientos!!';
   progresofrm.ProgressBar1.Refresh;
   progresofrm.Refresh;

   prodQRY2.First;
   liquiddqry.First;

   while not prodqry2.EOF do
   begin

     pluproducto :=  prodqry2.FieldByName('pluproducto').Value;


       if prodqry2.FieldByName('porcentaje_precio').Value>0 then
         precio     := roundd(((prodqry2.FieldByName('precio').Value-
        ((prodqry2.FieldByName('precio').Value*prodqry2.FieldByName('porcentaje_precio').Value)/100))*1.13),5)
        else
        precio     := roundd((prodqry2.FieldByName('precio').Value*1.13),5);

     if (precio=0) then
     begin
          if prodqry.Locate('pluproducto',pluproducto,[]) then
        begin

          if prodqryprecio_canal.Value='S' then
               precio := precio_canal(LIQUIDMQRYPLUVENDEDOR.Value,pluproducto);


           if precio=0 then
           begin

             if prodqry.FieldByName('porcentaje_precio').Value>0 then
             precio     := roundd(((prodqry.FieldByName('precio').Value-
             ((prodqry.FieldByName('precio').Value*prodqry.FieldByName('porcentaje_precio').Value)/100))*1.13),5)
             else
             precio     := roundd((prodqry.FieldByName('precio').Value*1.13),3);
           end;
         end;
     end;


     if not (liquiddqry.Locate('pluproducto',pluproducto,[])) then
        begin

         liquiddqry.Insert;
         liquiddqryinicial.Value:= 0;
         liquiddqrypluproducto.Value := pluproducto ;
         liquiddqryped_ruta.Value:= 0;
         liquiddqryfisico.Value:= 0;
         liquiddqrysaldo.Value:= 0;
         liquiddqrydevolucion.Value:= 0;
         liquiddqryped_bodega.Value:= 0;
         liquiddqryTRANSFER.Value:= 0;
         liquiddqryfinal.Value:= 0;
         liquiddqrysubtotal.Value:= 0 ;
         liquiddqrydescuento.Value:= 0;
         liquiddqrytotal.Value:= 0;
         liquiddqrycodigo.Value := prodqry2.FieldByName('codigo').Value;
         liquiddqrydescripcion.Value := prodqry2.FieldByName('descripcion').Value;
         liquiddqryprecio.Value := precio ;
         liquiddqry.Post;

        end;

     //liquiddqry.Insert;


      progresofrm.ProgressBar1.StepIt;
      progresofrm.Caption := 'Verificando Productos Con Movimientos!! :'+inttostr(prodqry2.RecNo);
      progresofrm.ProgressBar1.Refresh;
      progresofrm.Refresh;


    prodqry2.Next;

   end;


  //Application.CreateForm(Tprogresofrm,progresofrm);
  progresofrm.ProgressBar1.Max:= Liquiddqry.RecordCount;
  progresofrm.ProgressBar1.Step:=1;
  progresofrm.Caption := 'Actualizando Saldos!!';
  progresofrm.ProgressBar1.Position:=0;
  progresofrm.ProgressBar1.Refresh;
  progresofrm.Refresh;

   liquiddqry.Refresh;

   liquiddqry.First;

   while not liquiddqry.EOF do
   begin

     pluproducto :=  liquiddqry.FieldByName('pluproducto').Value;

     if pluliquida =0  then
        inicial := 0
        else
        inicial := liquiddqryinicial.Value;
        //else
        //inicial := saldo_ini(pluproducto,pluliquida);


        devolucion := movimientos(pluproducto,'DEV',3);
        ped_ruta   := movimientos(pluproducto,'CAR',1);
        transfer   := movimientos(pluproducto,'TRA',4);

        venta      := inicial + ped_ruta + devolucion + transfer;
        if venta < 0 then
           begin
             inicial := saldo_ini(pluproducto,pluliquida);
             venta      := inicial + ped_ruta + devolucion + transfer;
           end;

        if venta < 0 then
        begin
               showmessage('No puede existir venta negativa,'+INTTOSTR(venta)+' corrija el saldo!!!!!') ;
               exit;
        end;

        precio :=liquiddqryprecio.Value;

         if prodqry.Locate('pluproducto',pluproducto,[]) then
        begin


           if prodqryprecio_canal.Value='S' then
             precio := precio_canal(LIQUIDMQRYPLUVENDEDOR.Value,pluproducto);


         if precio=0 then
         begin

           if prodqry.FieldByName('porcentaje_precio').Value>0 then
           precio     := roundd(((prodqry.FieldByName('precio').Value-
           ((prodqry.FieldByName('precio').Value*prodqry.FieldByName('porcentaje_precio').Value)/100))*1.13),5)
           else
           precio     := roundd((prodqry.FieldByName('precio').Value*1.13),3);
         end;

     end;

     liquiddqry.edit;
     liquiddqrypluproducto.Value := pluproducto ;
     liquiddqryinicial.Value:= inicial;
     liquiddqryped_ruta.Value:= ped_ruta;
     liquiddqrysaldo.Value:= venta-liquiddqryfisico.Value;
     liquiddqrydevolucion.Value:= devolucion;
     liquiddqryped_bodega.Value:= movimientos(pluproducto,'CAR',2);
     liquiddqryTRANSFER.Value:= transfer;
     liquiddqryfinal.Value:= liquiddqryfisico.Value + movimientos(pluproducto,'CAR',2);
     liquiddqrysubtotal.Value:= precio * liquiddqrysaldo.Value ;
     liquiddqrytotal.Value:= (precio * liquiddqrysaldo.Value)+liquiddqrydescuento.Value;
     //liquiddqryprecio.Value := precio ;
     //liquiddqryprecio.Value := liquiddqrysubtotal.Value /  liquiddqrysaldo.Value;
     liquiddqry.Post;

     PRECIOSQL.Close;
     PRECIOSQL.PARAMS[0].Value:=PRECIO;
     PRECIOSQL.PARAMS[1].Value:=LIQUIDDQRYPLULIQUIDACION.VALUE;
     PRECIOSQL.PARAMS[2].Value:=pluproducto;
     PRECIOSQL.ExecQuery;


      progresofrm.ProgressBar1.StepIt;
      progresofrm.Caption := 'Verificando Actualizando Saldos!! :'+inttostr(liquiddqry.RecNo);
      progresofrm.ProgressBar1.Refresh;
      progresofrm.Refresh;

   liquiddqry.Next;

   end;

     liquiddqry.Refresh;

end;

procedure Tliquidfrm.inventario ;
var
pluproducto,pluliquida :integer;
 inicial,Devolucion,transfer,ped_ruta,venta :variant;
precio : currency;
lsql:string;
begin

   if LIQUIDMQRYPOST.Value ='T' then
      exit;

   dm.myqry.close;
   dm.myqry.sql.clear;
   dm.myqry.sql.add(' select first 1 pluliquidacion as plul from liquidacionm where ');
   dm.myqry.sql.add(' pluvendedor=:pluvendedor and post=''T''  '+
   ' and fecha < :fecha  order by fecha desc ');
   dm.myqry.parambyname('pluvendedor').value:= LIQUIDMQRYPLUVENDEDOR.Value;
   dm.myqry.parambyname('fecha').value:= LIQUIDMQRYFECHA.Value;
   dm.myqry.open;



   if dm.myqry.fieldbyname('plul').value >0 then
      pluliquida := dm.myqry.fieldbyname('plul').value
      else
      pluliquida :=0;

   ////*************************************************
   //   nuevo proceso 23.11.13
   // ****************    insertamos los registros con saldo final en liquidacion anterior

   lsql := 'select p.codigo,d.precio,d.final,d.pluproducto,d.pluliquidacion,p.descripcion from liquidaciond d '+
   ' inner join producto p on (d.pluproducto=p.pluproducto) '+
   ' where d.pluliquidacion='+inttostr(pluliquida)+' and  '+
  '  d.final>0 ';

   liquidAntQRY.close;
   liquidAntQRY.sql.clear;
   liquidAntQRY.sql.add(lsql);
   liquidAntQRY.Open;

   liquiddqry.First;

   while not liquidAntQRY.EOF do
   begin

     pluproducto :=  liquidAntQRY.FieldByName('pluproducto').Value;

     if not(liquiddqry.Locate('pluproducto',pluproducto,[])) then
     begin
         liquiddqry.Insert;
         liquiddqrycodigo.Value := liquidAntQRY.FieldByName('codigo').Value;
         liquiddqryinicial.Value:= liquidAntQRY.FieldByName('final').Value;
         liquiddqry.Post;
     end
     else
     begin
           liquiddqry.edit;
           liquiddqryinicial.Value:= liquidAntQRY.FieldByName('final').Value;
           liquiddqrycodigo.Value := liquidAntQRY.FieldByName('codigo').Value;
           liquiddqrydescripcion.Value := liquidAntQRY.FieldByName('descripcion').Value;
           liquiddqry.Post;
       end;

       liquidAntQRY.next;

     end;





   // producto con movimientos
   prodQRY2.close;
   prodQRY2.SQL.Clear;
   prodQRY2.sql.add(' select a.codigo,a.pluproducto,a.descripcion,a.precio,a.porcentaje_precio  '+
  '  from producto a                '+
  '  inner join MOV_SUCURSALD md on (a.PLUPRODUCTO=md.PLUPRODUCTO)   '+
  '  INNER JOIN MOV_SUCURSALM mm ON (md.PLUMOVSUCURSAL=mm.PLUMOVSUCURSAL)  '+
  ' where  mm.POST=''T'' AND  (mm.PLULIQUIDACION=0 AND mm.PLUEMPLEADOS=:PLUEMPLEADOS) '+
  ' OR (mm.PLUSUCURSAL2=:PLUEMPLEADOS AND mm.PLUREQSUCURSAL=0 AND mm.TIPO=''TRA'' ) '+
   ' AND mm.pluempresa=:PLUEMPRESA   ');
   prodQRY2.parambyname('pluempleados').value := LIQUIDMQRYPLUVENDEDOR.Value;
   prodQRY2.parambyname('PLUEMPRESA').value := dm.EmpresaQRYPLUEMPRESA.value;
   prodQRY2.Open;


   progresofrm.ProgressBar1.Max:= prodqry.RecordCount;
   progresofrm.ProgressBar1.Position:=0;
   progresofrm.ProgressBar1.Step:=1;
   progresofrm.Caption := 'Verificando Productos Con Movimientos!!';
   progresofrm.ProgressBar1.Refresh;
   progresofrm.Refresh;

   prodQRY2.First;
   liquiddqry.First;

   while not prodqry2.EOF do
   begin

     pluproducto :=  prodqry2.FieldByName('pluproducto').Value;

     if not (liquiddqry.Locate('pluproducto',pluproducto,[])) then
        begin

         liquiddqry.Insert;
         liquiddqrycodigo.Value := prodqry2.FieldByName('codigo').Value ;
         liquiddqry.Post;

        end;

     //liquiddqry.Insert;


      progresofrm.ProgressBar1.StepIt;
      progresofrm.Caption := 'Verificando Productos Con Movimientos!! :'+inttostr(prodqry2.RecNo);
      progresofrm.ProgressBar1.Refresh;
      progresofrm.Refresh;


    prodqry2.Next;

   end;


  //Application.CreateForm(Tprogresofrm,progresofrm);
  progresofrm.ProgressBar1.Max:= Liquiddqry.RecordCount;
  progresofrm.ProgressBar1.Step:=1;
  progresofrm.Caption := 'Actualizando Saldos!!';
  progresofrm.ProgressBar1.Position:=0;
  progresofrm.ProgressBar1.Refresh;
  progresofrm.Refresh;

   liquiddqry.Refresh;

   liquiddqry.First;

   while not liquiddqry.EOF do
   begin

     pluproducto :=  liquiddqry.FieldByName('pluproducto').Value;

     if pluliquida =0  then
        inicial := 0
        else
        inicial := liquiddqryinicial.Value;
        //else
        //inicial := saldo_ini(pluproducto,pluliquida);


        devolucion := movimientos(pluproducto,'DEV',3);
        ped_ruta   := movimientos(pluproducto,'CAR',1);
        transfer   := movimientos(pluproducto,'TRA',4);

        venta      := inicial + ped_ruta + devolucion + transfer;
        if venta < 0 then
           begin
             inicial := saldo_ini(pluproducto,pluliquida);
             venta      := inicial + ped_ruta + devolucion + transfer;
           end;

        if venta < 0 then
        begin
               showmessage('No puede existir venta negativa,'+INTTOSTR(venta)+' corrija el saldo!!!!!') ;
               exit;
        end;




     liquiddqry.edit;
     //liquiddqrypluproducto.Value := pluproducto ;
     liquiddqryinicial.Value:= inicial;
     liquiddqryped_ruta.Value:= ped_ruta;
     liquiddqrysaldo.Value:= venta-liquiddqryfisico.Value;
     liquiddqrydevolucion.Value:= devolucion;
     liquiddqryped_bodega.Value:= movimientos(pluproducto,'CAR',2);
     liquiddqryTRANSFER.Value:= transfer;
     liquiddqryfinal.Value:= liquiddqryfisico.Value + movimientos(pluproducto,'CAR',2);
     liquiddqrysubtotal.Value:= liquiddqryprecio.Value * liquiddqrysaldo.Value ;
     liquiddqrytotal.Value:= (liquiddqryprecio.Value * liquiddqrysaldo.Value)+liquiddqrydescuento.Value;
     liquiddqry.Post;

     {
      PRECIOSQL.Close;
      PRECIOSQL.PARAMS[0].Value:=PRECIO;
      PRECIOSQL.PARAMS[1].Value:=LIQUIDDQRYPLULIQUIDACION.VALUE;
      PRECIOSQL.PARAMS[2].Value:=pluproducto;
      PRECIOSQL.ExecQuery;

     }

      progresofrm.ProgressBar1.StepIt;
      progresofrm.Caption := 'Verificando Actualizando Saldos!! :'+inttostr(liquiddqry.RecNo);
      progresofrm.ProgressBar1.Refresh;
      progresofrm.Refresh;

   liquiddqry.Next;

   end;

     liquiddqry.Refresh;

end;

 // precio por canal + iva
function TLiquidFRM.precio_canal(pluvendedor,pluproducto:integer):currency;
var
 precio:currency;
 qry:Tibquery;
begin

  precio := 0;

  if vendedoresqry.Locate('pluempleados',LIQUIDMQRYPLUVENDEDOR.Value,[]) then
  begin

  //SHOWMESSAGE(uppercase(TRIM(vendedoresqrycanal.AsString)));

  if canalqry.Locate('canal',uppercase(TRIM(vendedoresqrycanal.Value)),[]) then
  begin

  try
    qry := tibquery.Create(self);
    qry.database := dm.fbDB;


    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add(' select coalesce(precio,0) precio,coalesce(descuento,0) descuento from PR_PRECIO_CANAL where idcanal= '''+canalqryidcanal.AsString+''' and '+
    ' idproducto='''+inttostr(pluproducto)+''' ');
    qry.Open;


    if qry.FieldByName('precio').Value>0 then
      precio := qry.FieldByName('precio').Value - qry.FieldByName('descuento').Value
      else
      precio := 0;


  finally
     qry.Free;
  end;

  end;


  end; // localizo el vendedor

  result := precio;


end;

function TLiquidFRm.Saldo_ini(producto,pluliquida:integer):integer;
var
iniLiq,iniSis,existencia:integer;
lsql:string;
begin


  lsql := 'select final from liquidaciond where pluliquidacion='+inttostr(pluliquida)+' and  '+
  ' pluproducto= '+inttostr(producto)+'';

   dm.myqry.close;
   dm.myqry.sql.clear;
   dm.myqry.sql.add(lsql);
   dm.myqry.Open;

   if dm.myqry.FieldByName('final').IsNull then
   iniLiq := 0
   else
   iniLiq := dm.myqry.FieldByName('final').value;


   dm.myqry.close;
   dm.myqry.sql.clear;
   dm.myqry.sql.add('select sum(entrada)-sum(salida) final from inv_reservas where '+
   ' plubodegas=:plub and cast(fecha as date)<'''+LIQUIDMQRYFECHA.AsString+''' ');
   dm.myqry.sql.add(' and pluproducto=:pluprod ');
   dm.myqry.parambyname('plub').value    :=  LIQUIDMQRYPLUVENDEDOR.value;
   dm.myqry.parambyname('pluprod').value :=  producto;
   dm.myqry.Open;

   if dm.myqry.FieldByName('final').IsNull then
   iniSis:=0
   else
   iniSis := dm.myqry.FieldByName('final').value;

   if iniLiq<>inisis then
   begin
     application.CreateForm(TfrmDExisIni,frmDExisIni);
     frmDExisIni.lblKardex.caption := inttostr(iniSis) ;
     frmDExisIni.lblliquid.caption := inttostr(iniLiq) ;
     frmDExisIni.showmodal;

     if cual_existencia=1 then
        existencia := iniSis
        else
        existencia := iniLiq;

      frmDExisIni.close;

   end
   else
   existencia :=  iniLiq;

   if existencia >0 then
      result := existencia
      else
      result := 0;

end;



procedure TliquidFRM.LIQUIDMQRYBeforeEdit(DataSet: TDataSet);
begin

   NUEVO := 'N';
   CONTROLES(TRUE);
   BtnBuscaVend.Enabled := false;
   EdtVendedor.enabled:= false;

   //EDTFECHA.SetFocus;
end;

function TliquidFrm.movimientos(pluprod:integer;TIPO:STRING;PLUTIPO:INTEGER):variant;
Var
lsql:string;
Cant,cant2:variant;
BEGIN

  IF (TIPO='TRA') THEN
  BEGIN

   lsql := ' SELECT SUM(A.CANTIDAD) cantidad FROM MOV_SUCURSALD A '+
   'INNER JOIN MOV_SUCURSALM B ON (A.PLUMOVSUCURSAL=B.PLUMOVSUCURSAL)'+
   'WHERE A.PLUPRODUCTO=:pluprod AND B.TIPO LIKE :TIPO AND B.PLUTIPO=:PLUTIPO '+
   'AND B.PLUEMPLEADOS=:PLUEMPLEADO AND B.PLULIQUIDACION=0 AND B.POST=''T'' '+
   ' AND FECHA =:FECHA ';

   DM.MYQRY.CLOSE;
   DM.MYQRY.SQL.CLEAR;
   DM.MYQRY.SQL.ADD(LSQL);
   DM.MYQRY.PARAMBYNAME('pluprod').VALUE := pluprod;
   DM.MYQRY.PARAMBYNAME('TIPO').VALUE := TIPO;
   DM.MYQRY.PARAMBYNAME('PLUTIPO').VALUE := PLUTIPO;
   DM.MYQRY.PARAMBYNAME('PLUEMPLEADO').VALUE := LIQUIDMQRYPLUVENDEDOR.VALUE;
   DM.MYQRY.PARAMBYNAME('FECHA').VALUE := LIQUIDMQRYFECHA.Value;
   DM.MYQRY.OPEN;

      if dm.myqry.fieldbyname('cantidad').value>0 then
      cant := dm.myqry.fieldbyname('cantidad').value
      else
      cant :=0;

      IF CANT >0 THEN
         CANT := CANT * -1;


      lsql := ' SELECT SUM(A.CANTIDAD) cantidad FROM MOV_SUCURSALD A '+
   'INNER JOIN MOV_SUCURSALM B ON (A.PLUMOVSUCURSAL=B.PLUMOVSUCURSAL)'+
   'WHERE A.PLUPRODUCTO=:pluprod AND B.TIPO LIKE :TIPO AND B.PLUTIPO=:PLUTIPO '+
   'AND B.PLUSUCURSAL2=:PLUEMPLEADO AND B.PLUREQSUCURSAL=0 AND B.POST=''T'' '+
    ' AND FECHA =:FECHA ';

   DM.MYQRY.CLOSE;
   DM.MYQRY.SQL.CLEAR;
   DM.MYQRY.SQL.ADD(LSQL);
   DM.MYQRY.PARAMBYNAME('pluprod').VALUE := pluprod;
   DM.MYQRY.PARAMBYNAME('TIPO').VALUE := TIPO;
   DM.MYQRY.PARAMBYNAME('PLUTIPO').VALUE := PLUTIPO;
   DM.MYQRY.PARAMBYNAME('PLUEMPLEADO').VALUE := LIQUIDMQRYPLUVENDEDOR.VALUE;
   DM.MYQRY.PARAMBYNAME('FECHA').VALUE := LIQUIDMQRYFECHA.Value;
   DM.MYQRY.OPEN;

      if dm.myqry.fieldbyname('cantidad').value>0 then
      cant2 := dm.myqry.fieldbyname('cantidad').value
      else
      cant2 :=0;

       CANT := CANT + CANT2;


   END
   ELSE
   BEGIN

   lsql := ' SELECT SUM(A.CANTIDAD) cantidad FROM MOV_SUCURSALD A '+
   'INNER JOIN MOV_SUCURSALM B ON (A.PLUMOVSUCURSAL=B.PLUMOVSUCURSAL)'+
   'WHERE A.PLUPRODUCTO=:pluprod AND B.TIPO LIKE :TIPO AND B.PLUTIPO=:PLUTIPO '+
   'AND B.PLUEMPLEADOS=:PLUEMPLEADO AND B.PLULIQUIDACION=0 AND  B.POST=''T'' '+
    ' AND FECHA =:FECHA ';

   DM.MYQRY.CLOSE;
   DM.MYQRY.SQL.CLEAR;
   DM.MYQRY.SQL.ADD(LSQL);
   DM.MYQRY.PARAMBYNAME('pluprod').VALUE := pluprod;
   DM.MYQRY.PARAMBYNAME('TIPO').VALUE := TIPO;
   DM.MYQRY.PARAMBYNAME('PLUTIPO').VALUE := PLUTIPO;
   DM.MYQRY.PARAMBYNAME('PLUEMPLEADO').VALUE := LIQUIDMQRYPLUVENDEDOR.VALUE;
   DM.MYQRY.PARAMBYNAME('FECHA').VALUE := LIQUIDMQRYFECHA.Value;
   DM.MYQRY.OPEN;

      if dm.myqry.fieldbyname('cantidad').value>0 then
      cant := dm.myqry.fieldbyname('cantidad').value
      else
      cant :=0;

      IF (TIPO='DEV') THEN
        IF CANT>0 THEN
           CANT := CANT * -1;



   end;


   result := cant;


END;


function TliquidFRM.compruebatecla(key:char):char;
begin

   if ( key = Char(VK_RETURN) ) then // -- En caso de pulsar enter, pasa al siguiente campo
         begin
              key:=#0;
              SelectNext(activecontrol,true,true);
         end;
      if ( key = Char(VK_UP) ) then // -- Si pulsamos la flecha arriba, vuelve al campo anterior
         begin
              key:=#0;
              SelectNext(activecontrol,false,true);
         end;
      if ( key = Char(VK_DOWN) ) then // -- Si pulsamos la flecha abajo, pasa al campo siguiente
         begin
              key:=#0;
              SelectNext(activecontrol,true,true);
         end;
      compruebatecla:=(key);
 end;


initialization
  {$I liqliquidacion.lrs}

end.

