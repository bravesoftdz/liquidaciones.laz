unit liqbvendedorform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, ComCtrls, Buttons, StdCtrls, DbCtrls, DBGrids, LR_Class,
  LR_DBSet, frametools, LCLType, IBQuery,
  IBCustomDataSet;

type

  { Tbvendedorfrm }

  Tbvendedorfrm = class(TForm)
    BtnAceptar: TBitBtn;
    BitBtn2: TBitBtn;
    VendQRY: TIBQuery;
    VendDS: TDatasource;
    DBGrid1: TDBGrid;
    edtCodigo: TEdit;
    EdtNombre: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    VendQRYCODIGO: TIBStringField;
    VendQRYNOMBRE: TIBStringField;
    VendQRYPLUEMPLEADOS: TIntegerField;
    procedure BitBtn2Click(Sender: TObject);
    procedure BtnAceptarClick(Sender: TObject);
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
  bvendedorfrm: Tbvendedorfrm;

implementation

uses liqdm;

{ Tbvendedorfrm }

procedure Tbvendedorfrm.FormShow(Sender: TObject);
begin

   VendQry.Close;
   VendQry.SQL.Clear;
   VendQry.sql.Add('select pluempleados,codigo,nombre from empleados where activo=''T'' and ');
   VendQry.sql.Add('  plusucursal=:plusucursal ');
   VendQry.Params[0].Value:= dm.bodegaqryplubodega.value;
   VendQry.open;

end;

procedure Tbvendedorfrm.edtCodigoChange(Sender: TObject);
begin

   VendQry.Close;
   VendQry.SQL.Clear;
   VendQry.sql.Add('select pluempleados,codigo,nombre from empleados where activo=''T'' and ');
   VendQry.sql.Add('  plusucursal=:plusucursal and UPPER(codigo) like :codigo ');
   VendQry.Params[0].Value:= dm.bodegaqryplubodega.value;
   VendQry.Params[1].Value:= edtcodigo.Text+'%';
   VendQry.open;


end;

procedure Tbvendedorfrm.BtnAceptarClick(Sender: TObject);
begin

         {dm.MSucursalMQRYCVEND.Value := vendqrycodigo.value;
         ModalResult := mrOk;  }

end;

procedure Tbvendedorfrm.BitBtn2Click(Sender: TObject);
begin

end;

procedure Tbvendedorfrm.DBGrid1DblClick(Sender: TObject);
begin
  BtnAceptar.Click;
end;

procedure Tbvendedorfrm.EdtNombreChange(Sender: TObject);
begin

   VendQry.Close;
   VendQry.SQL.Clear;
   VendQry.sql.Add('select pluempleados,codigo,nombre from empleados where activo=''T'' and ');
   VendQry.sql.Add('  plusucursal=:plusucursal and UPPER(nombre) like :codigo ');
   VendQry.Params[0].Value:= dm.bodegaqryplubodega.value;
   VendQry.Params[1].Value:= edtNombre.Text+'%';
   VendQry.open;

end;

initialization
  {$I liqbvendedorform.lrs}

end.

