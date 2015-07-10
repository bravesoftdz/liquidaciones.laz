unit ufrmcorrelativosvend;

{$mode delphi}

interface

uses
  Classes, SysUtils, FileUtil, LR_Class, LR_DBSet, LResources, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, StdCtrls, Buttons, DbCtrls, Menus, DBGrids,
  IBLookupComboEditBox, IBDynamicGrid, IBQuery, IBCustomDataSet, db, LR_DSet;

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
    LstCorLiquidadosQRY: TIBQuery;
    LstCorrelativosVendQRYCANAL1: TStringField;
    LstCorrelativosVendQRYCANAL2: TStringField;
    LstCorrelativosVendQRYCORRELATIVO: TIBStringField;
    LstCorrelativosVendQRYCORRELATIVO1: TIBStringField;
    LstCorrelativosVendQRYFACTURADO: TIBStringField;
    LstCorrelativosVendQRYFACTURADO1: TIBStringField;
    LstCorrelativosVendQRYFECHA_ASIGNA: TDateField;
    LstCorrelativosVendQRYFECHA_ASIGNA1: TDateField;
    LstCorrelativosVendQRYFECHA_LIQ: TDateField;
    LstCorrelativosVendQRYFECHA_LIQ1: TDateField;
    LstCorrelativosVendQRYIDCORRELATIVO: TIntegerField;
    LstCorrelativosVendQRYIDCORRELATIVO1: TIntegerField;
    LstCorrelativosVendQRYIDVENDEDOR: TIntegerField;
    LstCorrelativosVendQRYIDVENDEDOR1: TIntegerField;
    LstCorrelativosVendQRYNUMERO: TIntegerField;
    LstCorrelativosVendQRYNUMERO1: TIntegerField;
    LstCorrelativosVendQRYstatus1: TStringField;
    LstCorrelativosVendQRYstatus2: TStringField;
    LstCorrelativosVendQRYTIPO: TIBStringField;
    LstCorrelativosVendQRYTIPO1: TIBStringField;
    LstCorrelativosVendQRYUSUARIO_ASIGNA: TIBStringField;
    LstCorrelativosVendQRYUSUARIO_ASIGNA1: TIBStringField;
    LstCorrelativosVendQRYUSUARIO_LIQ: TIBStringField;
    LstCorrelativosVendQRYUSUARIO_LIQ1: TIBStringField;
    LstCorrelativosVendQRYVENDEDOR1: TStringField;
    LstCorrelativosVendQRYVENDEDOR2: TStringField;
    LstVendDS: TDataSource;
    LstVendQRY: TIBQuery;
    LstVendQRYCODIGO: TIBStringField;
    LstVendQRYISSS: TIBStringField;
    LstVendQRYNOMBRE: TIBStringField;
    LstVendQRYPLUEMPLEADOS: TIntegerField;
    MenuItem1: TMenuItem;
    Panel1: TPanel;
    PopupMenu1: TPopupMenu;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbVendedoresChange(Sender: TObject);
    procedure frDBDataSet1CheckEOF(Sender: TObject; var Eof: Boolean);
    procedure LstCorrelativosVendQRYCalcFields(DataSet: TDataSet);
    procedure MenuItem1Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);

  private
    procedure Borrar;
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
 frmDetalleCorrelativo.ShowModal;

 lstCorrelativosVendQry.close;
 lstCorrelativosVendQry.open;

end;

procedure TfrmCorrelativosVend.BitBtn4Click(Sender: TObject);
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
      Borrar;
  end;
end;

procedure TfrmCorrelativosVend.Borrar;
var
  qry :tibquery;
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

procedure TfrmCorrelativosVend.BitBtn5Click(Sender: TObject);
begin

  if LstCorrelativosVendQry.IsEmpty then
  begin
     showmessage('No se encontraron correlativos para este vendedor!!');
     exit;
  end;
  frDBDataSet1.DataSet:=LstCorrelativosVendQry;
  frReport1.ShowReport;
end;

procedure TfrmCorrelativosVend.BitBtn6Click(Sender: TObject);
begin

  if LstCorrelativosVendQry.IsEmpty then
  begin
     showmessage('No se encontraron correlativos para este vendedor!!');
     exit;
  end;

  LstCorLiquidadosQRY.Close;
  LstCorLiquidadosQRY.Open;
  frDBDataSet1.DataSet:=LstCorLiquidadosQRY;
  frReport1.ShowReport;

end;

procedure TfrmCorrelativosVend.BitBtn7Click(Sender: TObject);
begin
   if cmbVendedores.Text='' then
 begin
    showmessage('Seleccione un vendedor Valido!!');
    exit;
 end;

   IBDynamicGrid1.Clear;

 LstCorrelativosVendQRY.Close;
 LstCorrelativosVendQRY.SQL.Clear;
 LstCorrelativosVendQRY.SQL.Add('Select A.IDCORRELATIVO, A.IDVENDEDOR, A.TIPO, A.CORRELATIVO, '+
 ' A.NUMERO, A.FACTURADO, A.FECHA_ASIGNA, A.USUARIO_ASIGNA, '+
 ' A.FECHA_LIQ, A.USUARIO_LIQ From VEND_CORRELATIVO A '+
 '  where a.idvendedor='''+LstvendQrypluempleados.AsString+''' and A.FACTURADO=''S'' order by A.FECHA_ASIGNA ');
// LstCorrelativosVendQRY.Params[0].Value := LstvendQrypluempleados.Value ;
 LstCorrelativosVendQRY.Open;


end;

procedure TfrmCorrelativosVend.BitBtn8Click(Sender: TObject);
begin
   if cmbVendedores.Text='' then
 begin
    showmessage('Seleccione un vendedor Valido!!');
    exit;
 end;

    LstCorrelativosVendQRY.Close;
 LstCorrelativosVendQRY.SQL.Clear;
 LstCorrelativosVendQRY.SQL.Add('Select A.IDCORRELATIVO, A.IDVENDEDOR, A.TIPO, A.CORRELATIVO, '+
 ' A.NUMERO, A.FACTURADO, A.FECHA_ASIGNA, A.USUARIO_ASIGNA, '+
 ' A.FECHA_LIQ, A.USUARIO_LIQ From VEND_CORRELATIVO A '+
 '  where a.idvendedor=:pluempleados order by A.FECHA_ASIGNA desc  ');
 LstCorrelativosVendQRY.Params[0].Value := LstvendQrypluempleados.Value ;
 LstCorrelativosVendQRY.Open;

end;

procedure TfrmCorrelativosVend.FormCreate(Sender: TObject);
begin
    lstVendQry.Close;
    lstVendQry.Open;

   // lstCorrelativosVendQry.close;
   // lstCorrelativosVendQry.open;
end;

procedure TfrmCorrelativosVend.cmbVendedoresChange(Sender: TObject);
begin

    lstVendqry.Locate('nombre',cmbVendedores.Text,[]);

    LstCorrelativosVendQRY.Close;
    LstCorrelativosVendQRY.Open;

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

procedure TfrmCorrelativosVend.MenuItem1Click(Sender: TObject);
var
  qry :tibquery;
begin
  try
        qry := Tibquery.Create(self);
        qry.Database := dm.fbdb;
        qry.Transaction := dm.IBTransInv;
        qry.close;
        qry.SQL.Clear;
        qry.SQL.Add(' Delete From VEND_CORRELATIVO  Where IDvendedor = :IDvendedor');
        qry.Params[0].Value:= Lstvendqrypluempleados.Value;

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

procedure TfrmCorrelativosVend.Panel1Click(Sender: TObject);
begin

end;



initialization
  {$I ufrmcorrelativosvend.lrs}

end.

