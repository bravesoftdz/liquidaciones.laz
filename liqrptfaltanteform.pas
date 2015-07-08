unit liqrptFaltanteForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, EditBtn, Buttons, ExtCtrls, ComCtrls, DbCtrls, LR_DBSet, LR_Class,
  frametools, dbutils,  db,IBDatabase, IBQuery;

type

  { TliqrptFaltantefrm }

  TliqrptFaltantefrm = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    btnBuscaVend: TSpeedButton;
    chTodos: TCheckBox;
    Dguardar: TSaveDialog;
    edtCod: TEdit;
    edtNombre: TEdit;
    FECHA1: TDateEdit;
    FECHA2: TDateEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnBuscaVendClick(Sender: TObject);
    procedure chTodosChange(Sender: TObject);
    procedure edtCodChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
  private
    procedure Buscar;
  public
    { public declarations }
  end; 

var
  liqrptFaltantefrm: TliqrptFaltantefrm;
  outil : TDbutil;
  qry,qry2 :tibquery;

implementation

uses Liqbvendedorform,liqdm,claseaexcel;

{ TliqrptFaltantefrm }

procedure TliqrptFaltantefrm.FormCreate(Sender: TObject);
begin

  fecha1.Date:= now;
  fecha2.Date:= now;
  outil := Tdbutil.Create;
  qry := Tibquery.Create(self);
  qry.database := dm.fbdb;



end;

procedure TliqrptFaltantefrm.chTodosChange(Sender: TObject);
begin
     if chtodos.Checked then
     begin
        edtcod.Enabled:= false;
        btnBuscaVend.Enabled:= false;

     end
     else
     begin

       edtcod.Enabled:= true;
       btnBuscaVend.Enabled:= true;


     end;
end;


procedure TliqrptFaltantefrm.edtCodChange(Sender: TObject);
begin
  buscar;
end;

procedure TliqrptFaltantefrm.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin

  outil := Tdbutil.Create;


end;

procedure TliqrptFaltantefrm.BitBtn1Click(Sender: TObject);
VAR
sql:string;
exportar: TAExcel;
begin

    ShortDateFormat := 'MM/DD/YYYY';

    SQL := 'select V.CODIGO,V.NOMBRE ,F.* FROM LIQ_FALTANTES F '+
    ' INNER JOIN EMPLEADOS V ON (F.PLUVENDEDOR=V.PLUEMPLEADOS) '+
    ' where CAST(F.fecha AS DATE) between '''+datetostr(fecha1.date)+''' and '''+datetostr(fecha2.date)+''' ';

    IF NOT CHTODOS.Checked THEN
       SQL := SQL + ' AND V.PLUEMPLEADOS='+QRY.FieldByName('PLUEMPLEADOS').AsString+' ';
       SQL := SQL + ' ORDER BY F.FECHA,V.NOMBRE    ';

      DM.MyQry.Close;
      DM.MyQry.SQL.Clear;
      DM.MyQry.SQL.Add(SQL);
      DM.MyQry.Open;

          exportar := TAExcel.Create();
          exportar.mDataset := DM.MyQry;
          if Dguardar.Execute then
          exportar.nombre:=Dguardar.FileName
          else
          exportar.nombre:=  ExtractFilePath( Application.ExeName ) + 'faltantes.xls' ;
          exportar.exportar;

          exportar.Free;


end;

procedure TliqrptFaltantefrm.btnBuscaVendClick(Sender: TObject);
begin

  edtnombre.Text := '';

  with Tbvendedorfrm.Create(SELF) do
  try

   if ShowModal = mrOk then
    begin

    IF NOT VENDQRY.IsEmpty THEN
    BEGIN

     edtCod.Text := VENDQRYcodigo.VALUE;
     buscar;
    END;

    end;
  finally

  end;


end;

procedure TliqrptFaltantefrm.Buscar;
begin

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add('select pluempleados,codigo,nombre from empleados where codigo like '+
  ''''+edtCod.Text+'%'' order by nombre asc');
  qry.Open;

  edtnombre.Text := qry.FieldByName('nombre').AsString;


end;



procedure TliqrptFaltantefrm.GroupBox1Click(Sender: TObject);
begin

end;

initialization
  {$I liqrptfaltanteform.lrs}

end.

