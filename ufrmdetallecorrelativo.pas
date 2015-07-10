unit ufrmDetalleCorrelativo;

{$mode delphi}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, LResources, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, StdCtrls, Buttons, DbCtrls, IBQuery,
  IBCustomDataSet, IBUpdateSQL, IBDynamicGrid, db;

type

  { TfrmDetalleCorrelativo }

  TfrmDetalleCorrelativo = class(TForm)
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    comboTipo: TDBComboBox;
    CorrelativosVendQRYFINAL1: TLongintField;
    DBDateTimePicker1: TDBDateTimePicker;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    edtFinal: TDBEdit;
    GroupBox1: TGroupBox;
    CorrelativoSQL: TIBUpdateSQL;
    Label5: TLabel;
    seriesQRY: TIBQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    CorrelativosVendDS: TDataSource;
    CorrelativosVendQRY: TIBQuery;
    CorrelativosVendQRYCORRELATIVO: TIBStringField;
    CorrelativosVendQRYFACTURADO: TIBStringField;
    CorrelativosVendQRYFECHA_ASIGNA: TDateField;
    CorrelativosVendQRYFECHA_LIQ: TDateField;
    CorrelativosVendQRYIDCORRELATIVO: TIntegerField;
    CorrelativosVendQRYIDVENDEDOR: TIntegerField;
    CorrelativosVendQRYNUMERO: TIntegerField;
    CorrelativosVendQRYTIPO: TIBStringField;
    CorrelativosVendQRYUSUARIO_ASIGNA: TIBStringField;
    CorrelativosVendQRYUSUARIO_LIQ: TIBStringField;
    Panel1: TPanel;
    Panel2: TPanel;
    seriesQRYACTUAL: TIntegerField;
    seriesQRYCORRELATIVO: TIBStringField;
    seriesQRYFINAL: TIntegerField;
    seriesQRYINICIAL: TIntegerField;
    seriesQRYPLUEMPRESA: TIntegerField;
    seriesQRYTIPO: TIBStringField;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure CorrelativosVendQRYAfterPost(DataSet: TDataSet);
    procedure CorrelativosVendQRYNewRecord(DataSet: TDataSet);
    procedure CorrelativosVendQRYTIPOValidate(Sender: TField);
    procedure comboTipoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
  private
    fidvendedor: Integer;
    procedure setidvendedor(AValue: Integer);
    { private declarations }
  public
    { public declarations }
    property idvendedor:Integer read fidvendedor write setidvendedor;
  end;

var
  frmDetalleCorrelativo: TfrmDetalleCorrelativo;

implementation

uses liqDM,ufrmCorrelativosVend;

{ TfrmDetalleCorrelativo }

procedure TfrmDetalleCorrelativo.FormCreate(Sender: TObject);
begin

     seriesqry.Close;
     seriesqry.Open;
     CorrelativosVendQry.close;
     CorrelativosVendQry.Open;
     CorrelativosVendQry.Insert;
end;

procedure TfrmDetalleCorrelativo.CorrelativosVendQRYNewRecord(DataSet: TDataSet
  );
begin
    //showmessage(frmCorrelativosVend.LstVendQRYPLUEMPLEADOS.asstring);
    CorrelativosVendQryusuario_asigna.value := dm.userqryusuario.value;
    CorrelativosVendQryfecha_asigna.value := now;
    CorrelativosVendQryidvendedor.value := frmCorrelativosVend.LstVendQRYPLUEMPLEADOS.Value;
    correlativosvendqrytipo.Value:= 'FC';
    correlativosvendqryfacturado.Value:= 'N';
end;

procedure TfrmDetalleCorrelativo.CorrelativosVendQRYTIPOValidate(Sender: TField
  );

begin

    if seriesqry.Locate('tipo',CorrelativosVendQRYTIPO.Value,[]) then
    correlativosVendqrycorrelativo.Value:= seriesqrycorrelativo.Value ;

end;

procedure TfrmDetalleCorrelativo.comboTipoChange(Sender: TObject);
begin

   //if seriesqry.Locate('tipo',comboTipo.Text,[]) then
   // correlativosVendqrycorrelativo.Value:= seriesQRYcorrelativo.Value ;


end;

procedure TfrmDetalleCorrelativo.BitBtn4Click(Sender: TObject);
begin

end;

procedure TfrmDetalleCorrelativo.CorrelativosVendQRYAfterPost(DataSet: TDataSet
  );
begin
  CorrelativosvendQry.ApplyUpdates;
end;

procedure TfrmDetalleCorrelativo.BitBtn3Click(Sender: TObject);
var
  numero : integer;
begin

    if (correlativosVendQry.State = dsinsert) or (correlativosVendQry.State = dsedit) then
    begin
        if (correlativosVendQryfinal1.Value>=correlativosVendQrynumero.Value) then
        correlativosVendQry.Post
        else
          begin
          showmessage('Numero Final de Facturas no puede ser menos que el inicial!!!');
          edtFinal.SetFocus;
          exit;
          end;
    end;

    if (correlativosVendQryfinal1.Value>correlativosVendQrynumero.Value) then
    begin
      for numero:=correlativosVendQrynumero.Value to  correlativosVendQryfinal1.Value-1 do
      begin
          correlativosVendQry.Insert;
          correlativosVendQrynumero.Value:= numero + 1;
          correlativosVendQry.Post;

      end;
    end;

    ModalResult := mrOk;

    {
    if MessageDlg('Insertar Otro Correlativo..?',
                mtConfirmation, [mbYes, mbNo], 0) = mrNo then
   begin

         ModalResult := mrOk;

   end
    else
    begin
       numero := correlativosVendQrynumero.Value;
       correlativosVendQry.Insert;
       correlativosVendQrynumero.Value:= numero + 1;
    end;

    end; }


end;

procedure TfrmDetalleCorrelativo.GroupBox1Click(Sender: TObject);
begin

end;

procedure TfrmDetalleCorrelativo.Panel2Click(Sender: TObject);
begin

end;

procedure TfrmDetalleCorrelativo.setidvendedor(AValue: Integer);
begin
  if fidvendedor=AValue then Exit;
  fidvendedor:=AValue;
end;

initialization
  {$I ufrmDetalleCorrelativo.lrs}

end.

