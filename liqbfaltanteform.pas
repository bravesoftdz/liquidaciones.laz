unit liqbfaltanteform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBGrids,dbutils,ZDataset,db;

type

  { TliqbFaltantefrm }

  TliqbFaltantefrm = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    FaltanteDS: TDatasource;
    gridFaltante: TDBGrid;
    edtCodigo: TEdit;
    EdtNombre: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    procedure BitBtn1Click(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure EdtNombreChange(Sender: TObject);
    procedure FaltanteDSDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  liqbFaltantefrm: TliqbFaltantefrm;
  outil : TDbutil;

implementation
uses liqdm;

{ TliqbFaltantefrm }

procedure TliqbFaltantefrm.BitBtn1Click(Sender: TObject);
begin

end;

procedure TliqbFaltantefrm.edtCodigoChange(Sender: TObject);
var
qry : tzquery;
begin

  dm.myqry.close;
  dm.myqry.sql.clear;
  dm.myqry.sql.add('select f.fecha,v.nombre,f.monto,f.id from LIQ_FALTANTES f'+
  ' inner join empleados v on (f.pluvendedor=v.pluempleados) '+
  ' where upper(v.codigo) like '''+edtCodigo.Text+'%'''+
  ' order by f.fecha,v.nombre');
  dm.myqry.open;

  faltanteDS.DataSet := dm.myqry;

end;

procedure TliqbFaltantefrm.EdtNombreChange(Sender: TObject);
begin



    dm.MyQry.Close;
  dm.MyQry.SQL.Clear;
  dm.MyQry.SQL.Add('select f.fecha,v.nombre,f.monto,F.ID from LIQ_FALTANTES f'+
  ' inner join empleados v on (f.pluvendedor=v.pluempleados) '+
  ' where upper(v.Nombre) like '''+edtNombre.Text+'%'''+
  ' order by f.fecha,v.nombre    ');
  dm.MyQry.open;

  faltanteDS.DataSet := dm.myqry;
end;

procedure TliqbFaltantefrm.FaltanteDSDataChange(Sender: TObject; Field: TField);
begin

end;

procedure TliqbFaltantefrm.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin

  outil.Free;

end;

procedure TliqbFaltantefrm.FormCreate(Sender: TObject);
begin

  outil := Tdbutil.Create;


end;

procedure TliqbFaltantefrm.FormShow(Sender: TObject);
begin

  dm.MyQry.Close;
  dm.MyQry.SQL.Clear;
  dm.MyQry.SQL.Add('select f.fecha,v.nombre,f.monto,F.ID from LIQ_FALTANTES f'+
  ' inner join empleados v on (f.pluvendedor=v.pluempleados) '+
  ' order by f.fecha desc,v.nombre    ');
  dm.MyQry.open;

  faltanteDS.DataSet := dm.myqry;

end;

procedure TliqbFaltantefrm.Panel1Click(Sender: TObject);
begin

end;

initialization
  {$I liqbfaltanteform.lrs}

end.

