unit liqfaltantesform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  ComCtrls, Buttons, StdCtrls, DbCtrls, MaskEdit, dbutils, db, ZDataset,
  ZSqlUpdate;

type

  { Tliqfaltantefrm }

  Tliqfaltantefrm = class(TForm)
    btnBuscar: TSpeedButton;
    btnBuscaVend: TSpeedButton;
    DBText2: TDBText;
    EDTFECHA: TDBEdit;
    FaltanteDS: TDatasource;
    dbCodigo: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBMemo1: TDBMemo;
    DBText1: TDBText;
    edtVendedor: TDBEdit;
    FaltanteQryCVEND: TStringField;
    FaltanteQryestatus1: TStringField;
    FaltanteQryFECHA: TDateField;
    FaltanteQryID: TLongintField;
    FaltanteQryMONTO: TFloatField;
    FaltanteQryNOMBRE: TStringField;
    FaltanteQryOBSERVACIONES: TStringField;
    FaltanteQryPLUVENDEDOR: TLongintField;
    FaltanteQryPOST: TStringField;
    FaltanteQrysaldo1: TCurrencyField;
    GroupBox1: TGroupBox;
    Label10: TLabel;
    Label37: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtSaldo: TMaskEdit;
    PopupCalBtn: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    btnsaldo: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton9: TSpeedButton;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    FaltanteSQL: TZUpdateSQL;
    FaltanteQry: TZQuery;
    procedure btnBuscarClick(Sender: TObject);
    procedure btnBuscaVendClick(Sender: TObject);
    procedure DBMemo1Change(Sender: TObject);
    procedure FaltanteQryAfterDelete(DataSet: TDataSet);
    procedure faltanteQRYAfterPost(DataSet: TDataSet);
    procedure faltanteQRYBeforeCancel(DataSet: TDataSet);
    procedure faltanteQRYBeforeEdit(DataSet: TDataSet);
    procedure faltanteQRYCalcFields(DataSet: TDataSet);
    procedure faltanteQRYCVENDValidate(Sender: TField);
    procedure faltanteQRYNewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PopupCalBtnClick(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnsaldoClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
  private
    { private declarations }
    procedure controles(estado:boolean);
  public
    { public declarations }
  end; 

var
  liqfaltantefrm: Tliqfaltantefrm;
  comandos : Tdbutil;

implementation

 uses liqbFaltanteform,liqdm,Pickdate,
 Liqbvendedorform;

{ Tliqfaltantefrm }


procedure Tliqfaltantefrm.controles(estado:boolean);
var
i:integer;
begin


        for I := 0 to self.ControlCount - 1 do    { Iterate }
        begin
                if self.Controls[i].ClassType<> ttoolbar then
                self.Controls[i].Enabled := estado;

        end;    { for }


end;


procedure Tliqfaltantefrm.SpeedButton13Click(Sender: TObject);
begin

     faltanteQRY.Insert;

end;

procedure Tliqfaltantefrm.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

procedure Tliqfaltantefrm.btnsaldoClick(Sender: TObject);
var
total:currency;
begin
   dm.MyQry.Close;
  dm.MyQry.SQL.Clear;
  dm.MyQry.SQL.Add('select sum(monto) total from  LIQ_FALTANTES  where pluvendedor= '+
  faltanteqrypluvendedor.AsString);
  dm.myqry.Open;

  if dm.MyQry.FieldByName('total').IsNull then
     total := 0
     else
     total := dm.MyQry.FieldByName('total').Value;

     edtsaldo.Text := currtostr(total) ;
end;

procedure Tliqfaltantefrm.SpeedButton3Click(Sender: TObject);
begin
  FALTANTEQRY.Cancel;
end;

procedure Tliqfaltantefrm.SpeedButton9Click(Sender: TObject);
begin

   if faltanteQRYpost.Value ='T' then
    exit;

   IF faltanteQRY.IsEmpty THEN
      EXIT;

   if MessageDlg('Desea Borrar Registro...?',
   mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    faltanteqry.Delete;


end;

procedure Tliqfaltantefrm.FormCreate(Sender: TObject);
begin

   comandos := TDButil.Create;
   CONTROLES(FALSE);
end;

procedure Tliqfaltantefrm.FormShow(Sender: TObject);
begin
        faltanteQry.Close;
        faltanteQry.Params[0].Value :=  0;
        faltanteQry.open;

        CONTROLES(FALSE);
end;

procedure Tliqfaltantefrm.PopupCalBtnClick(Sender: TObject);
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

     FALTANTEQRY.Edit;
     FALTANTEQryFEcha.AsString := Calendar1.Date;
     EdtFecha.SelectAll;

    end;
  finally
end;
end;

procedure Tliqfaltantefrm.SpeedButton11Click(Sender: TObject);
begin
    if faltanteQRYpost.Value ='T' then
    exit;

    if (faltanteQRY.State = dsinsert) or (faltanteQRY.State = dsedit) then
        faltanteQRY.Post;
end;

procedure Tliqfaltantefrm.SpeedButton12Click(Sender: TObject);
begin

   if faltanteQRYpost.Value ='T' then
    exit;


   faltanteQRY.Edit;
end;

procedure Tliqfaltantefrm.btnBuscarClick(Sender: TObject);
begin

 with TliqbFaltantefrm.Create(SELF) do
  try

   if ShowModal = mrOk then
    begin
        faltanteQry.Close;
        faltanteQry.Params[0].Value :=  dm.myqry.fieldbyname('id').value;
        faltanteQry.open;

        btnsaldo.Click;

        CONTROLES(FALSE);
    end;
  finally
end;


end;

procedure Tliqfaltantefrm.btnBuscaVendClick(Sender: TObject);
begin


  with Tbvendedorfrm.Create(SELF) do
  try

   if ShowModal = mrOk then
    begin

    IF NOT VENDQRY.IsEmpty THEN
    BEGIN

     FALTANTEQRYcvend.VALUE := VENDQRYcodigo.VALUE;

    END;

    end;
  finally

  end;
end;

procedure Tliqfaltantefrm.DBMemo1Change(Sender: TObject);
begin

end;

procedure Tliqfaltantefrm.FaltanteQryAfterDelete(DataSet: TDataSet);
begin
    faltanteqry.ApplyUpdates;
end;

procedure Tliqfaltantefrm.faltanteQRYAfterPost(DataSet: TDataSet);
begin
  CONTROLES(FALSE);
  faltanteqry.ApplyUpdates;
  btnsaldo.Click;
end;

procedure Tliqfaltantefrm.faltanteQRYBeforeCancel(DataSet: TDataSet);
begin
  CONTROLES(FALSE);
end;

procedure Tliqfaltantefrm.faltanteQRYBeforeEdit(DataSet: TDataSet);
begin
  CONTROLES(TRUE);
end;

procedure Tliqfaltantefrm.faltanteQRYCalcFields(DataSet: TDataSet);
begin

 // faltanteqrysaldo1.Value := 0;
 // if not faltanteqrypluvendedor.Value>0 then exit;



  if faltanteqrypost.value = 'T' then
     faltanteqryestatus1.value := '**Procesado'
     else
     faltanteqryestatus1.value := '**Sin Procesar';


end;

procedure Tliqfaltantefrm.faltanteQRYCVENDValidate(Sender: TField);
begin
  dm.myqry.close;
  dm.myqry.sql.clear;
  dm.myqry.sql.add('select pluempleados,codigo,nombre,activo,plusucursal from empleados where codigo like :codigo ');
  dm.myqry.parambyname('codigo').value :=  faltanteQryCVEND.Value;
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

  if dm.myqry.FieldByName('plusucursal').value<>dm.BodegaQRYPLUBODEGA.value then
  begin
       showmessage('El vendedor no pertenese a esta sucursal!!!');
       edtvendedor.SetFocus;
       exit;
  end;

  faltanteqrypluvendedor.Value := dm.myqry.FieldByName('pluempleados').value;
  faltanteqrynombre.Value := dm.myqry.FieldByName('nombre').value;
 // faltanteqryplusucursal2.Value := dm.myqry.FieldByName('pluempleados').value;


end;

procedure Tliqfaltantefrm.faltanteQRYNewRecord(DataSet: TDataSet);
begin

  CONTROLES(TRUE);
  dbcodigo.Enabled:= false;
  faltanteqryfecha.Value:=DATE;
  faltanteqrymonto.Value:= 0;
  faltanteqrypost.value := 'F';
  faltanteqrypluvendedor.Value:= 0;
  edtsaldo.Text:='0';

end;

initialization
  {$I liqfaltantesform.lrs}

end.

