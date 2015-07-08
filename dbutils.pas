unit DBUtils;

{$mode objfpc}{$H+}

interface


uses DB, sysutils,IBDatabase, IBQuery;

type TValueName = class(TObject)
private
  id : String;
  inOut : TParamType;
  value : Variant;
  fieldType : TFieldType;
public
  property SetId : String Write id;
  property SetValue : Variant Write value;
  property SetInOut : TParamType Write inOut;
  property SetFieldType : TFieldType Write fieldType;
  //
  property GetId : String Read id;
  property GetValue : Variant Read value;
  property GetType : TParamType Read inOut;
  property GetFieldType : TFieldType Read fieldType;
end;

type TParametros = array of TValueName;

type TDBUtil = class(TObject)
  function  ExecuteIntScalar(pSelect : String) : Integer;
  function  ExecuteStringEscalar(pSelect : String) : String;
  procedure ExecuteSQL(pStatement : String; pDoCommit : Boolean);
  function  GetDatos(pStatement : String) : Tibquery;
  procedure ExecuteSQLWithParams(pStatement : String; var pParametros : TParametros);
  function  ValidaLiq(pluvendedor:integer;fecha:tdatetime):boolean;
end;

implementation

uses liqdm;

{ TDBUtil }

function TDBUtil.ValidaLiq(pluvendedor:integer;fecha:tdatetime):boolean;
begin

  //AND POST=''T''
   ShortDateFormat := 'MM/DD/YY';

   if ExecuteIntScalar('select count(*) cnt from LIQUIDACIONM WHERE '+
   ' PLUVENDEDOR='+inttostr(PLUVENDEDOR)+' AND CAST(FECHA AS DATE)= CAST('''+DATETOSTR(FECHA)+''' AS DATE)   ')>0 THEN
     RESULT := TRUE
     ELSE
     RESULT := FALSE;

  ShortDateFormat := 'DD/MM/YY';

end;



function TDBUtil.ExecuteIntScalar(pSelect: String): Integer;
var qry : TIBQuery;
begin
try
  qry := TIBQuery.Create(nil);
  qry.database := dm.fbDB;
  with qry do begin
    sql.Clear;
    sql.add(pSelect);
    Active := true;
    if not eof then
       result := Fields.Fields[0].AsInteger
    else
       result := -1;
  end;
finally
  qry.Free;
end;
end;

procedure TDBUtil.ExecuteSQL(pStatement: String; pDoCommit : Boolean);
var qry : Tibquery;
begin

try
  qry :=  Tibquery.Create(nil);
  qry.database := dm.fbDB;
  with qry do begin
    sql.Clear;
    sql.add(pStatement);
    qry.ExecSQL();
    If(pDoCommit)Then
    Begin
      sql.Clear;
      sql.add('commit');
      qry.ExecSQL();
    End;
  end;
finally
  qry.Free;
end;


end;

procedure TDBUtil.ExecuteSQLWithParams(pStatement: String; var pParametros : TParametros);
var qry : Tibquery;
    i : Integer;
    val : String;
    param : TParam;
begin
try
  qry := Tibquery.Create(nil);
  qry.database := dm.fbDB;
  with qry do begin
    sql.Clear;
    sql.add(pStatement);
    qry.Params.Clear;
    //
    qry.ParamCheck := true;
    qry.Params.ParseSQL(pStatement, true);
//    qry.PrepareStatement;
    for i := 0 to Length(pParametros)-1 do begin
        param := TParam.Create(qry.Params, pParametros[i].GetType);
        qry.Params[i].Name := pParametros[i].GetId;
        qry.Params[i].Value := pParametros[i].GetValue;
        qry.Params[i].DataType := pParametros[i].GetFieldType;
        //
    end;
    //
    ExecSQL;
  end;
finally
  qry.Free;
end;
end;

function TDBUtil.ExecuteStringEscalar(pSelect: String): String;
var qry : Tibquery;
begin
try
  qry := Tibquery.Create(nil);
  qry.database := dm.fbDB;
  with qry do begin
    sql.Clear;
    sql.add(pSelect);
    Active := true;
    if not eof then
       result := Fields.Fields[0].AsString
    else
       result := '';
  end;
finally
  qry.Free;
end;
end;

function TDBUtil.GetDatos(pStatement: String): Tibquery;
var qry : Tibquery;
begin
try
  qry := Tibquery.Create(nil);
  qry.database := dm.fbDB;
  with qry do begin
    sql.Clear;
    sql.add(pStatement);
    Active := true;
  end;
  result := qry;
finally
end;
end;

end.


