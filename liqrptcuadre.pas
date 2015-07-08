unit liqRptCuadre;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, DBGrids, Buttons, StdCtrls, MaskEdit, EditBtn, DbCtrls,
  IBQuery, IBCustomDataSet, IBStoredProc, ZDataset, ZStoredProcedure, LR_Class,
  LR_DBSet, LR_DSet, LR_E_CSV, LR_PGrid;

type

  { TfrmRptCuadre }

  TfrmRptCuadre = class(TForm)
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    chexcel: TCheckBox;
    CuadreDS: TDatasource;
    CuadreQRYEMPRESA1: TStringField;
    CuadreQRYENCABEZADO1: TStringField;
    CuadreQRYttotal1: TCurrencyField;
    Datasource1: TDatasource;
    DBGrid1: TDBGrid;
    EDTTOTAL: TEdit;
    FECHA1: TDateEdit;
    FECHA2: TDateEdit;
    frDBDataSet1: TfrDBDataSet;
    frmVcuadre: TfrDBDataSet;
    CuadreQRYCODIGO: TIBStringField;
    CuadreQRYDESCRIPCION: TIBStringField;
    CuadreQRYOBSERVACION: TIBStringField;
    CuadreQRYTOTAL: TIBBCDField;
    CuadreQRY: TIBQuery;
    rptresumen: TfrReport;
    rpt: TfrReport;
    VCuadreQRY: TIBQuery;
    SPPIVOTE: TIBStoredProc;
    IBQuery2: TIBQuery;
    Label1: TLabel;
    rgReporte: TRadioGroup;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    btnprint: TSpeedButton;
    Dguardar: TSaveDialog;
    VCuadreQRYBODEGA: TIntegerField;
    VCuadreQRYFECHA: TDateField;
    VCuadreQRYIMPORTE: TIBBCDField;
    VCuadreQRYNOMBRE: TIBStringField;
    VCuadreQRYTIPO: TIBStringField;
    VCuadreQRYTIPOR: TIBStringField;
    VCuadreQRYtotal1: TFloatField;
    VCuadreQRYVEND: TIBStringField;
    procedure btnprintClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CuadreQRYCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure frmVcuadreCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure Panel1Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure rgReporteChangeBounds(Sender: TObject);
    procedure rgReporteClick(Sender: TObject);
    procedure VCuadreQRYCalcFields(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  frmRptCuadre: TfrmRptCuadre;

implementation

USES Pickdate,liqDM,claseaexcel;

{ TfrmRptCuadre }

procedure TfrmRptCuadre.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmRptCuadre.btnprintClick(Sender: TObject);
   VAR
   SQL:STRING;
   total:currency;
   exportar: TAExcel;
begin

  if rgReporte.ItemIndex =0 then
  rpt.ShowReport
  else
  begin


    ShortDateFormat := 'MM/DD/YY';

    vCuadreQry.close;
    vCuadreQRY.params[0].value :=datetostr(fecha1.date);
    vCuadreQRY.params[1].value :=datetostr(fecha2.date);
    vCuadreQry.Open;

    rptresumen.ShowReport ;

    shortdateformat:='DD/MM/YY';

    if not chexcel.Checked then exit;

    if MessageDlg('Exportar a EXCEL ...?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin

    try
          exportar := TAExcel.Create();
          exportar.mDataset := VCuadreQRY;
          if Dguardar.Execute then
          exportar.nombre:=Dguardar.FileName
          else
          exportar.nombre:=  ExtractFilePath( Application.ExeName ) + 'ventas.xls' ;
          exportar.exportar;
     finally
          exportar.Free;

     end;
    end;

   exit;






    sql := 'SELECT QUERYFINAL from CREARPIVOTE(''LIQ_REMESA_VEND'',''nombre,fecha'',''tipo'',''importe'','' fecha between '''''+
    datetostr(fecha1.date)+''''' and '''''+datetostr(fecha2.date)+''''''+''' )' ;

  {
    MEMO1.Lines.Clear;
    MEMO1.Lines.Add(SQL);
   }
    dm.MyQry.Close;
    dm.MyQry.SQL.Clear;
    dm.MyQry.SQL.Add(sql);
    dm.MyQry.Open;

    if dm.MyQry.IsEmpty then exit;

    sql := dm.MyQry.Fields[0].value;

   { SPPIVOTE.Close;
    SPPIVOTE.Params[0].VALUE := 'LIQ_REMESA_VEND';
    SPPIVOTE.Params[1].VALUE := 'nombre,fecha';
    SPPIVOTE.Params[2].VALUE := 'tipo';
    SPPIVOTE.Params[3].VALUE := 'importe';
    SPPIVOTE.Params[4].VALUE := ' fecha between '''+datetostr(fecha1.date)+''' and '''+datetostr(fecha2.date)+'''';
    sppivote.ExecProc;

    MEMO1.Lines.Clear;
    MEMO1.Lines.Add(sppivote.Params[5].AsString);  }

    //EXIT;

    {SQL := 'SELECT M.fecha,M.codigo no_liquid,Em.nombre,a.CODIGO,fp.descripcion,a.OBSERVACION,sum(a.monto) AS TOTAL FROM LIQUIDACION_DET a '+
    ' inner join liquidacionm m on (a.PLULIQUIDACION=m.pluliquidacion) '+
    ' inner join forma_pago fp on (a.codigo=fp.codigo) '+
    ' inner join empleados em on (m.pluvendedor=em.pluempleados) '+
    ' where m.fecha between '''+datetostr(fecha1.date)+''' and '''+datetostr(fecha2.date)+''' and '+
    ' m.post=''T''  group by M.fecha,M.codigo,em.nombre,m.pluvendedor,a.codigo,fp.descripcion,a.observacion'+
    ' having sum(a.monto)>0 order by 1,2 ';   }

    vCuadreQry.close;
    vCuadreQRY.SQL.Clear;
    vCuadreQRY.SQL.Add(sql);
    vCuadreQry.Open;

    total := 0;

   { while not vCuadreQry.EOF do
    begin

       total := total + vCuadreQrytotal.Value;

       vCuadreQRY.Next;

    end;  }




  end;

end;

procedure TfrmRptCuadre.BitBtn4Click(Sender: TObject);
VAR
SQL:STRING;
total:currency;
begin


    ShortDateFormat := 'MM/DD/YY';

    SQL := 'SELECT a.tipo,m.fecha,a.CODIGO,fp.descripcion,a.OBSERVACION,sum(a.monto) AS TOTAL FROM LIQUIDACION_DET a '+
    ' inner join liquidacionm m on (a.PLULIQUIDACION=m.pluliquidacion) '+
    ' inner join forma_pago fp on (a.codigo=fp.codigo) '+
    ' where m.fecha between '''+datetostr(fecha1.date)+''' and '''+datetostr(fecha2.date)+
    ''' and m.pluempresa='+dm.empresaqrypluempresa.asstring+' and '+
    ' m.post=''T''  group by a.tipo,m.fecha,a.codigo,fp.descripcion,a.observacion,m.pluempresa '+
    ' having sum(a.monto)<>0 order by 1,2 ';

   { SELECT CAST(L.FECHA AS DATE) FECHA,E.NOMBRE,FP.DESCRIPCION||'-'||LD.ITEM,SUM(LD.MONTO) MONTO FROM LIQUIDACION_DET LD
INNER JOIN LIQUIDACIONM L ON (LD.PLULIQUIDACION=L.PLULIQUIDACION)
INNER JOIN EMPLEADOS E ON (L.PLUVENDEDOR=E.PLUEMPLEADOS)
inner join FORMA_PAGO FP ON (LD.CODIGO=FP.CODIGO)
GROUP BY CAST(L.FECHA AS DATE),E.NOMBRE,FP.DESCRIPCION||'-'||LD.ITEM
HAVING SUM(LD.MONTO)>0;
    }

    CuadreQry.close;
    CuadreQRY.SQL.Clear;
    CuadreQRY.SQL.Add(sql);
    CuadreQry.Open;

    total := 0;

    while not CuadreQry.EOF do
    begin

       if copy(cuadreqry.FieldByName('descripcion').asstring,1,4)='CAJA' then
       total := total + CuadreQrytotal.Value;

       CuadreQRY.Next;

    end;

    shortdateformat:='DD/MM/YY';

    edtTotal.Text := currtostr(total);

    if CuadreQry.IsEmpty then
    begin
       btnprint.Enabled := false;
       exit;
    end;
       btnprint.Enabled:= true;

end;

procedure TfrmRptCuadre.Button1Click(Sender: TObject);
begin



end;

procedure TfrmRptCuadre.CuadreQRYCalcFields(DataSet: TDataSet);
begin
    shortdateformat:='DD/MM/YY';

    CUADREQRYEMPRESA1.VALUE :=  DM.EMPRESAQRYNOMBRE.VALUE;
    CUADREQRYENCABEZADO1.VALUE := 'CUADRE DE CAJA  DEL  '+DATETOSTR(FECHA1.Date)+
    ' AL '+DATETOSTR(FECHA2.DATE) ;

end;

procedure TfrmRptCuadre.FormCreate(Sender: TObject);
begin
   fecha1.Date:= now;
   fecha2.Date:=now;
end;

procedure TfrmRptCuadre.frmVcuadreCheckEOF(Sender: TObject; var Eof: Boolean);
begin

end;

procedure TfrmRptCuadre.Panel1Click(Sender: TObject);
begin

end;

procedure TfrmRptCuadre.Panel2Click(Sender: TObject);
begin

end;

procedure TfrmRptCuadre.rgReporteChangeBounds(Sender: TObject);
begin

end;

procedure TfrmRptCuadre.rgReporteClick(Sender: TObject);
begin
  if rgreporte.ItemIndex =0 then
      chexcel.Visible := false
      else
      chexcel.Visible := true;
end;

procedure TfrmRptCuadre.VCuadreQRYCalcFields(DataSet: TDataSet);
var
lsql:string;
begin

   ShortDateFormat := 'MM/DD/YY';

   lsql := ' SELECT FECHA,vend,NOMBRE,SUM(IMPORTE) AS TOTAL FROM LIQ_REMESA_VEND '+
   '    WHERE FECHA BETWEEN '''+datetostr(fecha1.date)+''' AND '''+datetostr(fecha1.date)+''' '+
   '   and VEND like '''+VCUADREQRYVEND.ASSTRING+'''  GROUP BY 1,2,3 '+
   '    HAVING SUM(IMPORTE)<>0 ORDER BY 1,2,3 ';

   dm.MYQRY.CLOSE;
   DM.MYQRY.SQL.CLEAR;
   DM.MYQRY.SQL.ADD(LSQL);
   DM.MYQRY.OPEN;

   VCUADREQRYTOTAL1.VALUE:= DM.MYQRY.FIELDBYNAME('TOTAL').VALUE;

   ShortDateFormat := 'DD/MM/YY';
end;


initialization
  {$I liqrptcuadre.lrs}

end.

