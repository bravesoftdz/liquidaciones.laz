unit liqbsuperform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DBGrids, IBQuery, IBCustomDataSet;

type

  { TFrmBSuper }

  TFrmBSuper = class(TForm)
    bsuperQRYCODIGO: TIntegerField;
    bsuperQRYNOMBRE: TIBStringField;
    bsuperQRYPLUSUPERVISOR: TIntegerField;
    Btnaceptar: TBitBtn;
    BitBtn2: TBitBtn;
    BSuperDS: TDatasource;
    DBGrid1: TDBGrid;
    edtCodigo: TEdit;
    EdtNombre: TEdit;
    bsuperQRY: TIBQuery;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    procedure BtnaceptarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure EdtNombreChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  FrmBSuper: TFrmBSuper;

implementation

uses liqDM;

{ TFrmBSuper }

procedure TFrmBSuper.edtCodigoChange(Sender: TObject);
begin

   BSuperQry.Close;
   BSuperQry.SQL.Clear;
   BSuperQry.sql.Add('select plusupervisor,codigo,nombre from supervisores where activo=''T'' and ');
   BSuperQry.sql.Add('  plubodega=:plubodega and codigo like :codigo ');
   BSuperQry.Params[0].Value:= dm.bodegaqryplubodega.value;
   BSuperQry.Params[1].Value:= edtcodigo.Text+'%';
   BSuperQry.open;

end;

procedure TFrmBSuper.BtnaceptarClick(Sender: TObject);
begin

end;

procedure TFrmBSuper.DBGrid1DblClick(Sender: TObject);
begin
   btnaceptar.Click;
end;

procedure TFrmBSuper.EdtNombreChange(Sender: TObject);
begin

   BSuperQry.Close;
   BSuperQry.SQL.Clear;
   BSuperQry.sql.Add('select plusupervisor,codigo,nombre from supervisores where activo=''T'' and ');
   BSuperQry.sql.Add('  plubodega=:plubodega and nombre like :nombre ');
   BSuperQry.Params[0].Value:= dm.bodegaqryplubodega.value;
   BSuperQry.Params[1].Value:= edtNombre.Text+'%';
   BSuperQry.open;

end;

procedure TFrmBSuper.FormShow(Sender: TObject);
begin

   BSuperQry.Close;
   BSuperQry.SQL.Clear;
   BSuperQry.sql.Add('select plusupervisor,codigo,nombre from supervisores where activo=''T'' and ');
   BSuperQry.sql.Add('  plubodega=:plubodega ORDER BY NOMBRE ');
   BSuperQry.Params[0].Value:= dm.bodegaqryplubodega.value;
   BSuperQry.open;
end;

initialization
  {$I liqbsuperform.lrs}

end.

