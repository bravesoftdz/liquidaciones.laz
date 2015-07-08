unit liqasignaform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, LResources, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, StdCtrls, DbCtrls, DBGrids, Buttons, LR_Class,
  LR_Desgn, LR_DBSet, frametools, ComCtrls, db, LCLType, Menus, IBQuery,
  IBUpdateSQL, IBCustomDataSet;


type

  { Tliqasignafrm }

  Tliqasignafrm = class(TForm)
    btnBuscaVend1: TSpeedButton;
    btnBuscaVend2: TSpeedButton;
    EDTFECHA: TDBDateTimePicker;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBText1: TDBText;
    edtTipo: TDBEdit;
    edtVendedor1: TDBEdit;
    msucursald2QRYCANT: TIBBCDField;
    msucursald2QRYCODIGO: TIBStringField;
    msucursald2QRYOBSERVACION: TIBStringField;
    msucursald2QRYPLUMOVSUCURSAL: TIntegerField;
    msucursald2QRYPLUPRODUCTO: TIntegerField;
    MSUCURSALDQRYCANTIDAD: TIBBCDField;
    MSUCURSALDQRYCODIGO: TIBStringField;
    MSUCURSALDQRYCOSTOPROMEDIO: TFloatField;
    MSUCURSALDQRYDESCRIPCION: TIBStringField;
    MSUCURSALDQRYITEM: TIntegerField;
    MSUCURSALDQRYOBSERVACION: TIBStringField;
    MSUCURSALDQRYPENDIENTE: TIntegerField;
    MSUCURSALDQRYPLUEMPRESA: TIntegerField;
    MSUCURSALDQRYPLUMOVSUCURSAL: TIntegerField;
    MSUCURSALDQRYPLUPRODUCTO: TIntegerField;
    MSUCURSALDQRYTOTAL: TCurrencyField;
    MSUCURSALDQRYULTIMOCOSTO: TFloatField;
    MSUCURSALDQRYUNITARIO: TFloatField;
    MSucursalMQRYANULADO: TIBStringField;
    MSucursalMQRYBODEGA: TIBStringField;
    MSucursalMQRYCODIGO: TIntegerField;
    MSucursalMQRYCVEND: TIBStringField;
    MSucursalMQRYEGRESO: TIBStringField;
    MSucursalMQRYENTREGADO: TIBStringField;
    MSucursalMQRYENVIADO: TIBStringField;
    MSucursalMQRYENVIO: TIntegerField;
    MSucursalMQRYFECHA: TDateTimeField;
    MSucursalMQRYFECHA_CREA: TDateTimeField;
    MSucursalMQRYFECHA_ENVIADO: TDateTimeField;
    MSucursalMQRYFECHA_PROCESADO: TDateTimeField;
    MSucursalMQRYINGRESO: TIBStringField;
    MSucursalMQRYNOMBRE: TIBStringField;
    MSucursalMQRYOBSERVACIONES: TIBStringField;
    MSucursalMQRYPLUEMPLEADOS: TIntegerField;
    MSucursalMQRYPLUEMPLEADOS_PROCESADO: TIntegerField;
    MSucursalMQRYPLUEMPRESA: TIntegerField;
    MSucursalMQRYPLULIQUIDACION: TIntegerField;
    MSucursalMQRYPLUMOVSUCURSAL: TIntegerField;
    MSucursalMQRYPLUREQSUCURSAL: TIntegerField;
    MSucursalMQRYPLUSUARIO: TIntegerField;
    MSucursalMQRYPLUSUCURSAL: TIntegerField;
    MSucursalMQRYPLUSUCURSAL2: TIntegerField;
    MSucursalMQRYPLUTIPO: TIntegerField;
    MSucursalMQRYPOST: TIBStringField;
    MSucursalMQRYPREPARAR: TIBStringField;
    MSucursalMQRYPROCESADO: TIBStringField;
    MSucursalMQRYRECIBIDO: TIBStringField;
    MSucursalMQRYTIPO: TIBStringField;
    MSucursalMQRYTIPO_PEDIDO: TIBStringField;
    rptMOVqry: TIBQuery;
    msucursald2QRY: TIBQuery;
    MSUCURSALDQRY: TIBQuery;
    MSUCURSALDSQL: TIBUpdateSQL;
    MsucursalmSQL: TIBUpdateSQL;
    MSucursalMQRY: TIBQuery;
    Label10: TLabel;
    Label11: TLabel;
    Label9: TLabel;
    lrpt: TfrReport;
    MSucursalMQRYstatus1: TStringField;
    rptMovDS: TDatasource;
    edtVendedor: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    frDBDataSet1: TfrDBDataSet;
    Label8: TLabel;
    MSUCURSALDDS: TDatasource;
    GRIDDET: TDBGrid;
    DBMemo1: TDBMemo;
    edtcodigo: TDBEdit;
    frmtoolsbar1: Tfrmtoolsbar;
    GroupBox4: TGroupBox;
    Label37: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    MSUCURSALDQRYTotal1: TFloatField;
    MSUCURSALMDS: TDatasource;
    MSucursalMQRYestatus1: TStringField;
    Panel1: TPanel;
    Panel2: TPanel;
    btnBuscaVend: TSpeedButton;
    rptMOVqryBODEGA: TStringField;
    rptMOVqryCANTIDAD: TFloatField;
    rptMOVqryCODPROD: TStringField;
    rptMOVqryDOC: TLongintField;
    rptMOVqryEMPRESA: TStringField;
    rptMOVqryESTATUS1: TStringField;
    rptMOVqryFECHA: TDateTimeField;
    rptMOVqryITEM: TLongintField;
    rptMOVqryPLUMOVSUCURSAL: TLongintField;
    rptMOVqryPLUPRODUCTO: TLongintField;
    rptMOVqryPLUTIPO: TLongintField;
    rptMOVqryPRODUCTO: TStringField;
    rptMOVqryTIPO: TStringField;
    rptMOVqrytipodoc1: TStringField;
    rptMOVqryTIPO_PEDIDO: TStringField;
    rptMOVqryUNITARIO: TFloatField;
    rptMOVqryUSUARIO: TStringField;
    rptMOVqryVENDEDOR: TStringField;
    SpeedButton1: TSpeedButton;
    procedure btnBuscar1Click(Sender: TObject);
    procedure btnBuscaVend1Click(Sender: TObject);
    procedure btnprocesarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure DBText1Click(Sender: TObject);
    procedure edtcodigoEnter(Sender: TObject);
    procedure edtcodigoExit(Sender: TObject);
    procedure edtcodigoKeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
    procedure frDBDataSet1CheckEOF(Sender: TObject; var Eof: Boolean);
    procedure frUserDataset1CheckEOF(Sender: TObject; var Eof: Boolean);
    procedure Label4Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure msucursald2QRYAfterInsert(DataSet: TDataSet);
    procedure MSUCURSALDQRYAfterDelete(DataSet: TDataSet);
    procedure MSUCURSALDQRYAfterEdit(DataSet: TDataSet);
    procedure MSUCURSALDQRYBeforeEdit(DataSet: TDataSet);
    procedure MSUCURSALDQRYBeforePost(DataSet: TDataSet);
    procedure MSUCURSALDQRYCANTIDADValidate(Sender: TField);
    procedure MSUCURSALDQRYUNITARIOValidate(Sender: TField);
    procedure MSucursalMQRYAfterInsert(DataSet: TDataSet);
    procedure MSucursalMQRYBeforePost(DataSet: TDataSet);
    procedure MSucursalMQRYPLUTIPOValidate(Sender: TField);
    procedure Panel2Click(Sender: TObject);
    procedure Procesar(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure GRIDDETDblClick(Sender: TObject);
    procedure DBLookupComboBox2Change(Sender: TObject);
    procedure EDTFECHAKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
    procedure GRIDDETEnter(Sender: TObject);
    procedure GroupBox4Click(Sender: TObject);
    procedure MSUCURSALDQRYAfterPost(DataSet: TDataSet);
    procedure MSUCURSALDQRYCalcFields(DataSet: TDataSet);
    procedure MSUCURSALDQRYCODIGOValidate(Sender: TField);
    procedure MSUCURSALDQRYNewRecord(DataSet: TDataSet);
    procedure MSucursalMQRYAfterDelete(DataSet: TDataSet);
    procedure MSucursalMQRYAfterPost(DataSet: TDataSet);
    procedure MSucursalMQRYBeforeCancel(DataSet: TDataSet);
    procedure MSucursalMQRYBeforeEdit(DataSet: TDataSet);
    procedure MSucursalMQRYCalcFields(DataSet: TDataSet);
    procedure MSucursalMQRYCVENDValidate(Sender: TField);
    procedure MSucursalMQRYNewRecord(DataSet: TDataSet);
    procedure Panel1Click(Sender: TObject);
    procedure PopupCalBtnClick(Sender: TObject);
    procedure rptMOVqryCalcFields(DataSet: TDataSet);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure btnBuscaVendClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
  private
    { private declarations }
    procedure controles(estado:boolean);
    function compruebatecla(key:char):char;
    procedure eliminarReserva;

  public
    { public declarations }
  end; 

var
  liqasignafrm: Tliqasignafrm;

implementation

uses
liqdm,
liqbprodform,
liqbasignaform,
Liqbvendedorform,
Pickdate,
procesos,
LiqMenuform,
liqprogresoform,
liqbtipoForm,
dbutils;


{ Tliqasignafrm }

procedure Tliqasignafrm.controles(estado:boolean);
var
i:integer;
begin

        for I := 0 to Panel1.ControlCount - 1 do    { Iterate }
        begin
                if Panel1.Controls[i].ClassType.ClassType<> Tfrmtoolsbar then
                Panel1.Controls[i].Enabled := estado;

        end;    { for }

       IF NOT (MSUCURSALMQRYPLUMOVSUCURSAL.VALUE >0) OR
       (MSUCURSALMQRYPOST.Value='T') THEN
       BEGIN
        griddet.Columns[0].ReadOnly:=  TRUE;
        griddet.Columns[2].ReadOnly:=  TRUE;

        griddet.Options:=[];

       END
       ELSE
       BEGIN

     //  SHOWMESSAGE('ENTRO');
       griddet.Columns[0].ReadOnly:=  estado;
       griddet.Columns[2].ReadOnly:=  estado;
       griddet.Options := [dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColumnMove,dgConfirmDelete,dgrowlines,dgtabs];

       end;
        //refresh;

end;

procedure Tliqasignafrm.SpeedButton8Click(Sender: TObject);
begin

end;

procedure Tliqasignafrm.SpeedButton9Click(Sender: TObject);
begin

   if MSUCURSALMQRYpost.Value ='T' then
    exit;
   IF MSUCURSALMQRY.IsEmpty THEN
      EXIT;

   if MessageDlg('Desea Borrar Registro...?',
   mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    msucursalmqry.Delete;

  end;

end;

procedure Tliqasignafrm.SpeedButton4Click(Sender: TObject);
begin
  liqasignafrm.close;
end;

procedure Tliqasignafrm.SpeedButton5Click(Sender: TObject);
begin

  if MSUCURSALMQRYpost.Value ='F' then
   BEGIN
    SHOWMESSAGE('Debe Procesar Para Poder Imprimir!!!');
    lrpt.PreviewButtons:=[];
    //[pbZoom,pbLoad,pbSave,pbPrint,pbFind,pbHelp,pbExit];

   end ;

  rptmovqry.Close;
  rptmovqry.Params[0].Value:= msucursalmqryplumovsucursal.Value;
  rptmovqry.Open;

  if  rptmovqry.IsEmpty then
  exit;

  lrpt.ShowReport;
end;

procedure Tliqasignafrm.GroupBox4Click(Sender: TObject);
begin

end;

procedure Tliqasignafrm.MSUCURSALDQRYAfterPost(DataSet: TDataSet);
var
  Item : String;
begin

   if MSUCURSALMQRYpost.Value ='T' then
    exit;
   IF MSUCURSALMQRY.IsEmpty THEN
      EXIT;

   msucursaldqry.ApplyUpdates;
  Item := MSUCURSALDQRYItem.AsString;
  MSUCURSALDQRYCODIGO.Tag:=0;
 // Sumar;
  MSUCURSALDQRY.Locate('Item', Item, []);

end;

procedure Tliqasignafrm.MSUCURSALDQRYCalcFields(DataSet: TDataSet);
begin
  MSUCURSALDQRY.FIELDBYNAME('TOTAL').VALUE := MSUCURSALDQRYUNITARIO.VALUE * MSUCURSALDQRYCANTIDAD.VALUE;
end;

procedure Tliqasignafrm.MSUCURSALDQRYCODIGOValidate(Sender: TField);
begin

  dm.myqry.close;
  dm.myqry.SQL.Clear;
  dm.myqry.sql.add('select pluproducto,descripcion,precio,costopromedio,activo from PRODUCTO WHERE codigo like :codigo and pluempresas = :pluempresa ');
  dm.MyQry.ParamByName('pluempresa').value := dm.EmpresaQRYPLUEMPRESA.Value;
  dm.myqry.ParamByName('codigo').value := MSUCURSALDQRYCODIGO.Value;
  dm.MyQry.Open;

  if dm.MyQry.IsEmpty then
  begin
     showmessage('Producto no encontrado!!!');
     MSUCURSALDQRY.Cancel;
     exit;
  end
  else
  begin

    if dm.myqry.FieldByName('activo').Value ='F' then
    begin

      showmessage('Producto Inactivo..., no lo puede utilizar!!!');
      MSUCURSALDQRY.CancelUpdates;
      exit;

    end;

    MSUCURSALDQRYPLUPRODUCTO.Value := DM.MyQry.FieldByName('PLUPRODUCTO').VALUE;

    MSUCURSALDQRYUNITARIO.Value:= DM.MyQry.FieldByName('precio').AsFloat;

    if DM.MyQry.FieldByName('costopromedio').value > 0 then
    MSUCURSALDQRYcostopromedio.Value:= DM.MyQry.FieldByName('costopromedio').VALUE
    else
    MSUCURSALDQRYcostopromedio.Value:= 0;

    MSUCURSALDQRYDESCRIPCION.Value:= DM.MyQry.FieldByName('DESCRIPCION').VALUE;



  end;

end;

procedure Tliqasignafrm.MSUCURSALDQRYNewRecord(DataSet: TDataSet);
VAR
ITEM:INTEGER;
begin


   IF NOT (MSUCURSALMQRYPLUMOVSUCURSAL.Value>0) THEN
   EXIT;

   IF MSUCURSALMQRYPOST.Value ='T' THEN
   EXIT;

    DM.MYQRY.CLOSE;
    DM.MYQry.SQL.Clear;
    dm.MyQry.SQL.Add('select max(item) as item from mov_sucursald where plumovsucursal=:plu ');
    dm.MyQry.ParamByName('plu').Value := MSUCURSALMQRYPLUMOVSUCURSAL.Value;
    dm.MyQry.Open;

    if dm.MyQry.FieldByName('item').Value > 0 then
       item := dm.MyQry.FieldByName('item').Value + 1
       else
       item := 1;

    MSUCURSALDQRYITEM.VALUE := ITEM;
    MSUCURSALDQRYPLUMOVSUCURSAL.Value:= MSUCURSALMQRYPLUMOVSUCURSAL.Value;
    MSUCURSALDQRYCANTIDAD.VALUE := 1;

end;

procedure Tliqasignafrm.MSucursalMQRYAfterDelete(DataSet: TDataSet);
begin
  MSUCURSALMQRY.ApplyUpdates;
  CONTROLES(FALSE);
end;

procedure Tliqasignafrm.MSucursalMQRYAfterPost(DataSet: TDataSet);
begin

  MSUCURSALMQRY.ApplyUpdates;
  CONTROLES(FALSE);

end;

procedure Tliqasignafrm.MSucursalMQRYBeforeCancel(DataSet: TDataSet);
begin
  CONTROLES(FALSE);
end;

procedure Tliqasignafrm.MSucursalMQRYBeforeEdit(DataSet: TDataSet);
begin
  CONTROLES(TRUE);
end;

procedure Tliqasignafrm.FormShow(Sender: TObject);
begin

  MSUCURSALMQRY.CLOSE;
  MSUCURSALMQRY.Params[0].VALUE := DM.EmpresaQRYPLUEMPRESA.Value;
  MSUCURSALMQRY.Params[1].VALUE := DM.BodegaQRYPLUBODEGA.Value;
  MSUCURSALMQRY.Params[2].VALUE := 0;//PLUMOVSUCURSAL
  MSUCURSALMQRY.OPEN;

  MSUCURSALDQRY.Close;
  MSUCURSALDQRY.OPEN;

  CONTROLES(FALSE);
end;

procedure Tliqasignafrm.GRIDDETEnter(Sender: TObject);
begin
  if MSucursalMQRY.State in dsEditModes then
     MSucursalMQRY.Post
end;

procedure Tliqasignafrm.DBLookupComboBox2Change(Sender: TObject);
begin

end;

procedure Tliqasignafrm.EDTFECHAKeyPress(Sender: TObject; var Key: char);
begin
 { if Key = ^J then
  begin
   // PickDate(Sender);
    Key := #0;
  end; }
end;

procedure Tliqasignafrm.GRIDDETDblClick(Sender: TObject);
begin

  IF NOT (MSUCURSALMQRYPLUMOVSUCURSAL.Value>0) THEN
  EXIT;

  IF MSUCURSALMQRYPOST.Value ='T' THEN
  EXIT;

   application.createform(Tbprodfrm,bprodfrm) ;
   BPRODFRM.edttipo.TEXT := 'CAR';
   bprodfrm.showmodal;

   MSUCURSALDQRY.Refresh;

end;

procedure Tliqasignafrm.btnBuscarClick(Sender: TObject);
begin

 with Tliqbasignafrm.Create(SELF) do
  try


   EDTTIPO.Text:= 'CAR';
   if ShowModal = mrOk then
    begin


    IF NOT BMSUCQRY.IsEmpty THEN
    BEGIN


     MSUCURSALMQRY.CLOSE;
     MSUCURSALMQRY.Params[0].VALUE := DM.EmpresaQRYPLUEMPRESA.Value;
     MSUCURSALMQRY.Params[1].VALUE := DM.BodegaQRYPLUBODEGA.Value;
     MSUCURSALMQRY.Params[2].VALUE := BMSUCQRY.FIELDBYNAME('PLUMOVSUCURSAL').VALUE;
     MSUCURSALMQRY.OPEN;

     CONTROLES(FALSE);

    END;

    end;
  finally
end;

end;

procedure Tliqasignafrm.Procesar(Sender: TObject);
begin

   if MSUCURSALMQRYpost.Value ='T' then
    exit;


end;

procedure Tliqasignafrm.btnBuscar1Click(Sender: TObject);
begin

end;

procedure Tliqasignafrm.btnBuscaVend1Click(Sender: TObject);
begin
    with TliqBtipofrm.Create(SELF) do
  try

   if ShowModal = mrOk then
    begin

    IF NOT tipoQRY.IsEmpty THEN
    BEGIN

     MSUCURSALMQRYplutipo.VALUE := tipoQRYplutipo.VALUE;

    END;

    end;
  finally

  end;
end;

procedure Tliqasignafrm.btnprocesarClick(Sender: TObject);
VAR PROCESO:BOOLEAN;
EXISTENCIA:INTEGER;
outil : TDButil;
negativo,lsql,kardex : string;
begin

IF MSUCURSALMQRY.IsEmpty THEN
EXIT;

 if MSUCURSALMQRYpost.Value ='T' then
    exit;


 // eliminarReserva;

 dm.IBTransInv.Active:=false;
 dm.IBTransInv.StartTransaction;
 try

  outil := TDbutil.Create;

  if outil.ValidaLiq(msucursalmqrypluempleados.Value,msucursalmqryfecha.Value) then
  begin
    showmessage('Vendedor ya posee Liquidacion en esta fecha, ya no puede asignar productos!!');
    exit;
  end;

  if MessageDlg('Desea Procesar este Documento...?',
   mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin

  try

  Application.CreateForm(Tprogresofrm,progresofrm);

  //Cierro el query de la tabla inv_reservas y la abro
 // DM.InsResSQL.Close;
  //DM.InsResSQL.Open;

  //abro el detalle de la asignacion
  msucursald2qry.close;
  msucursald2qry.Params[0].value := msucursalmqryplumovsucursal.Value;
  msucursald2qry.Open;

  progresofrm.ProgressBar1.Step:=1;
  progresofrm.ProgressBar1.Min:=0;
  progresofrm.ProgressBar1.Max:=msucursald2QRY.RecordCount;
  progresofrm.ProgressBar1.Position:=0;
  progresofrm.Show;

  msucursald2qry.First;


  while NOT msucursald2qry.EOF do
  begin

  //extraemos la existencia
  existencia := K_Existencia(msucursald2qrypluproducto.Value,msucursalmqryplusucursal.Value);
  negativo := outil.ExecuteStringEscalar('select proc_neg from producto where pluproducto='+
  msucursald2qrypluproducto.AsString);
  kardex := outil.ExecuteStringEscalar('select tp.INVENTARIO from producto pr '+
  ' inner join TIPO_PRODUCTO tp on (pr.PLUTIPOPROD=tp.PLUTIPOPROD) '+
  '  where pluproducto='+msucursald2qrypluproducto.AsString);

  //si no hay suficiente existencia se rompe el proceso
  if (((msucursald2qrycant.Value>existencia) and (negativo<>'T')) and (kardex='T')) then
  begin
     progresofrm.Close;
     showmessage('Existencia Insuficiente en Producto:'+msucursald2qry.FieldByName('codigo').asstring);
     dm.IBTransInv.Rollback;
     //dm.InsResSQL.CancelUpdates;
     exit;
  end;

  // procesado de la orden, inserta datos en la tabla de inventario
  PROCESO := procesar_reserva(msucursalmqrytipo.Value,msucursald2qrypluproducto.Value,
  msucursalmqryfecha.Value,msucursalmqrytipo.Asstring+'-'+msucursalmqrycodigo.asstring,
  msucursalmqrytipo.AsString,msucursald2qrycant.Value,0,msucursalmqryobservaciones.AsString,
  msucursalmqryplusucursal2.Value,msucursalmqryplumovsucursal.Value);

  // si ocurre algun error al procesar, rompo el lazo
  if not PROCESO then
  begin
     progresofrm.Close;
     showmessage('error al procesar');
     dm.IBTransInv.Rollback;
     //dm.InsResSQL.CancelUpdates;
     exit;
  end;

  progresofrm.ProgressBar1.StepIt;
  msucursald2qry.Next;

  end;

   // si todo se ejecuta con exito, se aplican los cambios
   //dm.InsResSQL.ApplyUpdates;
   dm.IBTransInv.Commit;

   dm.myqry.close;
   dm.myqry.sql.clear;
   dm.myqry.sql.add('select count(*) cnt from inv_reservas where tipo=''CAR'' and '+
   'pludocclientes='+msucursalmqryplumovsucursal.AsString+'');
   dm.myqry.open;

   if dm.myqry.fieldbyname('cnt').asinteger>0 then
   begin
     MsucursalMQry.Edit;
     MSucursalMqrypost.Value:='T';
     MsucursalMqry.Post;

   end
   else
        showmessage('Error al procesar, Documento No Procesado, Cierre el modulo de Devolucion,'+
        ' Intente nuevamente!!!');


   progresofrm.Close;



 except
  on e : exception do
    begin

      outil.Free;
      progresofrm.Close;
      //si hay algun error , se deshacen los cambios
      //dm.InsResSQL.CancelUpdates;
      dm.IBTransInv.Rollback;
      ShowMessage ('Clase de error: ' + e.ClassName + chr(13) + chr(13) +
          'Mensaje del error: ' + e.Message+', Error al Procesar...');


    end;

  end; //try

  end; //desea continuar


  finally
     progresofrm.Close;
     outil.Free;
  end;


end;

procedure Tliqasignafrm.btnSalirClick(Sender: TObject);
begin

  if MSUCURSALMQRYpost.Value ='F' then
  begin
     if MessageDlg('El DOcumento no esta Procesado, si sale de la Pantalla El Documento sera Borrado**, Desea Continua...?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
         // borramos de reservas, por si proceso
         dm.MyQry.Close;
         dm.MyQry.SQL.Clear;
         dm.MyQry.sql.Add(' delete from inv_reservas where pludocclientes='''+msucursalmqryplumovsucursal.AsString+''' '+
         ' and plubodegas='''+msucursalmqryplusucursal2.AsString+''' and tipo='''+msucursalmqrytipo.AsString+'''');
         dm.MyQry.ExecSQL;

         msucursalmqry.Delete;
            liqasignafrm.Close;
      end;



  end
  else
  liqasignafrm.Close;

end;

procedure Tliqasignafrm.DBText1Click(Sender: TObject);
begin

end;

procedure Tliqasignafrm.edtcodigoEnter(Sender: TObject);
begin
  menufrm.entrar(sender);
end;

procedure Tliqasignafrm.edtcodigoExit(Sender: TObject);
begin
  menufrm.salir(sender);
end;

procedure Tliqasignafrm.edtcodigoKeyPress(Sender: TObject; var Key: char);
begin
    key := compruebatecla(key);
end;

procedure Tliqasignafrm.FormCreate(Sender: TObject);
begin

end;

procedure Tliqasignafrm.frDBDataSet1CheckEOF(Sender: TObject; var Eof: Boolean);
begin

end;

procedure Tliqasignafrm.frUserDataset1CheckEOF(Sender: TObject; var Eof: Boolean
  );
begin

end;

procedure Tliqasignafrm.Label4Click(Sender: TObject);
begin

end;

procedure Tliqasignafrm.MenuItem1Click(Sender: TObject);
begin
end;

procedure Tliqasignafrm.msucursald2QRYAfterInsert(DataSet: TDataSet);
begin

end;

procedure Tliqasignafrm.MSUCURSALDQRYAfterDelete(DataSet: TDataSet);
begin

 if MSUCURSALMQRYpost.Value ='T' then
    exit;
   IF MSUCURSALMQRY.IsEmpty THEN
      EXIT;

   msucursaldqry.ApplyUpdates;

end;

procedure Tliqasignafrm.MSUCURSALDQRYAfterEdit(DataSet: TDataSet);
begin

end;

procedure Tliqasignafrm.MSUCURSALDQRYBeforeEdit(DataSet: TDataSet);
begin

end;

procedure Tliqasignafrm.MSUCURSALDQRYBeforePost(DataSet: TDataSet);
begin

end;

procedure Tliqasignafrm.MSUCURSALDQRYCANTIDADValidate(Sender: TField);
begin

end;

procedure Tliqasignafrm.MSUCURSALDQRYUNITARIOValidate(Sender: TField);
begin

end;

procedure Tliqasignafrm.MSucursalMQRYAfterInsert(DataSet: TDataSet);
begin

end;

procedure Tliqasignafrm.MSucursalMQRYBeforePost(DataSet: TDataSet);
begin

end;

procedure Tliqasignafrm.MSucursalMQRYPLUTIPOValidate(Sender: TField);
begin

  dm.myqry.close;
  dm.myqry.sql.clear;
  dm.myqry.sql.add('select descripcion from tipo_pedido where plutipo like :plutipo ');
  dm.myqry.parambyname('plutipo').value :=  MSucursalMQryplutipo.Value;
  dm.myqry.open;

  if dm.myqry.IsEmpty then
  begin
    showmessage('Tipo de Pedido no existe!!!');
    edtTipo.SetFocus;
    exit;
  end;

  MSucursalMqrytipo_pedido.Value := dm.myqry.FieldByName('descripcion').value;

end;

procedure Tliqasignafrm.Panel2Click(Sender: TObject);
begin


end;

function TliqasignaFRM.compruebatecla(key:char):char;
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


procedure Tliqasignafrm.MSucursalMQRYCalcFields(DataSet: TDataSet);
begin


  if MSucursalMqrypost.Value ='T' then
     MSucursalMqryestatus1.value := '**PROCESADO'
     ELSE
     MSucursalMqryestatus1.value := '**SIN PROCESAR';

    if MSucursalMqryPLULIQUIDACION.Value>0 then
     MSucursalMqryestatus1.value := '**LIQUIDADO';

end;

procedure Tliqasignafrm.MSucursalMQRYCVENDValidate(Sender: TField);
begin


  dm.myqry.close;
  dm.myqry.sql.clear;
  dm.myqry.sql.add('select pluempleados,codigo,nombre,activo,plusucursal from empleados where codigo like :codigo '+
  ' and pluempresas=:pluempresa ');
  dm.myqry.parambyname('codigo').value :=  MSucursalMQryCVEND.Value;
  dm.myqry.parambyname('pluempresa').value :=  dm.empresaqrypluempresa.value;
  dm.myqry.open;

  if dm.myqry.IsEmpty then
  begin
    showmessage('codigo de Vendedor no existe!!!');
    edtvendedor.SetFocus;
    exit;
  end;

  if dm.myqry.FieldByName('activo').value='F' then
  begin
       showmessage('Vendedor en estado inactivo!!!');
       edtvendedor.SetFocus;
       exit;
  end;

  //showmessage(dm.myqry.FieldByName('plusucursal').asstring);
  //showmessage(dm.BodegaQRYPLUBODEGA.asstring);
  if dm.myqry.FieldByName('plusucursal').value<>dm.BodegaQRYPLUBODEGA.value then
  begin
       showmessage('El vendedor no pertenese a esta sucursal!!!');
       edtvendedor.SetFocus;
       exit;
  end;



  MSucursalMqrypluempleados.Value := dm.myqry.FieldByName('pluempleados').value;
  MSucursalMqrynombre.Value := dm.myqry.FieldByName('nombre').value;
  MSucursalMqryplusucursal2.Value := dm.myqry.FieldByName('pluempleados').value;



end;

procedure Tliqasignafrm.MSucursalMQRYNewRecord(DataSet: TDataSet);
VAR
CODIGO:INTEGER;
begin

     CONTROLES(TRUE);

     DM.MyQry.CLOSE;
     DM.MYQRY.SQL.Clear;
     DM.MyQry.SQL.Add('SELECT MAX(CODIGO) CODIGO FROM MOV_SUCURSALM WHERE PLUEMPRESA=:PLUEMPRESA ');
     DM.MyQry.SQL.Add(' AND TIPO=''CAR''  ');
     DM.MYQRY.ParamByName('PLUEMPRESA').VALUE := DM.EMPRESAQRYPLUEMPRESA.VALUE;
     DM.MYQRY.OPEN;

     IF DM.MYQRY.FIELDBYNAME('CODIGO').VALUE > 0 THEN
     CODIGO := DM.MYQRY.FIELDBYNAME('CODIGO').VALUE +1
     ELSE
     CODIGO := 1;

     MSUCURSALMQRYCODIGO.VALUE        := CODIGO;
     MSUCURSALMQRYFECHA.value         := DATE;
     MSUCURSALMQRYPLUEMPRESA.Value    := DM.EmpresaQRYPLUEMPRESA.Value;
     MSUCURSALMQRYPLUSUCURSAL.Value   := DM.BodegaQRYPLUBODEGA.Value;
     MSUCURSALMQRYPOST.Value          := 'F';
     MSUCURSALMQRYENTREGADO.Value     := 'F';
     MSUCURSALMQRYTIPO.Value          := 'CAR';
     MSUCURSALMQRYBODEGA.AsString     := DM.BodegaQRYNOMBRE.AsString;
     MSUCURSALMQRYENVIADO.value       := 'F';
     MSUCURSALMQRYPLULIQUIDACION.Value:= 0;
     MSUCURSALMQRYPLUREQSUCURSAL.Value:= 0;
     MSUCURSALMQRYPLUSUARIO.Value     := DM.UserQRYPLUSUARIO.Value;
     MSUCURSALMQRYFECHA_CREA.Value    := NOW;
     EDTCODIGO.SetFocus;



end;

procedure Tliqasignafrm.Panel1Click(Sender: TObject);
begin

end;

procedure Tliqasignafrm.PopupCalBtnClick(Sender: TObject);
begin


  with TBrDateForm.Create(SELF) do
  try

   if ShowModal = mrOk then
    begin


     {dm.myqry.Close;
     dm.myqry.sql.Clear;

     if  strtodate(Calendar1.Date)<now then
     begin

       showmessage('Fecha de liquidacion no puede ser menor que la del dia!!');
       exit;
     end;
      }

     //MSucursalMQry.Edit;
     //MSucursalMQryFEcha.AsString := Calendar1.Date;
     //EdtFecha.SelectAll;

    end;
  finally

end;

end;

procedure Tliqasignafrm.rptMOVqryCalcFields(DataSet: TDataSet);
begin
   if rptMovQrytipo.Value ='CAR' then
      rptMovQrytipodoc1.Value := 'ASIGNACION DE PRODUCTOS'
      ELSE
      rptMovQrytipodoc1.Value := 'DEVOLUCION DE PRODUCTOS';

      if msucursalmqrypost.Value ='T' THEN
      RPTMOVQRYESTATUS1.Value := '**PROCESADO'
      ELSE
      RPTMOVQRYESTATUS1.Value := '**SIN PROCESAR';

      if msucursalmqryPLULIQUIDACION.Value>0 THEN
      RPTMOVQRYESTATUS1.Value := '**LIQUIDADO';

end;

procedure Tliqasignafrm.SpeedButton11Click(Sender: TObject);
var
outil : TDButil;
begin

    if MSUCURSALMQRYpost.Value ='T' then
    exit;


   try

     outil := TDbutil.Create;
     if outil.ValidaLiq(msucursalmqrypluempleados.Value,msucursalmqryfecha.Value) then
     begin
        showmessage('Vendedor ya posee Liquidacion en esta fecha, ya no puede asignar productos!!');
        exit;
     end;

   finally

     outil.Free;
   end;




    if (MSUCURSALMQRY.State = dsinsert) or (MSUCURSALMQRY.State = dsedit) then
        MSUCURSALMQRY.Post;

end;

procedure Tliqasignafrm.SpeedButton12Click(Sender: TObject);
begin

 if MSUCURSALMQRYpost.Value ='T' then
    exit;
 IF MSUCURSALMQRY.IsEmpty THEN
      EXIT;

  MSUCURSALMQRY.edit;
end;

procedure Tliqasignafrm.SpeedButton13Click(Sender: TObject);
begin
   MSUCURSALMQRY.Insert;
end;

procedure Tliqasignafrm.btnBuscaVendClick(Sender: TObject);
begin

  with Tbvendedorfrm.Create(SELF) do
  try

   if ShowModal = mrOk then
    begin

    IF NOT VENDQRY.IsEmpty THEN
    BEGIN

   // showmessage(VENDQRYcodigo.AsString);
   //  if  MSUCURSALMQRY.State in [dsedit,dsinsert] then
     MSUCURSALMQRYcvend.VALUE := VENDQRYcodigo.VALUE;

    END;

    end;
  finally

  end;

end;

procedure Tliqasignafrm.SpeedButton1Click(Sender: TObject);
//VAR PROCESO:BOOLEAN;
//EXISTENCIA:INTEGER;
begin

 IF MSUCURSALMQRY.IsEmpty THEN
 EXIT;

 if MSUCURSALMQRYpost.Value ='F' then
    exit;

  if MSucursalMqryPLULIQUIDACION.Value>0 then
  begin
     showmessage('Documento Liquidado, no puede ser desprocesado!!!');
     exit;
  end;

 if  MSucursalMqryPLULIQUIDACION.Value>0 then
 begin
 ShowMessage('No se puede desprocesar, ya esta Liquidado');
 exit;
 end;

  if NOT (permisos(dm.UserQRYPLUPERFIL.Value,74)='S') then
  begin
    SHOWMESSAGE('Opcion no Autorizada!!!');
    EXIT;
  END;

  if MessageDlg('Desea Desprocesar este Documento...?',
   mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin

  dm.IBTransInv.Active:=false;
  dm.IBTransInv.StartTransaction;

  try

  Application.CreateForm(Tprogresofrm,progresofrm);
  progresofrm.ProgressBar1.Style:=pbstMarquee;
  progresofrm.Show;


   eliminarReserva;


   MsucursalMQry.Edit;
   MSucursalMqrypost.Value:='F';
   MsucursalMqry.Post;

   progresofrm.Close;

   dm.IBTransInv.Commit;


 except
  on e : exception do
    begin
      progresofrm.Close;
      //si hay algun error , se deshacen los cambios
      //dm.InsResSQL.CancelUpdates;
      dm.IBTransInv.Rollback;
      ShowMessage ('Clase de error: ' + e.ClassName + chr(13) + chr(13) +
          'Mensaje del error: ' + e.Message+', Error al DesProcesar...');


    end;

  end; //try

  end; //desea continuar

end;

procedure Tliqasignafrm.eliminarReserva;
begin

     //elimino los registro de INV RESERVAS
   dm.myqry3.Close;
   dm.myqry3.sql.Clear;
   dm.MyQry3.sql.Add(' delete from  INV_RESERVAS where PLUDOCCLIENTES=:plumovinv ');
   dm.MyQry3.sql.Add(' and tipo LIKE ''%CAR%''  ');
   dm.myqry3.parambyname('plumovinv').value := MSUCURSALMQRYPLUMOVSUCURSAL.Value;
   dm.myqry3.ExecSQL;


end;

procedure Tliqasignafrm.SpeedButton2Click(Sender: TObject);
begin

  MSUCURSALMQRY.Post;
  MSUCURSALMQRY.ApplyUpdates;


end;

procedure Tliqasignafrm.SpeedButton3Click(Sender: TObject);
begin

   if MSUCURSALMQRYpost.Value ='T' then
    exit;

    msucursalmqry.Cancel;

end;

initialization
  {$I liqasignaform.lrs}

end.

