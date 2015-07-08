unit ufrmRptLiqVendExis;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, LResources, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, StdCtrls, DbCtrls, Buttons, IBQuery,
  IBCustomDataSet, db, memds,claseaexcel;

type

  { TfrmRptLiqVendExis }

  TfrmRptLiqVendExis = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    chCheck: TCheckBox;
    cmbVendedor: TDBLookupComboBox;
    Dguardar: TSaveDialog;
    IBQuery1CODIGO: TIntegerField;
    IBQuery1CODIGO1: TIBStringField;
    IBQuery1DESCUENTO: TIBBCDField;
    IBQuery1DEVOLUCION: TIBBCDField;
    IBQuery1FECHA: TDateField;
    IBQuery1FINAL: TIBBCDField;
    IBQuery1FISICO: TIBBCDField;
    IBQuery1INICIAL: TIBBCDField;
    IBQuery1MONTO_COMISION: TIBBCDField;
    IBQuery1NOMBRE: TIBStringField;
    IBQuery1PED_BODEGA: TIBBCDField;
    IBQuery1PED_RUTA: TIBBCDField;
    IBQuery1PLULIQUIDACION: TIntegerField;
    IBQuery1PLUPRODUCTO: TIntegerField;
    IBQuery1PORC_COMISION: TIBBCDField;
    IBQuery1POR_COMISION: TIBBCDField;
    IBQuery1PRECIO: TIBBCDField;
    IBQuery1SALDO: TIBBCDField;
    IBQuery1SUBTOTAL: TIBBCDField;
    IBQuery1TOTAL: TIBBCDField;
    IBQuery1TRANSFER: TIBBCDField;
    Label1: TLabel;
    MemDS: TMemDataset;
    VEndDS: TDataSource;
    vendQRY: TIBQuery;
    vendQRYNOMBRE: TIBStringField;
    vendQRYPLUEMPLEADOS: TIntegerField;
    procedure Bevel1ChangeBounds(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure chCheckChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmRptLiqVendExis: TfrmRptLiqVendExis;

implementation

uses liqdm;

{ TfrmRptLiqVendExis }

procedure TfrmRptLiqVendExis.FormCreate(Sender: TObject);
begin
   shortdateformat:='mm/dd/yyyy';

 vendqry.Database := dm.fbdb;
 vendqry.DataSource := dm.EmpresaDS;
end;

procedure TfrmRptLiqVendExis.Bevel1ChangeBounds(Sender: TObject);
begin

end;

procedure TfrmRptLiqVendExis.BitBtn1Click(Sender: TObject);
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
    'p.PLULIQUIDACION, p.PLUPRODUCTO, p.INICIAL, p.PED_RUTA,p.INICIAL + p.PED_RUTA TOTAL  '+
    ' FROM EXIST_VENDEDOR_LIQ  p; ';

  end
  else
  begin

   vendqry.Locate('nombre',cmbvendedor.Text,[]);
    lsql := ' SELECT p.FECHA, p.LIQUIDACION, p.PLUVENDEDOR, p.NOMBRE, p.CODPROD, p.DESCPROD,'+
    ' p.PLULIQUIDACION, p.PLUPRODUCTO, p.INICIAL, p.PED_RUTA,p.INICIAL + p.PED_RUTA TOTAL  '+
    ' FROM EXIST_VENDEDOR_LIQ  p '+
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

procedure TfrmRptLiqVendExis.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmRptLiqVendExis.chCheckChange(Sender: TObject);
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

initialization
  {$I ufrmRptLiqVendExis.lrs}

end.

