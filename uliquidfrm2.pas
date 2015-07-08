unit uliquidFRM2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, ComCtrls, Buttons, ExtCtrls, StdCtrls, DbCtrls, DBGrids, Menus,
  LR_DBSet, LR_Class, ZSqlUpdate, ZSequence, ZDataset;

type

  { TliquidFRM2 }

  TliquidFRM2 = class(TForm)
    BitBtn1: TBitBtn;
    btnBuscar1: TSpeedButton;
    btnBuscaVend: TSpeedButton;
    btnDESprocesar1: TSpeedButton;
    btnprocesar1: TSpeedButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBMemo1: TDBMemo;
    DBText2: TDBText;
    edtcodigo: TDBEdit;
    EDTFECHA: TDBEdit;
    edtVendedor: TDBEdit;
    fpagods: TDatasource;
    frDBDataSet1: TfrDBDataSet;
    frfpago: TfrDBDataSet;
    Gen_Liq: TZSequence;
    GRIDDET: TDBGrid;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label37: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LIQUIDDQRY: TZQuery;
    LIQUIDDQRY2: TZQuery;
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
    LIQUIDDQRYPRECIO: TFloatField;
    LIQUIDDQRYSALDO: TFloatField;
    LIQUIDDQRYSUBTOTAL: TFloatField;
    LIQUIDDQRYTOTAL: TFloatField;
    LIQUIDDQRYTRANSFER: TFloatField;
    liquidDS: TDatasource;
    LIQUIDDSQL: TZUpdateSQL;
    LIQUIDMDS: TDatasource;
    LIQUIDMQRY: TZQuery;
    LIQUIDMQRYBODEGA: TStringField;
    LIQUIDMQRYCHEQUE: TFloatField;
    LIQUIDMQRYCODIGO: TLongintField;
    LIQUIDMQRYCSUPER: TLongintField;
    LIQUIDMQRYCVEND: TStringField;
    LIQUIDMQRYDIFERENCIA: TFloatField;
    LIQUIDMQRYEFECTIVO: TFloatField;
    LIQUIDMQRYestatus1: TStringField;
    LIQUIDMQRYFECHA: TDateField;
    LIQUIDMQRYNOMBRE: TStringField;
    LIQUIDMQRYOBSERVACION: TStringField;
    LIQUIDMQRYPLUBODEGA: TLongintField;
    LIQUIDMQRYPLUEMPRESA: TLongintField;
    LIQUIDMQRYPLULIQUIDACION: TLongintField;
    LIQUIDMQRYPLUSUARIO: TLongintField;
    LIQUIDMQRYPLUSUPERVISOR: TLongintField;
    LIQUIDMQRYPLUVENDEDOR: TLongintField;
    LIQUIDMQRYPOST: TStringField;
    LIQUIDMQRYREMESA: TFloatField;
    LIQUIDMQRYSUPNOMBRE: TStringField;
    LIQUIDMQRYTOTAL: TFloatField;
    LIQUIDMSQL: TZUpdateSQL;
    lrpt: TfrReport;
    lrpt1: TfrReport;
    MenuItem1: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    PopupCalBtn: TSpeedButton;
    PopupMenu1: TPopupMenu;
    prodQRY: TZReadOnlyQuery;
    RptFpago: TZQuery;
    RptFpagoCODIGO: TStringField;
    RptFpagoDESCRIPCION: TStringField;
    RptFpagoITEM: TLongintField;
    RptFpagoMONTO: TFloatField;
    RptFpagoOBSERVACION: TStringField;
    RptFpagoPLULIQUIDACION: TLongintField;
    RptFpagoTOTAL1: TCurrencyField;
    rptMovDS: TDatasource;
    rptMOVqry: TZQuery;
    rptMOVqryBODEGA: TStringField;
    rptMOVqryCODPROD: TStringField;
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
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton9: TSpeedButton;
    ToolBar3: TToolBar;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton9: TToolButton;
    procedure btnprocesar1Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  liquidFRM2: TliquidFRM2;

implementation

{ TliquidFRM2 }

procedure TliquidFRM2.SpeedButton7Click(Sender: TObject);
begin
   if idlog>0 then
         actualiza_logliq(idlog,'','N','N','N','N','N');


  BtnBuscaVend.Enabled := true;
   EdtVendedor.enabled:= true;
  LIQUIDMQRY.Insert;
end;

procedure TliquidFRM2.SpeedButton10Click(Sender: TObject);
begin

   if LIQUIDMQRYpost.Value ='T' then
        exit;

  dm.myqry3.close;
  dm.myqry3.sql.clear;
  dm.myqry3.sql.add('select post  from liquidacionm where pluliquidacion=:plul ');
  dm.myqry3.parambyname('plul').value := LiquidMqrypluliquidacion.value;
  dm.myqry3.open;

  if dm.myqry3.FieldByName('post').value='T' then
  begin
    plu := LiquidMqrypluliquidacion.Value;
    showmessage('Documento ya fue procesado!!');
    Liquiddqry.Close;
    Liquidmqry.Close;
    liquidmqry.Locate('pluliquidacion',plu,[]);
    liquiddqry.Open;
    exit;
  end;

       IF LIQUIDMQRYPLUvendedor.IsNull THEN
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
       LIQUIDMQRYPLUVENDEDOR.ASSTRING+' and fecha >='''+ liquidmqryfecha.asstring+''' ');
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

procedure TliquidFRM2.btnprocesar1Click(Sender: TObject);
begin
  VAR PROCESO:BOOLEAN;
EXISTENCIA, i:INTEGER;
progreso:variant;
begin

ShortDateFormat := 'MM/DD/YY';
 IF LIQUIDMQRY.IsEmpty THEN
 EXIT;

 if LIQUIDMQRYpost.Value ='T' then
    exit;

  plu := LiquidMqrypluliquidacion.Value;

  dm.myqry3.close;
  dm.myqry3.sql.clear;
  dm.myqry3.sql.add('select post  from liquidacionm where pluliquidacion=:plul ');
  dm.myqry3.parambyname('plul').value := plu ;
  dm.myqry3.open;

  if dm.myqry3.FieldByName('post').value='T' then
  begin

    showmessage('Documento ya fue procesado!!');
    Liquiddqry.Close;
    Liquidmqry.Close;
    LiquidMqry.open;
    liquidmqry.Locate('pluliquidacion',plu,[]);
    liquiddqry.Open;
    exit;
  end;


 borrar_inventario('LIQ-'+LiquidMQRYcodigo.asstring,'LIQ',LiquidMqrypluliquidacion.Value);
 borrar_inv_reserva('LIQ-'+LiquidMQRYcodigo.asstring,'LIQ',LiquidMqrypluliquidacion.Value);

  {dm.MyQry2.close;
  dm.myqry2.SQL.Clear;
  dm.MyQry2.SQL.Add('commit');
  dm.MyQry2.ExecSQL;
   }

  dm.myqry.close;
  dm.myqry.sql.clear;
  dm.myqry.sql.add('select COUNT(*) CONT   from liquidacionD where pluliquidacion=:plul ');
  dm.myqry.parambyname('plul').value := LiquidMqrypluliquidacion.value;
  dm.myqry.open;

     if not (dm.myqry.fieldbyname('cont').value>0) then
     begin
      showmessage('Liquidacion en blanco!!!, no puede procesar Liquidacion!!');
      exit;
     end;


 IF not (LIQUIDMQRYTOTAL.Value =0) THEN
    BEGIN
  //  SHOWMESSAGE('No puede liquidar valor 0!!');
  //  exit;



 with TfrmLiqPago.Create(SELF) do
  try

   if ShowModal = mrOk then
    begin



    end;

  finally
  end;

  dm.myqry.close;
  dm.myqry.sql.clear;
  dm.myqry.sql.add('select sum(monto) monto from liquidacion_det where pluliquidacion=:plul ');
  dm.myqry.parambyname('plul').value := plu;
  dm.myqry.open;

     if dm.myqry.isempty then
     begin
      showmessage('No selecciono ninguna forma de pago, no puede procesar Liquidacion!!');
      exit;
     end;

   if dm.myqry.fieldbyname('monto').value <> LiquidMqrytotal.value then
   begin
     showmessage('monto de pago difiere de Venta Total, no puede Procesar Liquidacion!!!');
     exit;
   end;


  end // si total es igual a cero
  else
  begin

    if MessageDlg('Desea Procesar este Documento Con Valor CERO!!!!...?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit;


  end;

  if MessageDlg('Desea Procesar este Documento...?',
   mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin


  try

  Application.CreateForm(Tprogresofrm,progresofrm);

  //Cierro el query de la tabla inv_reservas y la abro
  DM.InsResSQL.Close;
  DM.InsResSQL.Open;


  DM.INVENTARIOQRY.CLOSE;
  DM.INVENTARIOQRY.OPEN;


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
  LiquidMQRYfecha.Value,'LIQ-'+LiquidMQRYcodigo.asstring,
  'LIQ',0,LiquidDQRY2saldo.Value,LiquidMqRYobservacion.AsString,
  LiquidMqrypluvendedor.Value,plu);
  //showmessage(booltostr(proceso));
  // si ocurre algun error al procesar, rompo el lazo

  if not PROCESO then
  begin

     showmessage('error al procesar Reserva');
     dm.InsResSQL.CancelUpdates;
     exit;
  end;

  {//METO EL INVENTARIO FINAL
  PROCESO := procesar_reserva('LIQ',LiquidDQRY2pluproducto.Value,
  LiquidMQRYfecha.Value,'LIQ-'+LiquidMQRYcodigo.asstring,
  'LIQ',0,LiquidDQRY2saldo.Value,LiquidMqRYobservacion.AsString,
  LiquidMqrypluvendedor.Value,LiquidMqrypluliquidacion.Value);

  // si ocurre algun error al procesar, rompo el lazo

  if not PROCESO then
  begin

     showmessage('error al procesar');
     dm.InsResSQL.CancelUpdates;
     exit;
  end;       }


  // SACO LA VENTAS DE INVENTARIO
  PROCESO := procesar_inventario('LIQ',LiquidDQRY2pluproducto.Value,
  LiquidMQRYfecha.Value,'LIQ-'+LiquidMQRYcodigo.asstring,
  'LIQ',0,LiquidDQRY2saldo.Value,LiquidMqRYobservacion.AsString,
  DM.BodegaQRYPLUBODEGA.Value,plu);

  // si ocurre algun error al procesar, rompo el lazo

  if not PROCESO then
  begin

     showmessage('error al procesar inventario');
     dm.InsResSQL.CancelUpdates;
     exit;
  end;

  end;

  //progresofrm.ProgressBar1.Position:=progresofrm.ProgressBar1.Position+progreso;
  progresofrm.ProgressBar1.StepIt;
  progresofrm.ProgressBar1.Refresh;

  LiquidDQRY2.Next;



 end;



   dm.MyQry.close;
   dm.MyQry.SQL.Clear;
   dm.MyQry.sql.Add(' UPDATE LIQUIDACIONM SET post=''T'' WHERE PLULIQUIDACION=:PLULIQ  ');
   dm.MyQry.ParamByName('PLULIQ').Value := plu;
   dm.MyQry.ExecSQL;

   {LiquidMQry.Edit;
   LiquidMQrypost.Value:='T';
   LiquidMQry.Post;}

   // si todo se ejecuta con exito, se aplican los cambios
   dm.InsResSQL.ApplyUpdates;

   DM.INVENTARIOQRY.ApplyUpdates;


   dm.MyQry.close;
   dm.MyQry.SQL.Clear;
   dm.MyQry.sql.Add(' update  MOV_SUCURSALM set pluliquidacion=:plul WHERE  PLUEMPLEADOS=:pluempl AND PLULIQUIDACION=0 and post=''T'' ');
   dm.MyQry.sql.Add('  and cast(fecha as date)=:fecha  ');
   dm.MyQry.ParamByName('plul').Value := PLU;
   dm.MyQry.ParamByName('pluempl').Value := liquidmqrypluvendedor.Value;
   dm.MyQry.ParamByName('fecha').Value := liquidmqryfecha.Value ;
   dm.MyQry.ExecSQL;


   dm.MyQry.close;
   dm.MyQry.SQL.Clear;
   dm.MyQry.sql.Add(' update  MOV_SUCURSALM set PLUREQSUCURSAL=:plul WHERE  PLUSUCURSAL2=:pluempl AND PLUREQSUCURSAL=0 AND TIPO=''TRA'' and post=''T'' ');
   dm.MyQry.sql.Add('  and cast(fecha as date)=:fecha  ');
   dm.MyQry.ParamByName('plul').Value := PLU;
   dm.MyQry.ParamByName('pluempl').Value := liquidmqrypluvendedor.Value;
   dm.MyQry.ParamByName('fecha').Value := liquidmqryfecha.Value ;
   dm.MyQry.ExecSQL;


     Liquiddqry.Close;

     LIQUIDMQRY.CLOSE;
     LIQUIDMQRY.Params[0].VALUE := DM.EmpresaQRYPLUEMPRESA.Value;
     LIQUIDMQRY.Params[1].VALUE := DM.BodegaQRYPLUBODEGA.Value;
     LIQUIDMQRY.Params[2].VALUE := plu;
     LIQUIDMQRY.OPEN;

     liquiddqry.Open;

     progresofrm.Close;

 except
  on e : exception do
    begin

      progresofrm.close;
      //si hay algun error , se deshacen los cambios
      DM.INVENTARIOQRY.CancelUpdates;
      dm.InsResSQL.CancelUpdates;
      ShowMessage ('Clase de error: ' + e.ClassName + chr(13) + chr(13) +
          'Mensaje del error: ' + e.Message+', Error al Procesar  (PP)...');


    end;

  end; //try

  end; //desea continuar

  progresofrm.Close;
  ShortDateFormat := 'DD/MM/YY';

end;

procedure TliquidFRM2.SpeedButton11Click(Sender: TObject);
begin

 if LIQUIDMQRYpost.Value ='T' then
    exit;

   IF LIQUIDMQRY.IsEmpty THEN
      EXIT;

  dm.myqry3.close;
  dm.myqry3.sql.clear;
  dm.myqry3.sql.add('select post  from liquidacionm where pluliquidacion=:plul ');
  dm.myqry3.parambyname('plul').value := LiquidMqrypluliquidacion.value;
  dm.myqry3.open;

  if dm.myqry3.FieldByName('post').value='T' then
  begin
    plu := LiquidMqrypluliquidacion.Value;
    showmessage('Documento ya fue procesado, no puede Borrarlo!!');
    Liquiddqry.Close;
    Liquidmqry.Close;
    liquidmqry.Locate('pluliquidacion',plu,[]);
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

procedure TliquidFRM2.SpeedButton12Click(Sender: TObject);
begin
    if LIQUIDMQRYpost.Value ='T' then
    exit;

    LIQUIDMQRY.Cancel;
end;

procedure TliquidFRM2.SpeedButton9Click(Sender: TObject);
begin
    if LIQUIDMQRYpost.Value ='T' then
       exit;
    IF LIQUIDMQRY.IsEmpty THEN
       EXIT;

  dm.myqry.close;
  dm.myqry.sql.clear;
  dm.myqry.sql.add('select post  from liquidacionm where pluliquidacion=:plul ');
  dm.myqry.parambyname('plul').value := LiquidMqrypluliquidacion.value;
  dm.myqry.open;

  if dm.myqry.FieldByName('post').value='T' then
  begin
    plu := LiquidMqrypluliquidacion.Value;
    showmessage('Documento ya fue procesado!!');
    Liquiddqry.Close;
    Liquidmqry.Close;
    liquidmqry.Locate('pluliquidacion',plu,[]);
    liquiddqry.Open;
    exit;
  end;

    LIQUIDMQRY.edit;
end;

initialization
  {$I uliquidfrm2.lrs}

end.

