unit liqbliqform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, fptexexport, FileUtil, LResources, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, StdCtrls, Buttons, DBGrids, LCLType,
  IBQuery, IBCustomDataSet;

type

  { Tliqbliqfrm }

  Tliqbliqfrm = class(TForm)
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BliqDS: TDatasource;
    bliqqryCODIGO: TIntegerField;
    bliqqryCVEND: TIBStringField;
    bliqqryESTATUS1: TStringField;
    bliqqryFECHA: TDateField;
    bliqqryNOMBRE: TIBStringField;
    bliqqryOBSERVACION: TIBStringField;
    bliqqryPLULIQUIDACION: TIntegerField;
    bliqqryPOST: TIBStringField;
    btnSeleccion: TBitBtn;
    DBGrid1: TDBGrid;
    EDTNOMBRE: TEdit;
    edtCodigo: TEdit;
    bliqqry: TIBQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure btnSeleccionClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: char);
    procedure EdtNombreKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
  private
     procedure Buscar;
       public
    { public declarations }
  end; 

var
  liqbliqfrm: Tliqbliqfrm;

implementation

uses
LiqDM,LIQMENUFORM;

{ Tliqbliqfrm }

procedure Tliqbliqfrm.BitBtn5Click(Sender: TObject);
begin

  bliqqry.Close;
  bliqqry.SQL.Clear;
  bliqqry.SQL.Add('SELECT a.PLULIQUIDACION,a.fecha,a.codigo,a.post,a.observacion,'+
  'b.codigo as cvend,b.nombre FROM LIQUIDACIONM a inner join empleados b on (a.pluvendedor=b.pluempleados) '+
  ' WHERE a.PLUEMPRESA=:PLUEMPRESA  AND a.PLUBODEGA=:PLUBODEGA AND a.plusuario=:plus order by a.fecha desc');
  bliqqry.parambyname('pluempresa').value := dm.empresaqrypluempresa.value;
  bliqqry.parambyname('plubodega').value := dm.bodegaqryplubodega.value;
  bliqqry.parambyname('plus').value := dm.UserQRYPLUSUARIO.value;
  bliqqry.Open;

end;


procedure Tliqbliqfrm.btnSeleccionClick(Sender: TObject);
begin
   GBLVENDEDOR := EdtNombre.TEXT;
   GBLCODIGO := EDTCODIGO.Text;
end;

procedure Tliqbliqfrm.DBGrid1DblClick(Sender: TObject);
begin
  btnSeleccion.Click;
end;



procedure Tliqbliqfrm.edtCodigoChange(Sender: TObject);
begin



end;

procedure Tliqbliqfrm.edtCodigoKeyPress(Sender: TObject; var Key: char);
begin
    if ( key = Char(VK_RETURN) ) then
    begin
        edtNombre.Text:='';
        Buscar;

    end;
end;


procedure Tliqbliqfrm.Buscar;
begin

      if edtCodigo.Text<>'' then
      begin

      bliqqry.Close;
      bliqqry.SQL.Clear;
      bliqqry.SQL.Add('SELECT a.PLULIQUIDACION,a.fecha,a.codigo,a.post,a.observacion,'+
      'b.codigo as cvend,b.nombre FROM LIQUIDACIONM a inner join empleados b on (a.pluvendedor=b.pluempleados) '+
      ' WHERE a.PLUEMPRESA=:PLUEMPRESA  AND a.PLUBODEGA=:PLUBODEGA  '+
      ' and upper(a.codigo) like :codigo order by a.fecha desc');
      bliqqry.parambyname('pluempresa').value := dm.empresaqrypluempresa.value;
      bliqqry.parambyname('plubodega').value := dm.bodegaqryplubodega.value;
      bliqqry.parambyname('codigo').value := edtcodigo.Text+'%';
      bliqqry.Open;


      end
      else if edtNombre.Text<>'' then
      begin

      bliqqry.Close;
      bliqqry.SQL.Clear;
      bliqqry.SQL.Add('SELECT a.PLULIQUIDACION,a.fecha,a.codigo,a.post,a.observacion,'+
      'b.codigo as cvend,b.nombre FROM LIQUIDACIONM a inner join empleados b on (a.pluvendedor=b.pluempleados) '+
      ' WHERE a.PLUEMPRESA=:PLUEMPRESA  AND a.PLUBODEGA=:PLUBODEGA  '+
      ' and upper(b.nombre) like :nombre order by a.fecha desc ');
      bliqqry.parambyname('pluempresa').value := dm.empresaqrypluempresa.value;
      bliqqry.parambyname('plubodega').value := dm.bodegaqryplubodega.value;
      bliqqry.parambyname('nombre').value := uppercase(edtNombre.Text)+'%';
      bliqqry.Open;


      end;
end;

procedure Tliqbliqfrm.EdtNombreKeyPress(Sender: TObject; var Key: char);
begin
      if ( key = Char(VK_RETURN) ) then
    begin
        EdtCodigo.Text:='';
        Buscar;

    end;
end;

procedure Tliqbliqfrm.FormShow(Sender: TObject);
begin

    IF GBLCODIGO <> '' THEN
    begin

       edtCodigo.Text := GBLCODIGO;
       edtNombre.Text := '';
       Buscar;

    end;

    if GBLVENDEDOR <> '' then
    begin

       edtCodigo.Text := '';
       edtNombre.Text := GBLVENDEDOR;
       Buscar;

    end;
end;

procedure Tliqbliqfrm.Panel1Click(Sender: TObject);
begin

end;

procedure Tliqbliqfrm.BitBtn3Click(Sender: TObject);
begin

  bliqqry.Close;
  bliqqry.SQL.Clear;
  bliqqry.SQL.Add('SELECT a.PLULIQUIDACION,a.fecha,a.codigo,a.post,a.observacion,'+
  'b.codigo as cvend,b.nombre FROM LIQUIDACIONM a inner join empleados b on (a.pluvendedor=b.pluempleados) '+
  ' WHERE a.PLUEMPRESA=:PLUEMPRESA  AND a.PLUBODEGA=:PLUBODEGA and a.post=''T''  and a.plusuario=:plus order by a.fecha desc');
  bliqqry.parambyname('pluempresa').value := dm.empresaqrypluempresa.value;
  bliqqry.parambyname('plubodega').value := dm.bodegaqryplubodega.value;
  bliqqry.parambyname('plus').value := dm.UserQRYPLUSUARIO.value;
  bliqqry.Open;

end;

procedure Tliqbliqfrm.BitBtn4Click(Sender: TObject);
begin

  bliqqry.Close;
  bliqqry.SQL.Clear;
  bliqqry.SQL.Add('SELECT a.PLULIQUIDACION,a.fecha,a.codigo,a.post,a.observacion,'+
  'b.codigo as cvend,b.nombre FROM LIQUIDACIONM a inner join empleados b on (a.pluvendedor=b.pluempleados) '+
  ' WHERE a.PLUEMPRESA=:PLUEMPRESA  AND a.PLUBODEGA=:PLUBODEGA and a.post=''F'' and plusuario=:plus order by a.fecha desc ');
  bliqqry.parambyname('pluempresa').value := dm.empresaqrypluempresa.value;
  bliqqry.parambyname('plubodega').value := dm.bodegaqryplubodega.value;
  bliqqry.parambyname('plus').value := dm.UserQRYPLUSUARIO.value;
  bliqqry.Open;

end;

initialization
  {$I liqbliqform.lrs}

end.

