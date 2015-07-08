unit liqBancosForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, DBGrids, Buttons, ZDataset;

type

  { TfrmBancos }

  TfrmBancos = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    fpago2DS: TDatasource;
    DBGrid1: TDBGrid;
    fpago2QRY: TZQuery;
    fpago2QRYCODIGO: TStringField;
    fpago2QRYCREDITO: TStringField;
    fpago2QRYDESCRIPCION: TStringField;
    fpago2QRYDIASCRED: TLongintField;
    fpago2QRYFECHA_CREA: TDateTimeField;
    fpago2QRYPLUCUENTA: TLongintField;
    fpago2QRYPLUSUARIO: TLongintField;
    fpago2QRYREGLASCRED: TStringField;
    Panel1: TPanel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  frmBancos: TfrmBancos;



{ TfrmBancos }

procedure TfrmBancos.FormShow(Sender: TObject);
begin

   fpago2qry.Close;
   fpago2qry.open;

end;

procedure TfrmBancos.BitBtn1Click(Sender: TObject);
begin
          if fpago2qry.IsEmpty then
             exit;

          frmLiqPago.liqPagoQRY.Insert;
          frmLiqPago.liqPagoQrycodigo.Value      := fpago2qrycodigo.Value;
          frmLiqPago.liqpagoQryDescripcion.Value := fpago2qrydescripcion.Value;
          frmLiqPago.liqpagoqrymonto.Value       :=0;
          frmLiqPago.liqpagoqry.Post;


end;

procedure TfrmBancos.BitBtn2Click(Sender: TObject);
begin
  close;
end;

initialization
  {$I liqbancosform.lrs}

end.

