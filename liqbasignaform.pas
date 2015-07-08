unit liqbasignaform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DBGrids, EditBtn,  LCLType,
  IBQuery, IBCustomDataSet;

type

  { Tliqbasignafrm }

  Tliqbasignafrm = class(TForm)
    BitBtn5: TBitBtn;
    bmsucqryCODIGO: TIntegerField;
    bmsucqryCVEND: TIBStringField;
    bmsucqryestatus: TStringField;
    bmsucqryFECHA: TDateTimeField;
    bmsucqryNOMBRE: TIBStringField;
    bmsucqryOBSERVACIONES: TIBStringField;
    bmsucqryPLULIQUIDACION: TIntegerField;
    bmsucqryPLUMOVSUCURSAL: TIntegerField;
    bmsucqryPOST: TIBStringField;
    bmsucqryTIPO: TIBStringField;
    btnSeleccion: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BMSUCURSALDS: TDatasource;
    DBGrid1: TDBGrid;
    EDTTIPO: TEdit;
    edtCodigo: TEdit;
    EdtNombre: TEdit;
    FECHA1: TDateEdit;
    bmsucqry: TIBQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure bmsucqryCalcFields(DataSet: TDataSet);
    procedure btnSeleccionClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: char);
    procedure EdtNombreChange(Sender: TObject);
    procedure EdtNombreKeyPress(Sender: TObject; var Key: char);
    procedure FECHA1AcceptDate(Sender: TObject; var ADate: TDateTime;
      var AcceptDate: Boolean);
    procedure FECHA1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    procedure Buscar;
  public
    { public declarations }
  end; 

var
  liqbasignafrm: Tliqbasignafrm;

implementation

uses liqdm,
procesos,LIQMENUFORM;

{ Tliqbasignafrm }

procedure Tliqbasignafrm.BitBtn3Click(Sender: TObject);
begin

  bmsucqry.Close;
  bmsucqry.SQL.Clear;
  bmsucqry.SQL.Add(' SELECT a.plumovsucursal,a.fecha,a.codigo,a.post,a.observaciones,');
  bmsucqry.SQL.Add(' b.codigo as cvend,b.nombre,a.pluliquidacion FROM MOV_SUCURSALM a ');
  bmsucqry.SQL.Add(' inner join empleados b on (a.pluempleados=b.pluempleados) ');
  bmsucqry.SQL.Add(' WHERE a.PLUEMPRESA=:pluempresa AND a.PLUSUCURSAL=:PLUSUCURSAL ');
  bmsucqry.SQL.Add(' AND A.TIPO=:EDTTIPO and A.POST=''T'' ');
  bmsucqry.SQL.Add(' and extract(month from a.fecha)=:mes and extract(year from a.fecha)=:ayo');
  bmsucqry.SQL.Add('  ORDER BY A.FECHA DESC ');
  bmsucqry.parambyname('pluempresa').value := dm.empresaqrypluempresa.value;
  bmsucqry.parambyname('plusucursal').value := dm.bodegaqryplubodega.value;
  bmsucqry.parambyname('EDTTIPO').value := EDTTIPO.Text;
  bmsucqry.parambyname('mes').value := strtoint(mes(now));
  bmsucqry.parambyname('ayo').value := strtoint(ayo(now));
  bmsucqry.open;


end;

procedure Tliqbasignafrm.BitBtn4Click(Sender: TObject);
begin
  bmsucqry.Close;
  bmsucqry.SQL.Clear;
  bmsucqry.SQL.Add(' SELECT a.plumovsucursal,a.fecha,a.codigo,a.post,a.observaciones,');
  bmsucqry.SQL.Add(' b.codigo as cvend,b.nombre,a.pluliquidacion FROM MOV_SUCURSALM a ');
  bmsucqry.SQL.Add(' inner join empleados b on (a.pluempleados=b.pluempleados) ');
  bmsucqry.SQL.Add(' WHERE a.PLUEMPRESA=:pluempresa AND a.PLUSUCURSAL=:PLUSUCURSAL ');
  bmsucqry.SQL.Add(' AND A.TIPO=:EDTTIPO and A.POST=''F'' ');
  bmsucqry.SQL.Add(' and extract(month from a.fecha)=:mes and extract(year from a.fecha)=:ayo');
  bmsucqry.SQL.Add('  ORDER BY A.FECHA DESC ');
  bmsucqry.parambyname('pluempresa').value := dm.empresaqrypluempresa.value;
  bmsucqry.parambyname('plusucursal').value := dm.bodegaqryplubodega.value;
  bmsucqry.parambyname('EDTTIPO').value := EDTTIPO.Text;
  bmsucqry.parambyname('mes').value := strtoint(mes(now));
  bmsucqry.parambyname('ayo').value := strtoint(ayo(now));
  bmsucqry.open;

end;

procedure Tliqbasignafrm.BitBtn5Click(Sender: TObject);
begin

  bmsucqry.Close;
  bmsucqry.SQL.Clear;
  bmsucqry.SQL.Add(' SELECT A.TIPO,a.plumovsucursal,a.fecha,a.codigo,a.post,a.observaciones,');
  bmsucqry.SQL.Add(' b.codigo as cvend,b.nombre,a.pluliquidacion FROM MOV_SUCURSALM a ');
  bmsucqry.SQL.Add(' inner join empleados b on (a.pluempleados=b.pluempleados) ');
  bmsucqry.SQL.Add(' WHERE a.PLUEMPRESA=:pluempresa AND a.PLUSUCURSAL=:PLUSUCURSAL ');
  bmsucqry.SQL.Add(' AND A.TIPO=:EDTTIPO  ');
  bmsucqry.SQL.Add(' and extract(month from a.fecha)=:mes and extract(year from a.fecha)=:ayo');
  bmsucqry.SQL.Add('  ORDER BY A.FECHA DESC ');
  bmsucqry.parambyname('pluempresa').value := dm.empresaqrypluempresa.value;
  bmsucqry.parambyname('plusucursal').value := dm.bodegaqryplubodega.value;
  bmsucqry.parambyname('EDTTIPO').value := EDTTIPO.Text;
  bmsucqry.parambyname('mes').value := strtoint(mes(now));
  bmsucqry.parambyname('ayo').value := strtoint(ayo(now));
  bmsucqry.open;

 // SHOWMESSAGE(EDTTIPO.Text);

end;

procedure Tliqbasignafrm.bmsucqryCalcFields(DataSet: TDataSet);
begin
  if bmsucqrypost.Value ='T' then
     bmsucqryestatus.Value := '***PROCESADO'
     else
     bmsucqryestatus.Value := '**SIN PROCESAR';

     if bmsucqrypluliquidacion.value >0 then
        bmsucqryestatus.Value := '***LIQUIDADO';

end;

procedure Tliqbasignafrm.btnSeleccionClick(Sender: TObject);
begin
   GBAVENDEDOR := EdtNombre.TEXT;
   GBACODIGO := EDTCODIGO.Text;
end;

procedure Tliqbasignafrm.DBGrid1DblClick(Sender: TObject);
begin
  btnSeleccion.click;
end;

procedure Tliqbasignafrm.edtCodigoChange(Sender: TObject);
begin

   buscar;


end;

procedure Tliqbasignafrm.edtCodigoKeyPress(Sender: TObject; var Key: char);
begin
      if ( key = Char(VK_RETURN) ) then
    begin
        edtNombre.Text:='';
        Buscar;

    end;
end;

procedure Tliqbasignafrm.Buscar;
VAR
SQL:STRING;
begin

     SQL := 'SELECT a.plumovsucursal,a.fecha,a.codigo,a.post,a.observaciones,'+
     ' b.codigo as cvend,b.nombre,a.pluliquidacion FROM MOV_SUCURSALM a '+
     ' inner join empleados b on (a.pluempleados=b.pluempleados) '+
     ' WHERE a.PLUEMPRESA='+dm.empresaqrypluempresa.asstring+' AND a.PLUSUCURSAL='+
     dm.bodegaqryplubodega.AsString+' AND A.TIPO='''+edttipo.Text+''' ';

     if edtCodigo.Text<>'' then
        SQL := SQL + ' and (upper(A.codigo) like '''+EDTCODIGO.Text+'%'' ) ORDER BY A.FECHA DESC '
      else if edtNombre.Text<>'' then
        SQL := SQL + ' and  (upper(B.NOMBRE) like '''+EDTNOMBRE.Text+'%'' ) ORDER BY A.FECHA DESC ';

    bmsucqry.Close;
    bmsucqry.SQL.Clear;
    bmsucqry.SQL.Add(SQL);
    bmsucqry.Open;

end;

procedure Tliqbasignafrm.EdtNombreChange(Sender: TObject);
begin



end;

procedure Tliqbasignafrm.EdtNombreKeyPress(Sender: TObject; var Key: char);
begin

    if ( key = Char(VK_RETURN) ) then
    begin
        EdtCodigo.Text:='';
        Buscar;

    end;
end;

procedure Tliqbasignafrm.FECHA1AcceptDate(Sender: TObject;
  var ADate: TDateTime; var AcceptDate: Boolean);
  VAR
SQL:STRING;
begin


   ShortDateFormat := 'MM/DD/YY';
   //fecha1.date

    SQL := 'SELECT a.plumovsucursal,a.fecha,a.codigo,a.post,a.observaciones,'+
   ' b.codigo as cvend,b.nombre,a.pluliquidacion FROM MOV_SUCURSALM a '+
   ' inner join empleados b on (a.pluempleados=b.pluempleados) '+
   ' WHERE a.PLUEMPRESA='+dm.empresaqrypluempresa.asstring+' AND a.PLUSUCURSAL='+
    dm.bodegaqryplubodega.AsString+' AND A.TIPO='''+edttipo.Text+''' and '+
    ' a.FECHA= '''+datetostr(ADAte)+'''';

   bmsucqry.Close;
   bmsucqry.SQL.Clear;
   bmsucqry.SQL.Add(sql);
   bmsucqry.open;

   ShortDateFormat := 'DD/MM/YY';
end;

procedure Tliqbasignafrm.FECHA1Change(Sender: TObject);
VAR
SQL:STRING;
begin


   ShortDateFormat := 'MM/DD/YY';

    SQL := 'SELECT a.plumovsucursal,a.fecha,a.codigo,a.post,a.observaciones,'+
   ' b.codigo as cvend,b.nombre,a.pluliquidacion FROM MOV_SUCURSALM a '+
   ' inner join empleados b on (a.pluempleados=b.pluempleados) '+
   ' WHERE a.PLUEMPRESA='+dm.empresaqrypluempresa.asstring+' AND a.PLUSUCURSAL='+
    dm.bodegaqryplubodega.AsString+' AND A.TIPO='''+edttipo.Text+''' and '+
    ' a.FECHA= '''+datetostr(fecha1.date)+'''';

   bmsucqry.Close;
   bmsucqry.SQL.Clear;
   bmsucqry.SQL.Add(sql);
   bmsucqry.open;

   ShortDateFormat := 'DD/MM/YY';


end;

procedure Tliqbasignafrm.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
   ShortDateFormat := 'dd/mm/YY';
end;

procedure Tliqbasignafrm.FormShow(Sender: TObject);
begin

    fecha1.Date := date();
    IF EDTTIPO.Text = 'CAR' THEN
       CAPTION := 'Busqueda de Asignaciones'
    else IF EDTTIPO.Text = 'DEV' THEN
       CAPTION := 'Busqueda de Devoluciones'
    else IF EDTTIPO.Text = 'TRA' THEN
       CAPTION := 'Busqueda de Traslados';

    IF GBACODIGO <> '' THEN
    begin

       edtCodigo.Text := GBACODIGO;
       edtNombre.Text := '';
       Buscar;

    end;

    if GBAVENDEDOR <> '' then
    begin

       edtCodigo.Text := '';
       edtNombre.Text := GBAVENDEDOR;
       Buscar;

    end;


end;

procedure Tliqbasignafrm.SpeedButton1Click(Sender: TObject);
VAR
SQL:STRING;
total:currency;
begin


   ShortDateFormat := 'MM/DD/YY';

    SQL := 'SELECT a.plumovsucursal,a.fecha,a.codigo,a.post,a.observaciones,'+
   ' b.codigo as cvend,b.nombre,a.pluliquidacion FROM MOV_SUCURSALM a '+
   ' inner join empleados b on (a.pluempleados=b.pluempleados) '+
   ' WHERE a.PLUEMPRESA='+dm.empresaqrypluempresa.asstring+' AND a.PLUSUCURSAL='+
    dm.bodegaqryplubodega.AsString+' AND A.TIPO='''+edttipo.Text+''' and '+
    ' a.FECHA= '''+datetostr(fecha1.date)+''' ORDER BY A.FECHA DESC ';

   bmsucqry.Close;
   bmsucqry.SQL.Clear;
   bmsucqry.SQL.Add(sql);
   bmsucqry.open;

   ShortDateFormat := 'DD/MM/YY';

end;

initialization
  {$I liqbasignaform.lrs}

end.

