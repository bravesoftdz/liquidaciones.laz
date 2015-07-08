unit liqLreportes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, StdCtrls, EditBtn, Buttons, DBGrids, IBQuery, IBCustomDataSet,
  LR_DBSet, LR_Class, LR_E_CSV,  LR_DSet;

type

  { TliqRptfrm }

  TliqRptfrm = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    chAExcel: TCheckBox;
    DGuardar: TSaveDialog;
    frDBDataSet2: TfrDBDataSet;
    rptLiqProd: TIBQuery;
    rptLiquidaciones: TIBQuery;
    rptLiqProdDESCUENTO: TFloatField;
    rptLiqProdSUBTOTAL: TFloatField;
    rptLiqProdTRANSFER: TLargeintField;
    rptLiquidacionesBODEGA: TIBStringField;
    rptLiquidacionesCODIGO: TIntegerField;
    rptLiquidacionesCSUPER: TIntegerField;
    rptLiquidacionesCVEND: TIBStringField;
    rptLiquidacionesEMPRESA: TIBStringField;
    rptLiquidacionesENCABEZADO1: TStringField;
    rptLiquidacionesENCABEZADO: TStringField;
    rptLiquidacionesFALTANTE: TIBBCDField;
    rptLiquidacionesFECHA: TDateField;
    rptLiquidacionesGASTOS: TIBBCDField;
    rptLiquidacionesNOMBRE: TIBStringField;
    rptLiquidacionesSUPNOMBRE: TIBStringField;
    rptLiquidacionesTOTAL: TIBBCDField;
    rptmovds: TDatasource;
    DBGrid1: TDBGrid;
    frDBDataSet1: TfrDBDataSet;
    lrpt: TfrReport;
    lrpt2: TfrReport;
    opc1: TRadioButton;
    opc2: TRadioButton;
    rptLiqProdBODEGA: TStringField;
    rptLiqProdCODIGO: TStringField;
    rptLiqProdDESCRIPCION: TStringField;
    rptLiqProdDEV: TLargeintField;
    rptLiqProdEMPRESA: TStringField;
    rptLiqProdENCABEZADO1: TStringField;
    rptLiqProdFECHA: TDateField;
    rptLiqProdFINAL: TLargeintField;
    rptLiqProdFISICO: TLargeintField;
    rptLiqProdINICIAL: TLargeintField;
    rptLiqProdPBODEGA: TLargeintField;
    rptLiqProdRUTA: TLargeintField;
    rptLiqProdSALDO: TLargeintField;
    rptLiqProdTOTAL: TFloatField;
    rptLiquidDS: TDatasource;
    FECHA1: TDateEdit;
    FECHA2: TDateEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure frDBDataSet2CheckEOF(Sender: TObject; var Eof: Boolean);
    procedure rptLiqProdCalcFields(DataSet: TDataSet);
    procedure rptLiquidacionesCalcFields(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  liqRptfrm: TliqRptfrm;

implementation

uses liqDM,claseaexcel;
{ TliqRptfrm }

procedure TliqRptfrm.rptLiquidacionesCalcFields(DataSet: TDataSet);
begin
    rptLiquidacionesEncabezado1.Value := 'REPORTE DE LIQUIDACIONES DEL '+DATETOSTR(FECHA1.Date)+
    ' AL '+DATETOSTR(FECHA2.DATE) ;

      rptLiquidacionesEncabezado.Value := 'RESUMEN POR VENDEDOR '+DATETOSTR(FECHA1.Date)+
    ' AL '+DATETOSTR(FECHA2.DATE) ;

end;

procedure TliqRptfrm.FormCreate(Sender: TObject);
begin
  fecha1.Date:= now;
  fecha2.Date:=now;
end;

procedure TliqRptfrm.frDBDataSet2CheckEOF(Sender: TObject; var Eof: Boolean);
begin

end;

procedure TliqRptfrm.rptLiqProdCalcFields(DataSet: TDataSet);
begin
  rptLiqpRODEncabezado1.Value := 'REPORTE DE LIQUIDACIONES DEL '+DATETOSTR(FECHA1.Date)+
    ' AL '+DATETOSTR(FECHA2.DATE) ;


end;

procedure TliqRptfrm.BitBtn1Click(Sender: TObject);
var
exportar: TAExcel;
begin

if opc1.Checked then
begin

   ShortDateFormat := 'MM/DD/YY';

   rptLiquidaciones.Close;
   rptLiquidaciones.Params[0].value :=  dm.empresaqrypluempresa.value;
   rptLiquidaciones.Params[1].value :=  dm.bodegaqryplubodega.value;
   rptLiquidaciones.Params[2].value :=  datetostr(fecha1.date);
   rptLiquidaciones.Params[3].value :=  datetostr(fecha2.date);
   rptLiquidaciones.open;

   ShortDateFormat := 'DD/MM/YY';


   if rptLiquidaciones.isempty then
   exit;

   if not(chAExcel.Checked) then
   begin
     rptliquidds.DataSet := rptLiquidaciones;
     lrpt.ShowReport;
   end
   else
   begin

          exportar := TAExcel.Create();
          exportar.mDataset := rptLiquidaciones;
          if Dguardar.Execute then
          exportar.nombre:=Dguardar.FileName
          else
          exportar.nombre:=  ExtractFilePath( Application.ExeName ) + 'rptLiquidaciones.xls' ;
          exportar.exportar;

          exportar.Free;

          showmessage('Archivo en Excel Generado!!!');
    end;



end; // reporte de liquidaciones resumen

if opc2.Checked then
begin

   rptLiqProd.Close;
   rptLiqProd.Params[0].value :=  dm.empresaqrypluempresa.value;
   rptLiqProd.Params[1].value :=  dm.bodegaqryplubodega.value;
   rptLiqProd.Params[2].value :=  datetostr(fecha1.date);
   rptLiqProd.Params[3].value :=  datetostr(fecha2.date);
   rptLiqProd.open;


   if rptLiqProd.isempty then
   exit;

   if not(chAExcel.Checked) then
   begin
    rptmovds.DataSet := rptLiqProd;
    lrpt2.ShowReport;
   end
   else
   begin

          exportar := TAExcel.Create();
          exportar.mDataset := rptLiqProd;
          if Dguardar.Execute then
          exportar.nombre:=Dguardar.FileName
          else
          exportar.nombre:=  ExtractFilePath( Application.ExeName ) + 'rptLiqProd.xls' ;
          exportar.exportar;

          exportar.Free;

          showmessage('Archivo en Excel Generado!!!');
   end;


end; // reporte de liquidaciones resumen


end;

initialization
  {$I liqlreportes.lrs}

end.

