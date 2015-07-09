unit ufrmcorrelativosvend;

{$mode delphi}

interface

uses
  Classes, SysUtils, FileUtil, LR_Class, LR_DBSet, LResources, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, StdCtrls, Buttons, DbCtrls, IBLookupComboEditBox,
  IBDynamicGrid, IBQuery, IBCustomDataSet, db, LR_DSet;

type

  { TfrmCorrelativosVend }

  TfrmCorrelativosVend = class(TForm)
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    IBDynamicGrid1: TIBDynamicGrid;
    cmbVendedores: TIBLookupComboEditBox;
    Label2: TLabel;
    LstCorrelativosVendDS: TDataSource;
    LstCorrelativosVendQRY: TIBQuery;
    LstCorrelativosVendQRYCANAL1: TStringField;
    LstCorrelativosVendQRYCORRELATIVO: TIBStringField;
    LstCorrelativosVendQRYFACTURADO: TIBStringField;
    LstCorrelativosVendQRYFECHA_ASIGNA: TDateField;
    LstCorrelativosVendQRYFECHA_LIQ: TDateField;
    LstCorrelativosVendQRYIDCORRELATIVO: TIntegerField;
    LstCorrelativosVendQRYIDVENDEDOR: TIntegerField;
    LstCorrelativosVendQRYNUMERO: TIntegerField;
    LstCorrelativosVendQRYstatus1: TStringField;
    LstCorrelativosVendQRYTIPO: TIBStringField;
    LstCorrelativosVendQRYUSUARIO_ASIGNA: TIBStringField;
    LstCorrelativosVendQRYUSUARIO_LIQ: TIBStringField;
    LstCorrelativosVendQRYVENDEDOR1: TStringField;
    LstVendDS: TDataSource;
    LstVendQRY: TIBQuery;
    LstVendQRYCODIGO: TIBStringField;
    LstVendQRYISSS: TIBStringField;
    LstVendQRYNOMBRE: TIBStringField;
    LstVendQRYPLUEMPLEADOS: TIntegerField;
    Panel1: TPanel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbVendedoresChange(Sender: TObject);
    procedure frDBDataSet1CheckEOF(Sender: TObject; var Eof: Boolean);
    procedure LstCorrelativosVendQRYCalcFields(DataSet: TDataSet);
    procedure Panel1Click(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmCorrelativosVend: TfrmCorrelativosVend;

implementation

uses ufrmDetalleCorrelativo,liqdm,ufrmLiqCorFacturas;

{ TfrmCorrelativosVend }


procedure TfrmCorrelativosVend.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmCorrelativosVend.BitBtn3Click(Sender: TObject);
begin

  application.CreateForm(TfrmDetalleCorrelativo,frmDetalleCorrelativo);
  frmDetalleCorrelativo.idvendedor := lstVendqrypluempleados.Value;
  frmDetalleCorrelativo.showModal;

  lstCorrelativosVendQry.close;
  lstCorrelativosVendqry.Open;


end;

procedure TfrmCorrelativosVend.BitBtn4Click(Sender: TObject);
var
  qry :tibquery;
begin
   if  lstCorrelativosvendqryfacturado.Value = 'S' then
   BEGIN
      showmessage('No puede eliminar correlativo ya liquidado!!');
      exit;
   end;

    if LstCorrelativosVendQry.IsEmpty then
  begin
     showmessage('No se encontraron correlativos para este vendedor!!');
     exit;
  end;

   if MessageDlg('Desea Borrar Registro...?',
   mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
     try
       qry := Tibquery.Create(self);
       qry.Database := dm.fbdb;
       qry.Transaction := dm.IBTransInv;
       qry.close;
       qry.SQL.Clear;
       qry.SQL.Add(' Delete From VEND_CORRELATIVO  Where IDCORRELATIVO = :IDCORRELATIVO');
       qry.Params[0].Value:= LstCorrelativosVendQryidcorrelativo.Value;

       dm.IBTransInv.Active := false;
       dm.IBTransInv.StartTransaction;
       try

         qry.ExecSQL;
         dm.IBTransInv.commit;
       except
         dm.IBTransInv.rollback;
         showmessage('Error al borrar registro!!');
       end;


     finally
       qry.Free;
       lstCorrelativosVendQry.close;
       lstCorrelativosVendqry.Open;
     end;
  end;
end;

procedure TfrmCorrelativosVend.BitBtn5Click(Sender: TObject);
begin

  if LstCorrelativosVendQry.IsEmpty then
  begin
     showmessage('No se encontraron correlativos para este vendedor!!');
     exit;
  end;

  frReport1.ShowReport;
end;

procedure TfrmCorrelativosVend.BitBtn6Click(Sender: TObject);
begin
   application.CreateForm(TfrmLiqCorFacturas,frmLiqCorFacturas);
   frmLiqCorFacturas.showModal;
end;

procedure TfrmCorrelativosVend.FormCreate(Sender: TObject);
begin
    lstVendQry.Close;
    lstVendQry.Open;

    lstCorrelativosVendQry.close;
    lstCorrelativosVendQry.open;
end;

procedure TfrmCorrelativosVend.cmbVendedoresChange(Sender: TObject);
begin
    lstVendqry.Locate('nombre',cmbVendedores.Text,[]);

end;

procedure TfrmCorrelativosVend.frDBDataSet1CheckEOF(Sender: TObject;
  var Eof: Boolean);
begin

end;

procedure TfrmCorrelativosVend.LstCorrelativosVendQRYCalcFields(
  DataSet: TDataSet);
begin
  lstCorrelativosVendQryvendedor1.Value:= lstVendqrynombre.Value;
  lstCorrelativosvendqrycanal1.Value:= lstVendqryisss.AsString;

  if  lstCorrelativosvendqryfacturado.Value = 'S' then
   lstCorrelativosvendqrystatus1.Value:= 'FACTURADO'
   else
     lstCorrelativosvendqrystatus1.Value:= 'pendiente';

end;

procedure TfrmCorrelativosVend.Panel1Click(Sender: TObject);
begin

end;



initialization
  {$I ufrmcorrelativosvend.lrs}

end.

