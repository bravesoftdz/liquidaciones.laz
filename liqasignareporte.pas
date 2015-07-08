unit liqasignareporte;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, StdCtrls, EditBtn, Buttons, DbCtrls, IBQuery, IBCustomDataSet;

type

  { Tliqasignarpt }

  Tliqasignarpt = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    chMarca: TCheckBox;
    MarcaQRY: TIBQuery;
    rptAsignaQRY: TIBQuery;
    MarcaDS: TDatasource;
    cmbMarca: TDBLookupComboBox;
    FECHA1: TDateEdit;
    FECHA2: TDateEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    MarcaQRYCOMISION: TFloatField;
    MarcaQRYNOMBRE: TStringField;
    MarcaQRYORIGEN: TIBStringField;
    MarcaQRYPLUFABRICANTE: TLongintField;
    MarcaQRYPLUPROVINV: TIntegerField;
    DGuardar: TSaveDialog;
    procedure BitBtn1Click(Sender: TObject);
    procedure chMarcaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  liqasignarpt: Tliqasignarpt;

implementation

uses
liqdm,
claseaexcel;

{ Tliqasignarpt }

procedure Tliqasignarpt.chMarcaChange(Sender: TObject);
begin

  if self.chMarca.Checked then
  begin
     MArcaQRy.Close;
     MarcaQry.Open;
     CmbMArca.Enabled:= true;
  end
  else
  begin

     MArcaQRy.Close;
     CmbMArca.Enabled:= false;

  end;
end;

procedure Tliqasignarpt.FormCreate(Sender: TObject);
begin
    fecha1.Date:= now;
   fecha2.Date:=now;
end;

procedure Tliqasignarpt.BitBtn1Click(Sender: TObject);
var
condicion,sql :string;
exportar: TAExcel;
begin

   ShortDateFormat := 'MM/DD/YY';


   if chmarca.Checked then
      condicion := ' TIPO=''CAR'' AND plufabricante='+MArcaQRYplufabricante.AsString+
      ' and fecha between '''''+datetostr(fecha1.date)+''''' and '''''+datetostr(fecha2.date)+''''''
   else
   condicion := 'fecha between '''''+datetostr(fecha1.date)+''''' and '''''+datetostr(fecha2.date)+'''''';

   condicion := condicion + ' and pluempresa='+dm.empresaqrypluempresa.asstring+'';

    sql := 'SELECT QUERYFINAL from CREARPIVOTE(''ASIGNA_POR_VEND'',''fecha,nombre'',''codigo'',''cantidad'','''+condicion+''' )' ;


    dm.MyQry.Close;
    dm.MyQry.SQL.Clear;
    dm.MyQry.SQL.Add(sql);
    dm.MyQry.Open;

    if dm.MyQry.IsEmpty then exit;

    sql := dm.MyQry.Fields[0].value;


    rptAsignaQry.close;
    rptAsignaQry.SQL.Clear;
    rptAsignaQry.SQL.Add(sql);
    rptAsignaQry.Open;

    //total := 0;

    shortdateformat:='DD/MM/YY';

    if MessageDlg('Exportar a EXCEL ...?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin

          exportar := TAExcel.Create();
          exportar.mDataset := rptAsignaQry;
          if Dguardar.Execute then
          exportar.nombre:=Dguardar.FileName
          else
          exportar.nombre:=  ExtractFilePath( Application.ExeName ) + 'ventas.xls' ;
          exportar.exportar;

          exportar.Free;

          showmessage('Archivo en Excel Generado!!!');
    end;

end;

initialization
  {$I liqasignareporte.lrs}

end.

