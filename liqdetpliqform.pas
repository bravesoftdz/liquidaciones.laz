unit liqdetpliqform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, DBGrids, Buttons, StdCtrls, ExtCtrls, IBQuery, IBCustomDataSet,
  IBUpdateSQL, RTTICtrls, ZDataset, ZSqlUpdate;

type

  { TfrmLiqPago }

  TfrmLiqPago = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    DBGrid2: TDBGrid;
    EDTtOTAL: TEdit;
    EDTDIF: TEdit;
    fpago2DS: TDatasource;
    fpagoQRYCODIGO: TStringField;
    fpagoQRYCREDITO: TStringField;
    fpagoQRYDESCRIPCION: TStringField;
    fpagoQRYDIASCRED: TLongintField;
    fpagoQRYFECHA_CREA: TDateTimeField;
    fpagoQRYPLUCUENTA: TLongintField;
    fpagoQRYPLUSUARIO: TIntegerField;
    fpagoQRYREGLASCRED: TStringField;
    fpagoQRY: TIBQuery;
    fpago2QRY: TIBQuery;
    fpago2QRYCODIGO: TIBStringField;
    fpago2QRYCREDITO: TIBStringField;
    fpago2QRYDESCRIPCION: TIBStringField;
    fpago2QRYDIASCRED: TIntegerField;
    fpago2QRYFECHA_CREA: TDateTimeField;
    fpago2QRYPLUCUENTA: TIntegerField;
    fpago2QRYPLUSUARIO: TIntegerField;
    fpago2QRYREGLASCRED: TIBStringField;
    liqPagoQryCODIGO: TIBStringField;
    liqPagoQryDESCRIPCION: TIBStringField;
    liqPagoQryENVIADO: TIBStringField;
    liqPagoQryITEM: TIntegerField;
    liqPagoQryMONTO: TIBBCDField;
    liqPagoQryOBSERVACION: TIBStringField;
    liqPagoQryPLULIQUIDACION: TIntegerField;
    liqPagoQryTIPO: TStringField;
    liqpagoSQL: TIBUpdateSQL;
    liqPagoQry: TIBQuery;
    Label1: TLabel;
    Label2: TLabel;
    liqPAgoDS: TDatasource;
    DBGrid1: TDBGrid;
    pbancos: TPanel;
    Panel2: TPanel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure liqPagoQRYAfterDelete(DataSet: TDataSet);
    procedure liqPagoQryAfterOpen(DataSet: TDataSet);
    procedure liqPagoQRYAfterPost(DataSet: TDataSet);
    procedure liqPagoQRYNewRecord(DataSet: TDataSet);
    procedure pbancosEnter(Sender: TObject);
    procedure pbancosExit(Sender: TObject);
  private
    { private declarations }
    function suma:currency;
  public
    { public declarations }
    tipo:string;
    montoTes : currency;
  end; 

var
  frmLiqPago: TfrmLiqPago;

implementation

uses
liqLiquidacion,
liqdm,
procesos  ,
ufrmmontotes;

{ TfrmLiqPago }

procedure TfrmLiqPago.FormShow(Sender: TObject);
var
total,dif:currency;
begin

   liqPagoQry.close;
   liqPagoQry.Params[0].Value := liquidFRm.LIQUIDMQRYPLULIQUIDACION.value;
   liqPagoQry.Params[1].Value := tipo;
   LiqPagoQry.Open;

   fpagoQry.Close;
   fpagoQry.Open;

   while not fpagoqry.EOF do
   begin

     DM.MYQRY.CLOSE;
     DM.MYQRY.SQL.CLEAR;
     DM.MYQRY.SQL.ADD('SELECT CODIGO FROM LIQUIDACION_DET WHERE PLULIQUIDACION =:PLULIQUI and tipo=:tipo ');
     DM.MYQRY.SQL.ADD(' AND CODIGO=:CODIGO ');
     DM.MYQRY.ParamByName('PLULIQUI').VALUE := liquidFRm.LIQUIDMQRYPLULIQUIDACION.value;
     DM.MYQRY.ParamByName('CODIGO').VALUE := fpagoqrycodigo.Value;
     DM.MYQRY.ParamByName('tipo').VALUE := tipo;
     DM.MYQRY.Open;

     IF DM.MYQRY.IsEmpty THEN
     BEGIN

     liqPagoQry.Insert;
     liqPagoQrycodigo.Value := fpagoqrycodigo.Value;
     liqpagoQryDescripcion.Value:= fpagoqrydescripcion.Value;
     liqpagoqrymonto.Value:=0;
     liqpagoqryobservacion.Value := '';
     liqpagoqry.Post;


     end;
     fpagoqry.Next;
   end;


  total := suma();

  if tipo='TES' then
  dif:= total - montoTes
  else
  dif:= total - liquidFRM.LIQUIDMQRYTOTAL.Value;

  edtTotal.Text := currtostr(total);
  edtdif.Text   := currtostr(dif);

end;

procedure TfrmLiqPago.liqPagoQRYAfterDelete(DataSet: TDataSet);
begin
    liqPagoQry.ApplyUpdates;
    edtTotal.Text := currtostr(suma);
end;

procedure TfrmLiqPago.liqPagoQryAfterOpen(DataSet: TDataSet);
begin

end;

procedure TfrmLiqPago.liqPagoQRYAfterPost(DataSet: TDataSet);
VAR
total,dif:currency;
begin

  liqPagoQry.ApplyUpdates;

  total := suma();

  if (tipo='DSV')  then
  dif:= total - liquidFRM.LIQUIDMQRYTOTAL.Value
  else
  dif:= total - montoTes;

  edtTotal.Text := currtostr(total);
  edtdif.Text   := currtostr(dif);

end;





function TfrmLiqPago.suma:currency;
var
total:currency;
begin

  dm.myqry.close;
  dm.myqry.sql.clear;
  dm.myqry.sql.add('select sum(monto) monto from liquidacion_det where pluliquidacion=:plul '+
  ' and tipo=:tipo ');
  dm.myqry.parambyname('plul').value := liquidFRm.LIQUIDMQRYPLULIQUIDACION.value;
  dm.myqry.parambyname('tipo').value := tipo;
  dm.myqry.open;

  if dm.myqry.fieldbyname('monto').value >0 then
     total := roundd(dm.myqry.fieldbyname('monto').value,3)
     else
     total :=0;

     result := total;

end;

procedure TfrmLiqPago.BitBtn1Click(Sender: TObject);
var
total:currency;
tt: currency;
begin

  total := suma;

  if total=0 then
     begin
      showmessage('No definio forma de pago, no puede procesar Liquidacion!!');
      exit;
     end;

     if (tipo='DSV')  then
     tt:= total - liquidFRM.LIQUIDMQRYTOTAL.Value
     else
     tt:= total - montotes;


  if tt <> 0 then
  begin
    if (tipo='DSV')  then
     showmessage('monto de pago difiere de Venta Total, no puede Procesar Liquidacion!!!')
     else
     showmessage('monto de pago difiere de Total TES Digitado, no puede Procesar Liquidacion!!!');

     exit;
  end;


        if MessageDlg('Seguro de los Cambios..?',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
         begin
           ModalResult := mrOk;

           //if tipo='TES' then
           //begin
           //   ModalResult := mrOk;
           //   exit;
           //end;

            //with Tfrmmontotes.Create(SELF) do
            //try
            //
            // if ShowModal = mrOk then
            //  begin
            //     ModalResult := mrOk;
            //
            //
            //  end;
            //
            //finally
            //    frmmontotes.Free;
            //end;

         end;


end;

procedure TfrmLiqPago.BitBtn2Click(Sender: TObject);
begin

  fpago2qry.Close;
  fpago2qry.Open;
  pbancos.Visible:=true;

end;

procedure TfrmLiqPago.BitBtn3Click(Sender: TObject);
begin

   if fpago2qry.IsEmpty then exit;

          liqPagoQRY.Insert;
          liqPagoQrycodigo.Value      := fpago2qrycodigo.Value;
          liqpagoQryDescripcion.Value := fpago2qrydescripcion.Value;
          liqpagoqrymonto.Value       := 0;
          liqpagoqryobservacion.Value := '';
          liqpagoqry.Post;

          liqpagoqry.Refresh;

          fpago2qry.Close;
          pbancos.Visible:= false;

end;

procedure TfrmLiqPago.BitBtn4Click(Sender: TObject);
begin
  pbancos.Visible:= false;
end;

procedure TfrmLiqPago.DBGrid2DblClick(Sender: TObject);
begin
  bitbtn3.Click;
end;

procedure TfrmLiqPago.FormCreate(Sender: TObject);
begin

end;

procedure TfrmLiqPago.liqPagoQRYNewRecord(DataSet: TDataSet);
var
item:integer;
begin

  dm.myqry.Close;
  dm.MyQry.SQL.Clear;
  dm.MyQry.SQL.Add('select max(item) item from liquidacion_det where ');
  dm.MyQry.SQL.Add(' pluliquidacion=:plul  ');
  dm.myqry.parambyname('plul').value := liquidFRm.LIQUIDMQRYPLULIQUIDACION.value;
  dm.MyQry.Open;

  if dm.MyQry.FieldByName('item').Value>0 then
     item := dm.MyQry.FieldByName('item').Value + 1
     else
     item := 1;

  liqPagoQrypluliquidacion.Value := liquidFRm.LIQUIDMQRYPLULIQUIDACION.value;
  liqPagoQrymonto.Value:=0;
  liqPagoQryitem.Value := item;
  liqPagoQryTipo.Value := tipo;
  liqPagoQryEnviado.Value := 'N';

end;

procedure TfrmLiqPago.pbancosEnter(Sender: TObject);
begin
  fpago2qry.Close;
  fpago2qry.Open;
end;

procedure TfrmLiqPago.pbancosExit(Sender: TObject);
begin
  fpago2qry.Close;
end;

initialization
  {$I liqdetpliqform.lrs}

end.

