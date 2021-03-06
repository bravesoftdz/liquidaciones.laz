{//*******************************************
//***  programa procesos del sistema
//***  Autor: Noe Acosta
//***  Ultima Modificacion : Noe
       27-6-2010
       New Funcion procesar inv_reservas,
       New Funcion max item tabla reservas
//*******************************************}
unit procesos;

{$MODE Delphi}

interface

 {$IFDEF UNIX}
    Uses  SysUtils, StdCtrls, Dialogs, Forms, ExtCtrls,inifiles,registry,unix ;
  {$ELSE}
     Uses  SysUtils, StdCtrls, Dialogs, Forms, ExtCtrls,inifiles,registry,windows ;
   {$ENDIF}


 //  Uses  SysUtils, StdCtrls, Dialogs, Forms, ExtCtrls,inifiles,registry,unix ;

procedure Guardar_INI(db:string;reportes:string;Ult_user:string;server:string);
function Leer_Ini:boolean;
function mes(datevalue:tdatetime):string;
function ayo(datevalue:tdatetime):string;
 // function opcion1(opcion:integer;pluperfil:integer):string;
function K_Existencia(pluproducto:integer;plubodega:integer):integer;
function RoundD(x: Extended; d: Integer):Extended;
function fecha2(datevalue:tdatetime):tdatetime;
//  function MaxItem(pluproducto:integer;plubodega:integer;TIPO:STRING):integer;
function replicate(a:string; n:integer):String;
function l_mes(mes:integer):string;
//funcion que guarda registro en tabla de reservas, retorna true si no hay error
function procesar_reserva(Transaccion:string;pluproducto:integer;fecha:Tdatetime;referencia:string;
tipo:string;entrada,salida:currency;observaciones:String;plubodega,pludoc:integer):boolean;
//busco el ultimo item en la tabla de reservas, por producto y bodega(vendedor)
// y es enviado como resultad
function max_item(pluproducto:integer;plubodega,tipo_inv:integer):integer;
function permisos(pluperfil:integer;opcion:integer):string;
//mueve existencias en bodega central
function procesar_inventario(Transaccion:string;pluproducto:integer;fecha:Tdatetime;referencia:string;
tipo:string;entrada,salida:currency;observaciones:String;plubodega,pludoc:integer):boolean;
procedure borrar_inventario(referencia:string;tipo:string;pludoc:integer);
procedure borrar_inv_reserva(referencia:string;tipo:string;pludoc:integer);
procedure actualiza_logliq(id:integer;fec_fin,proceso,dproceso,recalculo,elimino,
ocupado:string);
function insertar_logliq(pluliq,plusuario:integer):integer;
Function GetPcName:String;//devuelve el nombre de la PC

implementation

uses liqmenuform,liqdm,math,dbutils;



Function GetPcName:String;//devuelve el nombre de la PC
var
 buffer :array[0..100] of char;
 size: dword;

begin

 size:=100;
  //   Result := GetHostName;
  {$IFDEF MSWINDOWS}
   if getComputerName(buffer, size) then
    Result:=buffer
   else
    Result:='';
  {$ENDIF MSWINDOWS}
  {$IFDEF UNIX}
   Result := GetHostName;
  {$ENDIF UNIX}

end;



procedure actualiza_logliq(id:integer;fec_fin,proceso,dproceso,recalculo,elimino,
ocupado:string);
var outil:Tdbutil;
lsql,lsql2:string;
begin

 outil :=  Tdbutil.Create;
 lsql := 'update liquidacion_log set ';
 lsql2 := ' where id='+inttostr(id);

 if fec_fin <>'' then
 outil.ExecuteSQL( lsql + ' fecha_fin = '''+fec_fin+''' '+lsql2,false);
 if proceso<>'' then
 outil.ExecuteSQL( lsql + ' proceso = '''+proceso+''' '+lsql2,false);
 if dproceso<>'' then
 outil.ExecuteSQL( lsql + ' dproceso = '''+dproceso+''' '+lsql2,false);
 if recalculo<>'' then
 outil.ExecuteSQL( lsql + ' recalculo = '''+recalculo+''' '+lsql2,false);
 if elimino<>'' then
 outil.ExecuteSQL( lsql + ' elimino = '''+elimino+''' '+lsql2,false);
 if ocupado<>'' then
 outil.ExecuteSQL( lsql + ' ocupado = '''+ocupado+''' '+lsql2,false);

 outil.Free;

end;

function insertar_logliq(pluliq,plusuario:integer):integer;
var
id :integer;
outil:Tdbutil;
lsql :string;
begin

try

 outil :=  Tdbutil.Create;

 dm.MyQry.Close;
 dm.MyQry.SQL.Clear;
 dm.MyQry.SQL.Add('select max(id) id from liquidacion_log ');
 dm.MyQry.Open;

 if dm.MyQry.FieldByName('id').IsNull then
 id := 1
 else
 id := dm.MyQry.FieldByName('id').AsInteger + 1 ;

 lsql := ' insert into liquidacion_log(id,pluliquidacion,plusuario,fecha_ini,ocupado)'+
 ' values ('+inttostr(id)+','+inttostr(pluliq)+','+inttostr(plusuario)+','''+datetostr(now)+''',''S'') ';

 outil.ExecuteSQL(lsql,false) ;

 result := id;

except
 on e : exception do
    begin

      //si hay algun error , se deshacen los cambios

         ShowMessage ('Clase de error: ' + e.ClassName + chr(13) + chr(13) +
          'Mensaje del error: ' + e.Message+', Error al Procesar Log...');

      result := 0;
    end;

end;

end;

procedure borrar_inv_reserva(referencia:string;tipo:string;pludoc:integer) ;
var
lsql:string;
begin


  lsql := ' delete from inv_reservas where tipo LIKE '''+tipo+''' and referencia LIKE '''+referencia+''''+
  ' and pludocclientes='+inttostr(pludoc);

  dm.MyQry2.close;
  dm.myqry2.SQL.Clear;
  dm.MyQry2.SQL.Add(lsql);
  dm.MyQry2.ExecSQL;

 { dm.MyQry.close;
  dm.myqry.SQL.Clear;
  dm.MyQry.SQL.Add('commit');
  dm.MyQry.ExecSQL;
  }

end;

procedure borrar_inventario(referencia:string;tipo:string;pludoc:integer) ;
var
lsql:string;
begin

  lsql := 'delete from inventario where tipo like '''+tipo+''' and referencia like '''+referencia+''''+
  ' and plumovinv='+inttostr(pludoc);

  dm.MyQry2.close;
  dm.myqry2.SQL.Clear;
  dm.MyQry2.SQL.Add(lsql);
  dm.MyQry2.ExecSQL;

 { dm.MyQry.close;
  dm.myqry.SQL.Clear;
  dm.MyQry.SQL.Add('commit');
  dm.MyQry.ExecSQL;
  }

end;

function permisos(pluperfil:integer;opcion:integer):string;
begin

dm.autorizaqry.Close;
dm.autorizaqry.Params[0].Value:=pluperfil;
dm.autorizaqry.Params[1].Value:=opcion;//
dm.autorizaqry.Open;

result:=dm.autorizaqryopcion.Value;

end;


function max_item(pluproducto:integer;plubodega,tipo_inv:integer):integer;
var
i:integer;
begin

    if (tipo_inv=1) then
    begin

   dm.myqry.close;
   dm.myqry.sql.clear;
   dm.myqry.sql.add('select max(item) item from inv_reservas where pluproducto=:plup ');
   dm.myqry.sql.add(' and plubodegas=:plubodega ');
   dm.myqry.parambyname('plup').value := pluproducto;
   dm.myqry.parambyname('plubodega').value := plubodega;
   dm.MyQry.Open;


    end
    else
    begin

     dm.myqry.close;
     dm.myqry.sql.clear;
     dm.myqry.sql.add('select max(item) item from inventario where pluproducto=:plup ');
     dm.myqry.sql.add(' and plusucursales=:plubodega ');
     dm.myqry.parambyname('plup').value := pluproducto;
     dm.myqry.parambyname('plubodega').value := plubodega;
     dm.MyQry.Open;


    end;

    if dm.MyQry.FieldByName('item').Value>0 then
      i := dm.MyQry.FieldByName('item').Value +1
      else
      i :=1 ;

      result := i;


end;

function procesar_reserva(Transaccion:string;pluproducto:integer;fecha:Tdatetime;referencia:string;
tipo:string;entrada,salida:currency;observaciones:String;plubodega,pludoc:integer):boolean;
var
proceso:boolean;
item:integer ;
begin

 proceso := true;
 item := max_item(pluproducto,plubodega,1);

 //dm.IBTransInv.Active:=false;
 //dm.IBTransInv.StartTransaction;
 try

 //modificado 20.05.15, cambio dezeos por ibx para manejo de transacciones

 dm.InsResSQL.Close;
 dm.InsResSQL.Params[0].Value :=  item;//item
 dm.InsResSQL.Params[1].Value :=  pluproducto;//pluproducto
 dm.InsResSQL.Params[2].Value :=  fecha;//fecha
 dm.InsResSQL.Params[3].Value :=  referencia;//referencia
 dm.InsResSQL.Params[4].Value :=  tipo;//tipo
 dm.InsResSQL.Params[5].Value :=  0;//reservados--existencia
 dm.InsResSQL.Params[6].Value :=  entrada;//entrada
 dm.InsResSQL.Params[7].Value :=  salida;//salida
 dm.InsResSQL.Params[8].Value :=  observaciones;//obdervaciones
 dm.InsResSQL.Params[9].Value :=  plubodega;//plubodegas-pluvendedor
 dm.InsResSQL.Params[10].Value := pludoc;//plucarga-pludev(plumovsucursal)
 dm.InsResSQL.ExecQuery;

 //dm.IBTransInv.Commit;
  proceso := true;

except
  on e : exception do
    begin

    //dm.IBTransInv.Rollback;

   ShowMessage ('Clase de error: ' + e.ClassName + chr(13) + chr(13) +
          'Mensaje del error: ' + e.Message+', Error al Procesar...');
   proceso := false;

    end;
end;

 result := proceso;

end;

function procesar_inventario(Transaccion:string;pluproducto:integer;fecha:Tdatetime;referencia:string;
tipo:string;entrada,salida:currency;observaciones:String;plubodega,pludoc:integer):boolean;
var
proceso:boolean;
item:integer;
existencia:CURRENCY ;
costop,costoa:currency;
begin

 proceso := true;
 item := max_item(pluproducto,plubodega,2);


 DM.MYQRY.CLOSE;
 DM.MYQRY.SQL.CLEAR;
 DM.MYQRY.SQL.ADD('SELECT COSTOPROMEDIO,COSTOANTERIOR,existencia FROM PRODUCTO WHERE PLUPRODUCTO=:PLUPROD ');
 DM.MYQRY.ParamByName('PLUPROD').VALUE := pluproducto;
 DM.myqry.open;

 if dm.MyQry.fieldbyname('existencia').value>0 then
    existencia := dm.MyQry.fieldbyname('existencia').value
    else
    existencia:=0;

 if dm.MyQry.fieldbyname('costopromedio').value >0 then
    costop:= dm.MyQry.fieldbyname('costopromedio').value
    else
    costop :=0;

 if dm.MyQry.fieldbyname('costoanterior').value >0 then
    costoa:= dm.MyQry.fieldbyname('costoanterior').value
    else
    costoa :=0;

 if ((costoa=0) and (costop > 0)) then
    costoa := costop;

 if ((costop=0) and (costoa > 0)) then
    costop := costoa;

 try

 dm.INVsql.Close;
 dm.INVsql.Params[0].Value  := pluproducto;
 dm.INVsql.Params[1].Value  := item;
 dm.INVsql.Params[2].Value  := fecha;
 dm.INVsql.Params[3].Value  := tipo;
 dm.INVsql.Params[4].Value  := referencia;
 dm.INVsql.Params[5].Value  := existencia+entrada-salida;
 dm.INVsql.Params[6].Value  := entrada;
 dm.INVsql.Params[7].Value  := salida;
 dm.INVsql.Params[8].Value  := entrada*costop;
 dm.INVsql.Params[9].Value  := salida*costop;
 dm.INVsql.Params[10].Value := (existencia+entrada-salida)*costop;
 dm.INVsql.Params[11].Value := costoa;
 dm.INVsql.Params[12].Value := costop;
 dm.INVsql.Params[13].Value := plubodega;
 dm.INVsql.Params[14].Value := observaciones;
 dm.INVsql.Params[15].Value := 0;
 dm.INVsql.Params[16].Value := 0;
 dm.INVsql.Params[17].Value := pludoc;
 dm.INVsql.Params[18].Value := 'LIQUIDACION';
 dm.INVsql.Params[19].Value := DM.UserQRYUSUARIO.Value;
 dm.INVsql.Params[20].Value := NOW;
 dm.INVsql.Params[21].Value := 0;
 dm.INVsql.ExecQuery;


 proceso := true;

except
  on e : exception do
    begin

   ShowMessage ('Clase de error: ' + e.ClassName + chr(13) + chr(13) +
          'Mensaje del error: ' + e.Message+', Error al Procesar INVENTARIO...');
   proceso := false;

    end;
 end;

 result := proceso;

end;

function l_mes(mes:integer):string;
var I:INTEGER;
begin
i:=mes;
case i of
1    :
begin result:='Enero' end;
2    :
begin result:='Febrero' end;
3    :
begin result:='Marzo' end;
4    :
begin result:='Abril' end;
5    :
begin result:='Mayo' end;
6    :
begin result:='Junio' end;
7    :
begin result:='Julio' end;
8    :
begin result:='Agosto' end;
9    :
begin result:='Septiembre' end;
10   :
begin result:='Octubre' end;
11   :
begin result:='Noviembre' end;
12   :
begin result:='Diciembre' end;

END;

end;


function replicate(a:string; n:integer):String;
var
iContador:integer;
sTemporal:string;
begin
sTemporal:='';
for icontador:=1 to n do
begin sTemporal:=sTemporal+a end;

Result:=sTemporal;
end;

{function MaxItem(pluproducto:integer;plubodega:integer;TIPO:STRING):integer;
begin

DM.MaxItemSP.Close;
DM.MaxItemSP.params[0].value:=pluproducto;
DM.MaxItemSP.params[1].value:=plubodega;
DM.MaxItemSP.params[2].value:=TIPO;
DM.MaxItemSP.execproc;

Result:=DM.MaxItemSP.params[3].value;

end; }

function fecha2(datevalue:tdatetime):tdatetime;
Var
Year, Month, Day: Word;
Begin

DecodeDate(DateValue, Year, Month, Day);

result:=encodedate(year,month,day);

end;


function RoundD(x: Extended; d: Integer):Extended;
var
n:Extended;
begin
n:=IntPower(10,d);
x:=x*n;
Result:=(Int(x)+Int(Frac(x)*2))/n;
end;


//existencia en kardex
function K_Existencia(pluproducto:integer;plubodega:integer):integer;
var
existencia,i:integer;
begin

    dm.myqry.Close;
    dm.myqry.SQL.Clear;
    dm.myqry.SQL.Add('select existencia-(reservado+remitidos) as exist from producto where pluproducto='+inttostr(pluproducto)+'');
    dm.myqry.Open;

    if dm.MyQry.FieldByName('exist').Value>0 then
      i := dm.MyQry.FieldByName('exist').Value +1
      else
      i :=0 ;

    Result := i;

end;


{function opcion1(opcion:integer;pluperfil:integer):string;
begin

dm.autorizaqry.Close;
dm.autorizaqry.Params[0].Value:=pluperfil;
dm.autorizaqry.Params[1].Value:=opcion;//
dm.autorizaqry.Open;

result:=dm.autorizaqry.fieldbyname('opcion').Value;

end;}

{
Function GetPcName:String;//devuelve el nombre de la PC
var
 buffer :array[0..100] of char;
 size: dword;
begin

 size:=100;
 if getComputerName(buffer, size) then
     Result:=buffer
 else
     Result:='';

end;}

function mes(datevalue:tdatetime):string;
Var
Year, Month, Day: Word;
mes1:integer;
Begin

DecodeDate(DateValue, Year, Month, Day);
mes1:=month;
result:=inttostr(mes1);

end;
function ayo(datevalue:tdatetime):string;
Var
Year, Month, Day: Word;
ayo1:integer;
Begin

DecodeDate(DateValue, Year, Month, Day);
ayo1:=year;
result:=inttostr(ayo1);

end;


function Leer_Ini:boolean;
var
resultado :boolean;
begin

  /// verifica sino existe el archivo ini, sino lo crea con los parametros
  ///default
    if  FileExists( ChangeFileExt(ParamStr(0),'.ini')) = false then
    BEGIN

    Guardar_Ini('C:\liquidaciones\datos\liquidaciones.gdb','c:\liquidaciones\REPORTES\','admin','localhost');
    showmessage('Debe Revisar el Archivo Ini del sistema!!');
    menufrm.close;

    resultado := false;

    END
    ELSE
    BEGIN


  ///  si existe el ini lee el contenido!!
with TIniFile.Create(ChangeFileExt(ParamStr(0),'.ini')) do
begin try

GSSERVER    := ReadString('LOCALIZACION','Server','localhost');
GSBD        := ReadString('LOCALIZACION','Base de Datos','C:\liquidaciones\datos\liquidaciones.gdb');
GSREPORTES  := ReadString('LOCALIZACION','Reportes','C:\liquidaciones\REPORTES\');
GSLASTUSER  := ReadString('CONFIGURACION','Usuario','admin');
GNSUCURSAL  := ReadInteger('CONFIGURACION','Sucursal',1);
GTES        := ReadString('CONFIGURACION','Tes','N');

            if GNSUCURSAL = 1  then
             serverClave := 'masteregno082013$$'
             else
             serverClave := 'masterkey';

finally
Free;
end end;


resultado := true;

END;
result := resultado;

end;

procedure Guardar_INI(db:string;reportes:string;Ult_user:string;server:string);
begin

with TIniFile.Create(ChangeFileExt(ParamStr(0),'.ini')) do
begin try

WriteString('LOCALIZACION','Server',server);
WriteString('LOCALIZACION','Base de Datos',db);
WriteString('LOCALIZACION','Reportes',reportes);
WriteString('CONFIGURACION','Usuario','admin');
WriteInteger('CONFIGURACION','Sucursal',1);

finally
Free;

end end;
end;


end.
