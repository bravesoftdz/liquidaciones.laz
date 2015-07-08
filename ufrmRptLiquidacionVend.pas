unit ufrmRptLiquidacionVend;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
{$IFnDEF FPC}
  Windows,
{$ELSE}
  LCLIntf, LCLType, LMessages,
{$ENDIF}
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, DBCtrls, claseaexcel, IBQuery, ComCtrls,
  StdCtrls, Buttons, ExtCtrls, DateTimePicker;

type

  { TfrmRptLiquidacionVend }

  TfrmRptLiquidacionVend = class(TForm)
    BitBtn1: TBitBtn;
    Dguardar: TSaveDialog;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    vendQRY: TIBQuery;
    VEndDS: TDataSource;
    vendQRYPLUEMPLEADOS: TIntegerField;
    vendQRYNOMBRE: TIBStringField;
    cmbVendedor: TDBLookupComboBox;
    chCheck: TCheckBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure chCheckChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure chCheckClick(Sender: TObject);
    procedure Label4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRptLiquidacionVend: TfrmRptLiquidacionVend;

implementation

uses liqdm;

{$IFnDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}

procedure TfrmRptLiquidacionVend.BitBtn2Click(Sender: TObject);
begin
 close;
end;

procedure TfrmRptLiquidacionVend.chCheckChange(Sender: TObject);
begin
      if chCheck.Checked then
     begin
      cmbVendedor.Enabled := false;
      vendqry.close;
     end
     else
     begin
      cmbVendedor.Enabled := true;
      vendqry.close;
      vendqry.Open;

     end;
end;

procedure TfrmRptLiquidacionVend.FormCreate(Sender: TObject);
begin
 //shortdateformat:='mm/dd/yyyy';
 //dtp1.Date := Now;
 //dtp2.Date := Now;
 vendqry.Database := dm.fbdb;
 vendqry.DataSource := dm.EmpresaDS;

end;

procedure TfrmRptLiquidacionVend.FormClose(Sender: TObject; var Action: TCloseAction);
begin
shortdateformat:='dd/mm/yyyy';
end;

procedure TfrmRptLiquidacionVend.BitBtn1Click(Sender: TObject);
var
 qry: TIBQuery;
 excel : Taexcel;
 lsql,archivo :   string;
begin

 try
  qry := TIBQuery.Create(self);
  excel := Taexcel.Create();

  if chCheck.Checked then
  begin

    lsql := ' SELECT p.FECHA, p.LIQUIDACION, p.PLUVENDEDOR, p.NOMBRE, p.CODPROD, p.DESCPROD,'+
    ' p.PLULIQUIDACION, p.PLUPRODUCTO, p.INICIAL, p.PED_RUTA, p.FISICO, p.SALDO VENTA, '+
    ' p.DEVOLUCION, p.PED_BODEGA, p.FINAL, p.PRECIO, p.TOTAL, p.SUBTOTAL,'+
    ' p.DESCUENTO, p.TRANSFER, p.MONTO_COMISION, p.PORC_COMISION, p.POR_COMISION '+
    ' FROM SP_LIQUIDACIOND  p; ';

  end
  else
  begin

   vendqry.Locate('nombre',cmbvendedor.Text,[]);
    lsql := ' SELECT p.FECHA, p.LIQUIDACION, p.PLUVENDEDOR, p.NOMBRE, p.CODPROD, p.DESCPROD,'+
    ' p.PLULIQUIDACION, p.PLUPRODUCTO, p.INICIAL, p.PED_RUTA, p.FISICO, p.SALDO VENTA, '+
    ' p.DEVOLUCION, p.PED_BODEGA, p.FINAL, p.PRECIO, p.TOTAL, p.SUBTOTAL,'+
    ' p.DESCUENTO, p.TRANSFER, p.MONTO_COMISION, p.PORC_COMISION, p.POR_COMISION '+
    ' FROM SP_LIQUIDACIOND  p '+
    ' WHERE p.PLUVENDEDOR='''+VENDQRYPLUEMPLEADOS.ASSTRING+''' ';



  end;

  qry.Database := dm.fbdb;
  qry.close;
  qry.sql.Clear;
  qry.sql.Add(lsql);
  qry.Open;

  if qry.IsEmpty then
  begin
    ShowMessage(' No se Encontraron Datos');
    exit;
  end;

     excel:= Taexcel.create();

     archivo := 'c:\ventas.xls';
     EXCEL.mDataset := QRY;
     if Dguardar.Execute then
     begin
          archivo := Dguardar.FileName ;
          excel.nombre:= archivo;
     end
     else
          excel.nombre:=  archivo ;
     excel.exportar;

     showmessage('Reporte Generado!!!, ruta :'+archivo);


 finally
  qry.Free;
  excel.Free;
 end;

end;

procedure TfrmRptLiquidacionVend.chCheckClick(Sender: TObject);
begin



end;

procedure TfrmRptLiquidacionVend.Label4Click(Sender: TObject);
begin

end;

end.
