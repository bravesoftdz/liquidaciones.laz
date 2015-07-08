unit liqtrasladoform;

{$mode objfpc}{$H+}

interface

uses
Classes, SysUtils, FileUtil, DBDateTimePicker, LResources, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, StdCtrls, DbCtrls, DBGrids, Buttons, LR_Class,
  LR_Desgn, LR_DBSet, frametools, ComCtrls, db, LCLType, Menus, IBQuery,
  IBUpdateSQL, IBCustomDataSet;

type

  { Tliqtrasladofrm }

  Tliqtrasladofrm = class(TForm)
    btnBuscar: TSpeedButton;
    btnBuscaVend: TSpeedButton;
    btnBuscaVend1: TSpeedButton;
    btnprocesar: TSpeedButton;
    btnSalir: TSpeedButton;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBMemo1: TDBMemo;
    DBText1: TDBText;
    edtcodigo: TDBEdit;
    EDTFECHA: TDBEdit;
    edtVendedor: TDBEdit;
    edtVendedor2: TDBEdit;
    frDBDataSet1: TfrDBDataSet;
    frmtoolsbar1: Tfrmtoolsbar;
    GRIDDET: TDBGrid;
    GroupBox4: TGroupBox;
    msucursald2QRYCANT: TIBBCDField;
    msucursald2QRYCODIGO: TIBStringField;
    msucursald2QRYOBSERVACION: TIBStringField;
    msucursald2QRYPLUMOVSUCURSAL: TIntegerField;
    msucursald2QRYPLUPRODUCTO: TIntegerField;
    MSUCURSALDSQL: TIBUpdateSQL;
    MSUCURSALDQRY: TIBQuery;
    msucursald2QRY: TIBQuery;
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
    MSUCURSALDQRYtotal1: TCurrencyField;
    MSUCURSALDQRYULTIMOCOSTO: TFloatField;
    MSUCURSALDQRYUNITARIO: TFloatField;
    rptMOVqry: TIBQuery;
    MSUCURSALMSQL: TIBUpdateSQL;
    MSucursalMQRY: TIBQuery;
    Label10: TLabel;
    Label11: TLabel;
    Label37: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lrpt: TfrReport;
    MSUCURSALDDS: TDatasource;
    MSUCURSALMDS: TDatasource;
    MSucursalMQRYANULADO: TStringField;
    MSucursalMQRYBODEGA: TStringField;
    MSucursalMQRYCODIGO: TLongintField;
    MSucursalMQRYCVEND: TStringField;
    MSucursalMQRYCVEND2: TStringField;
    MSucursalMQRYEGRESO: TStringField;
    MSucursalMQRYENTREGADO: TStringField;
    MSucursalMQRYENVIADO: TStringField;
    MSucursalMQRYENVIO: TLongintField;
    MSucursalMQRYestatus1: TStringField;
    MSucursalMQRYFECHA: TDateTimeField;
    MSucursalMQRYFECHA_CREA: TDateTimeField;
    MSucursalMQRYFECHA_ENVIADO: TDateTimeField;
    MSucursalMQRYFECHA_PROCESADO: TDateTimeField;
    MSucursalMQRYINGRESO: TStringField;
    MSucursalMQRYNOMBRE: TStringField;
    MSucursalMQRYNOMBRE2: TStringField;
    MSucursalMQRYOBSERVACIONES: TStringField;
    MSucursalMQRYPLUEMPLEADOS: TLongintField;
    MSucursalMQRYPLUEMPLEADOS_PROCESADO: TLongintField;
    MSucursalMQRYPLUEMPRESA: TLongintField;
    MSucursalMQRYPLULIQUIDACION: TLongintField;
    MSucursalMQRYPLUMOVSUCURSAL: TLongintField;
    MSucursalMQRYPLUREQSUCURSAL: TLongintField;
    MSucursalMQRYPLUSUARIO: TLongintField;
    MSucursalMQRYPLUSUCURSAL: TLongintField;
    MSucursalMQRYPLUSUCURSAL2: TLongintField;
    MSucursalMQRYPLUTIPO: TLongintField;
    MSucursalMQRYPOST: TStringField;
    MSucursalMQRYPREPARAR: TStringField;
    MSucursalMQRYPROCESADO: TStringField;
    MSucursalMQRYRECIBIDO: TStringField;
    MSucursalMQRYTIPO: TStringField;
    MSucursalMQRYTIPO_PEDIDO: TStringField;
    Panel1: TPanel;
    Panel2: TPanel;
    PopupCalBtn: TSpeedButton;
    rptMovDS: TDatasource;
    rptMOVqryBODEGA: TStringField;
    rptMOVqryCANTIDAD: TFloatField;
    rptMOVqryCODPROD: TStringField;
    rptMOVqryCVEND2: TStringField;
    rptMOVqryDOC: TLongintField;
    rptMOVqryEMPRESA: TStringField;
    rptMOVqryESTATUS1: TStringField;
    rptMOVqryFECHA: TDateTimeField;
    rptMOVqryITEM: TLongintField;
    rptMOVqryNOMBRE2: TStringField;
    rptMOVqryPLUMOVSUCURSAL: TLongintField;
    rptMOVqryPLUPRODUCTO: TLongintField;
    rptMOVqryPLUTIPO: TLongintField;
    rptMOVqryPRODUCTO: TStringField;
    rptMOVqrystatus1: TStringField;
    rptMOVqryTIPO: TStringField;
    rptMOVqrytipodoc1: TStringField;
    rptMOVqryTIPO_PEDIDO: TStringField;
    rptMOVqryUNITARIO: TFloatField;
    rptMOVqryUSUARIO: TStringField;
    rptMOVqryVENDEDOR: TStringField;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton9: TSpeedButton;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    procedure btnBuscarClick(Sender: TObject);
    procedure btnBuscaVend1Click(Sender: TObject);
    procedure btnBuscaVendClick(Sender: TObject);
    procedure btnprocesarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure edtcodigoEnter(Sender: TObject);
    procedure edtcodigoExit(Sender: TObject);
    procedure edtcodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtcodigoKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
    procedure GRIDDETDblClick(Sender: TObject);
    procedure GRIDDETEnter(Sender: TObject);
    procedure GroupBox4Click(Sender: TObject);
    procedure MSUCURSALDQRYAfterDelete(DataSet: TDataSet);
    procedure MSUCURSALDQRYAfterPost(DataSet: TDataSet);
    procedure MSUCURSALDQRYBeforeCancel(DataSet: TDataSet);
    procedure MSUCURSALDQRYBeforeEdit(DataSet: TDataSet);
    procedure MSUCURSALDQRYBeforePost(DataSet: TDataSet);
    procedure MSUCURSALDQRYCalcFields(DataSet: TDataSet);
    procedure MSUCURSALDQRYCODIGOValidate(Sender: TField);
    procedure MSUCURSALDQRYNewRecord(DataSet: TDataSet);
    procedure MSucursalMQRYAfterDelete(DataSet: TDataSet);
    procedure MSucursalMQRYAfterPost(DataSet: TDataSet);
    procedure MSucursalMQRYBeforeCancel(DataSet: TDataSet);
    procedure MSucursalMQRYBeforeClose(DataSet: TDataSet);
    procedure MSucursalMQRYBeforeEdit(DataSet: TDataSet);
    procedure MSucursalMQRYBeforePost(DataSet: TDataSet);
    procedure MSucursalMQRYCalcFields(DataSet: TDataSet);
    procedure MSucursalMQRYCVEND2Validate(Sender: TField);
    procedure MSucursalMQRYCVENDValidate(Sender: TField);
    procedure MSucursalMQRYNewRecord(DataSet: TDataSet);
    procedure PopupCalBtnClick(Sender: TObject);
    procedure rptMOVqryCalcFields(DataSet: TDataSet);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
  private
    { private declarations }
    procedure controles(estado:boolean);
    function compruebatecla(key:char):char;
  public
    { public declarations }
  end; 

var
  liqtrasladofrm: Tliqtrasladofrm;

implementation

uses
liqdm,
liqbprodform,
liqbasignaform,
Liqbvendedorform,
Pickdate,
procesos,
liqprogresoform,
LiqMenuform,
DBUtils;

{ Tliqtrasladofrm }

function Tliqtrasladofrm.compruebatecla(key:char):char;
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

procedure Tliqtrasladofrm.controles(estado:boolean);
var
i:integer;
begin

        for I := 0 to Panel1.ControlCount - 1 do    { Iterate }
        begin
                if Panel1.Controls[i].ClassType<> Tfrmtoolsbar then
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

procedure Tliqtrasladofrm.SpeedButton13Click(Sender: TObject);
begin
  MSUCURSALMQRY.Insert;
end;

procedure Tliqtrasladofrm.SpeedButton3Click(Sender: TObject);
begin

     if MSUCURSALMQRYpost.Value ='T' then
    exit;

    msucursalmqry.Cancel;
end;

procedure Tliqtrasladofrm.SpeedButton5Click(Sender: TObject);
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

procedure Tliqtrasladofrm.SpeedButton7Click(Sender: TObject);
VAR PROCESO:BOOLEAN;
EXISTENCIA:INTEGER;
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

   if NOT (permisos(dm.UserQRYPLUPERFIL.Value,75) ='S') then
  begin
    SHOWMESSAGE('Opcion no Autorizada!!!');
    EXIT;
  END;

  if MessageDlg('Desea Desprocesar este Documento...?',
   mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin


  try

   Application.CreateForm(Tprogresofrm,progresofrm);
   progresofrm.Show;

     //elimino los registro de INV_RESERVAS
   dm.myqry.Close;
   dm.myqry.sql.Clear;
   dm.MyQry.sql.Add(' delete from  INV_RESERVAS where PLUDOCCLIENTES=:plumovinv ');
   dm.MyQry.sql.Add(' and tipo LIKE ''%TRA%''  ');
   dm.myqry.parambyname('plumovinv').value := MSUCURSALMQRYPLUMOVSUCURSAL.Value;
   dm.myqry.ExecSQL;


   MsucursalMQry.Edit;
   MSucursalMqrypost.Value:='F';
   MsucursalMqry.Post;

   progresofrm.Close;


 except
  on e : exception do
    begin

      progresofrm.Close;
      //si hay algun error , se deshacen los cambios
      //dm.InsResSQL.CancelUpdates;
      ShowMessage ('Clase de error: ' + e.ClassName + chr(13) + chr(13) +
          'Mensaje del error: ' + e.Message+', Error al DesProcesar...');


    end;

  end; //try

  end; //desea continuar



end;

procedure Tliqtrasladofrm.SpeedButton9Click(Sender: TObject);
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

procedure Tliqtrasladofrm.SpeedButton12Click(Sender: TObject);
begin
   if MSUCURSALMQRYpost.Value ='T' then
    exit;
 IF MSUCURSALMQRY.IsEmpty THEN
      EXIT;

  MSUCURSALMQRY.edit;
end;

procedure Tliqtrasladofrm.SpeedButton11Click(Sender: TObject);
var
outil : TDButil;
begin
   if MSUCURSALMQRYpost.Value ='T' then
    exit;

   try

     outil := TDbutil.Create;
     if outil.ValidaLiq(msucursalmqrypluempleados.Value,msucursalmqryfecha.Value) then
     begin
        showmessage('Vendedor ya posee Liquidacion en esta fecha, ya no puede Trasladar productos!!');
        exit;
     end;

   finally

     outil.Free;
   end;

    if (MSUCURSALMQRY.State = dsinsert) or (MSUCURSALMQRY.State = dsedit) then
        MSUCURSALMQRY.Post;

end;

procedure Tliqtrasladofrm.btnBuscarClick(Sender: TObject);
begin
  with Tliqbasignafrm.Create(SELF) do
  try

   edtTipo.Text:= 'TRA';
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

procedure Tliqtrasladofrm.btnBuscaVend1Click(Sender: TObject);
begin

  with Tbvendedorfrm.Create(SELF) do
  try

   if ShowModal = mrOk then
    begin

    IF NOT VENDQRY.IsEmpty THEN
    BEGIN

     MSUCURSALMQRYcvend.VALUE := VENDQRYcodigo.VALUE;

    END;

    end;
  finally

  end;


end;

procedure Tliqtrasladofrm.btnBuscaVendClick(Sender: TObject);
begin

  with Tbvendedorfrm.Create(SELF) do
  try

   if ShowModal = mrOk then
    begin

    IF NOT VENDQRY.IsEmpty THEN
    BEGIN

     MSUCURSALMQRYcvend2.VALUE := VENDQRYcodigo.VALUE;

    END;

    end;
  finally

  end;

end;

procedure Tliqtrasladofrm.btnprocesarClick(Sender: TObject);
VAR PROCESO:BOOLEAN;
EXISTENCIA:INTEGER;
outil : TDbUtil;
begin

IF MSUCURSALMQRY.IsEmpty THEN
EXIT;

 if MSUCURSALMQRYpost.Value ='T' then
    exit;

  outil := TDbutil.Create;
  if outil.ValidaLiq(msucursalmqrypluempleados.Value,msucursalmqryfecha.Value) then
  begin
    showmessage('Vendedor ya posee Liquidacion Procesada en esta fecha, ya no puede Trasladar productos!!');
    outil.Free;
    exit;
  end;

  if MessageDlg('Desea Procesar este Documento...?',
   mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin


  try

  application.createform(Tprogresofrm,progresofrm);

  //Cierro el query de la tabla inv_reservas y la abro
  //DM.InsResSQL.Close;
  //DM.InsResSQL.Open;

  //abro el detalle de la asignacion
  msucursald2qry.close;
  msucursald2qry.Params[0].value := msucursalmqryplumovsucursal.Value;
  msucursald2qry.Open;
  progresofrm.ProgressBar1.Min:=0;
  progresofrm.ProgressBar1.Max:=msucursald2QRY.RecordCount;
  progresofrm.ProgressBar1.Step:=1;
  progresofrm.Show;

  msucursald2qry.First;

  while NOT msucursald2qry.EOF do
  begin

  //extraemos la existencia
  //existencia := K_Existencia(msucursald2qrypluproducto.Value,msucursalmqryplusucursal.Value);
  // Verificar si producto existe en bodega del vendedor

  dm.myqry.close;
  dm.myqry.sql.clear;
  dm.myqry.sql.add('select sum(entrada)-sum(salida) existe from inv_reservas where pluproducto=:pluprod ');
  dm.myqry.sql.add(' and plubodegas=:pluv  ');
  dm.myqry.params[0].value := msucursald2qrypluproducto.Value;
  dm.MyQry.Params[1].Value := msucursalmqrypluempleados.Value;//pluvendedor
  dm.MyQry.Open;

  if dm.MyQry.FieldByName('existe').Value >0 then
     existencia := dm.MyQry.FieldByName('existe').Value
     else
     existencia := 0;

  //si no hay suficiente existencia se rompe el proceso
  if (msucursald2qrycant.Value>existencia) then
  begin
     progresofrm.Close;
     showmessage('Vendedor tiene asignado:"'+inttostr(existencia)+'", en Producto:"'+msucursald2qry.FieldByName('codigo').asstring+'", No puede Trasladar mas que eso!!');
     //dm.InsResSQL.CancelUpdates;
     exit;

  end;

  // procesado de la orden, inserta datos en la tabla de inventario
  PROCESO := procesar_reserva(msucursalmqrytipo.Value,msucursald2qrypluproducto.Value,
  msucursalmqryfecha.Value,msucursalmqrytipo.Asstring+'-'+msucursalmqrycodigo.asstring,
  msucursalmqrytipo.AsString,0,msucursald2qrycant.Value,msucursalmqryobservaciones.AsString,
  msucursalmqrypluempleados.Value,msucursalmqryplumovsucursal.Value);

  // si ocurre algun error al procesar, rompo el lazo
  if not PROCESO then
  begin
     progresofrm.Close;
     showmessage('error al procesar');
     //dm.InsResSQL.CancelUpdates;
     exit;
  end;


  //  movimiento para vendedor que recibe el traslado
  dm.myqry.close;
  dm.myqry.sql.clear;
  dm.myqry.sql.add('select sum(entrada)-sum(salida) existe from inv_reservas where pluproducto=:pluprod ');
  dm.myqry.sql.add(' and plubodegas=:pluv  ');
  dm.myqry.params[0].value := msucursald2qrypluproducto.Value;
  dm.MyQry.Params[1].Value := msucursalmqryplusucursal2.Value;//pluvendedor
  dm.MyQry.Open;

  if dm.MyQry.FieldByName('existe').Value >0 then
     existencia := dm.MyQry.FieldByName('existe').Value
     else
     existencia := 0;


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
     //dm.InsResSQL.CancelUpdates;
     exit;
  end;


  progresofrm.ProgressBar1.StepIt;
  msucursald2qry.Next;
  end;

   // si todo se ejecuta con exito, se aplican los cambios
  // dm.InsResSQL.ApplyUpdates;
   MsucursalMQry.Edit;
   MSucursalMqrypost.Value:='T';
   MsucursalMqry.Post;


 except
  on e : exception do
    begin

      progresofrm.Close;
      //si hay algun error , se deshacen los cambios
      //dm.InsResSQL.CancelUpdates;
      ShowMessage ('Clase de error: ' + e.ClassName + chr(13) + chr(13) +
          'Mensaje del error: ' + e.Message+', Error al Procesar...');


    end;

  end; //try

  end; //desea continuar

  progresofrm.Close;

end;

procedure Tliqtrasladofrm.btnSalirClick(Sender: TObject);
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
              Close;
      end;



  end
  else
  Close;
end;

procedure Tliqtrasladofrm.edtcodigoEnter(Sender: TObject);
begin
  menufrm.entrar(sender);
end;

procedure Tliqtrasladofrm.edtcodigoExit(Sender: TObject);
begin
  menufrm.salir(sender);
end;

procedure Tliqtrasladofrm.edtcodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

end;

procedure Tliqtrasladofrm.edtcodigoKeyPress(Sender: TObject; var Key: char);
begin
   key := compruebatecla(key);
end;

procedure Tliqtrasladofrm.FormShow(Sender: TObject);
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

procedure Tliqtrasladofrm.GRIDDETDblClick(Sender: TObject);
begin

  IF NOT (MSUCURSALMQRYPLUMOVSUCURSAL.Value>0) THEN
  EXIT;

  IF MSUCURSALMQRYPOST.Value ='T' THEN
  EXIT;

   application.createform(Tbprodfrm,bprodfrm) ;
   BPRODFRM.edttipo.TEXT := 'TRA';
   bprodfrm.showmodal;

   msucursaldqry.Refresh;

end;

procedure Tliqtrasladofrm.GRIDDETEnter(Sender: TObject);
begin
  if MSucursalMQRY.State in dsEditModes then
     MSucursalMQRY.Post
end;

procedure Tliqtrasladofrm.GroupBox4Click(Sender: TObject);
begin

end;

procedure Tliqtrasladofrm.MSUCURSALDQRYAfterDelete(DataSet: TDataSet);
begin
    MSUCURSALMQRY.ApplyUpdates;
    CONTROLES(FALSE);
end;

procedure Tliqtrasladofrm.MSUCURSALDQRYAfterPost(DataSet: TDataSet);
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

procedure Tliqtrasladofrm.MSUCURSALDQRYBeforeCancel(DataSet: TDataSet);
begin
    CONTROLES(FALSE);
end;

procedure Tliqtrasladofrm.MSUCURSALDQRYBeforeEdit(DataSet: TDataSet);
begin
    CONTROLES(TRUE);
end;

procedure Tliqtrasladofrm.MSUCURSALDQRYBeforePost(DataSet: TDataSet);
begin

end;

procedure Tliqtrasladofrm.MSUCURSALDQRYCalcFields(DataSet: TDataSet);
begin
  MSUCURSALDQRY.FIELDBYNAME('TOTAL').VALUE := MSUCURSALDQRYUNITARIO.VALUE * MSUCURSALDQRYCANTIDAD.VALUE;
end;

procedure Tliqtrasladofrm.MSUCURSALDQRYCODIGOValidate(Sender: TField);
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
    MSUCURSALDQRYcostopromedio.Value:= DM.MyQry.FieldByName('costopromedio').VALUE;
    MSUCURSALDQRYDESCRIPCION.Value:= DM.MyQry.FieldByName('DESCRIPCION').VALUE;



  end;
end;

procedure Tliqtrasladofrm.MSUCURSALDQRYNewRecord(DataSet: TDataSet);
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

procedure Tliqtrasladofrm.MSucursalMQRYAfterDelete(DataSet: TDataSet);
begin
    MSUCURSALMQRY.ApplyUpdates;
end;



procedure Tliqtrasladofrm.MSucursalMQRYAfterPost(DataSet: TDataSet);
begin

  MSUCURSALMQRY.ApplyUpdates;
  CONTROLES(FALSE);

end;

procedure Tliqtrasladofrm.MSucursalMQRYBeforeCancel(DataSet: TDataSet);
begin
  CONTROLES(FALSE);
end;

procedure Tliqtrasladofrm.MSucursalMQRYBeforeClose(DataSet: TDataSet);
begin

end;

procedure Tliqtrasladofrm.MSucursalMQRYBeforeEdit(DataSet: TDataSet);
begin
    CONTROLES(TRUE);
end;

procedure Tliqtrasladofrm.MSucursalMQRYBeforePost(DataSet: TDataSet);
begin

end;

procedure Tliqtrasladofrm.MSucursalMQRYCalcFields(DataSet: TDataSet);
begin
  if MSucursalMqrypost.Value ='T' then
     MSucursalMqryestatus1.value := '**PROCESADO'
     ELSE
     MSucursalMqryestatus1.value := '**SIN PROCESAR';

    if MSucursalMqryPLULIQUIDACION.Value>0 then
     MSucursalMqryestatus1.value := '**LIQUIDADO';
end;

procedure Tliqtrasladofrm.MSucursalMQRYCVEND2Validate(Sender: TField);
begin

  dm.myqry.close;
  dm.myqry.sql.clear;
  dm.myqry.sql.add('select pluempleados,codigo,nombre,activo,plusucursal from empleados where codigo like :codigo ');
  dm.myqry.parambyname('codigo').value :=  MSucursalMQryCVEND2.Value;
  dm.myqry.open;

  if dm.myqry.IsEmpty then
  begin
    showmessage('codigo de Vendedor no existe!!!');
    edtVendedor2.SetFocus;
    exit;
  end;

  if dm.myqry.FieldByName('activo').value='F' then
  begin
       showmessage('Vendedor en estado inactivo!!!');
       edtVendedor2.SetFocus;
       exit;
  end;

  if dm.myqry.FieldByName('plusucursal').value<>dm.BodegaQRYPLUBODEGA.value then
  begin
       showmessage('El vendedor no pertenese a esta sucursal!!!');
       edtVendedor2.SetFocus;
       exit;
  end;

  IF (dm.myqry.FieldByName('pluempleados').value = MSucursalMqryPluempleados.value) then
  begin
       showmessage('El vendedor Destino no puede ser el mismo de Origen!!');
       edtVendedor2.SetFocus;
       exit;
  end;
  MSucursalMqryplusucursal2.Value := dm.myqry.FieldByName('pluempleados').value;
  MSucursalMqrynombre2.Value := dm.myqry.FieldByName('nombre').value;


end;

procedure Tliqtrasladofrm.MSucursalMQRYCVENDValidate(Sender: TField);
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
    edtVendedor2.SetFocus;
    exit;
  end;

  if dm.myqry.FieldByName('activo').value='F' then
  begin
       showmessage('Vendedor en estado inactivo!!!');
       edtVendedor2.SetFocus;
       exit;
  end;

  if dm.myqry.FieldByName('plusucursal').value<>dm.BodegaQRYPLUBODEGA.value then
  begin
       showmessage('El vendedor no pertenese a esta sucursal!!!');
       edtVendedor2.SetFocus;
       exit;
  end;

  MSucursalMqrypluempleados.Value := dm.myqry.FieldByName('pluempleados').value;
  MSucursalMqrynombre.Value := dm.myqry.FieldByName('nombre').value;
  // MSucursalMqryplusucursal2.Value := dm.myqry.FieldByName('pluempleados').value;

end;

procedure Tliqtrasladofrm.MSucursalMQRYNewRecord(DataSet: TDataSet);
VAR
CODIGO:INTEGER;
begin

     CONTROLES(TRUE);

     DM.MyQry.CLOSE;
     DM.MYQRY.SQL.Clear;
     DM.MyQry.SQL.Add('SELECT MAX(CODIGO) CODIGO FROM MOV_SUCURSALM WHERE PLUEMPRESA=:PLUEMPRESA ');
     DM.MyQry.SQL.Add(' AND TIPO=''TRA''  ');
     DM.MYQRY.ParamByName('PLUEMPRESA').VALUE := DM.EMPRESAQRYPLUEMPRESA.VALUE;
     DM.MYQRY.OPEN;

     IF DM.MYQRY.FIELDBYNAME('CODIGO').VALUE > 0 THEN
     CODIGO := DM.MYQRY.FIELDBYNAME('CODIGO').VALUE +1
     ELSE
     CODIGO := 1;

     MSUCURSALMQRYCODIGO.VALUE := CODIGO;
     MSUCURSALMQRYFECHA.value := DATE;
     MSUCURSALMQRYPLUEMPRESA.Value:= DM.EmpresaQRYPLUEMPRESA.Value;
     MSUCURSALMQRYPLUSUCURSAL.Value:= DM.BodegaQRYPLUBODEGA.Value;
     MSUCURSALMQRYPOST.Value:= 'F';
     MSUCURSALMQRYENTREGADO.Value:= 'F';
     MSUCURSALMQRYTIPO.Value:= 'TRA';
     MSUCURSALMQRYBODEGA.AsString:= DM.BodegaQRYNOMBRE.AsString;
     MSUCURSALMQRYENVIADO.value := 'F';
     MSUCURSALMQRYPLULIQUIDACION.Value:=0;
     MSUCURSALMQRYPLUTIPO.Value:=4;
     MSUCURSALMQRYPLUREQSUCURSAL.Value:=0;
     MSUCURSALMQRYPLUSUARIO.Value     := DM.UserQRYPLUSUARIO.Value;
     MSUCURSALMQRYFECHA_CREA.Value    := NOW;
     EDTCODIGO.SetFocus;


end;


procedure Tliqtrasladofrm.PopupCalBtnClick(Sender: TObject);
begin

  with TBrDateForm.Create(SELF) do
  try

   if ShowModal = mrOk then
    begin

    { if  strtodate(Calendar1.Date)<now then
     begin

       showmessage('Fecha de liquidacion no puede ser menor que la del dia!!');
       exit;
     end;
     }

     MSucursalMQry.Edit;
     MSucursalMQryFEcha.AsString := Calendar1.Date;
     EdtFecha.SelectAll;

    end;
  finally

end;
end;

procedure Tliqtrasladofrm.rptMOVqryCalcFields(DataSet: TDataSet);
begin

      rptMovQrytipodoc1.Value := 'TRASLADO DE PRODUCTOS';

      if msucursalmqrypost.Value ='T' THEN
      RPTMOVQRYESTATUS1.Value := '**PROCESADO'
      ELSE
      RPTMOVQRYESTATUS1.Value := '**SIN PROCESAR';

      if msucursalmqryPLULIQUIDACION.Value>0 THEN
      RPTMOVQRYESTATUS1.Value := '**LIQUIDADO';
end;

initialization
  {$I liqtrasladoform.lrs}

end.

