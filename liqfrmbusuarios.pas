unit liqfrmBusuarios;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DBGrids, IBQuery, IBCustomDataSet;

type

  { TfrmBusuarios }

  TfrmBusuarios = class(TForm)
    BitBtn2: TBitBtn;
    BtnAceptar: TBitBtn;
    UserQRY: TIBQuery;
    userDS: TDatasource;
    DBGrid1: TDBGrid;
    edtCodigo: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    userQRYACTIVO: TStringField;
    UserQRYCCLAVE: TIBStringField;
    userQRYCLAVE: TStringField;
    UserQRYFECHA_MOD: TDateField;
    UserQRYNOMBRE: TIBStringField;
    userQRYPLUPERFIL: TLongintField;
    userQRYPLUSUARIO: TLongintField;
    userQRYUSUARIO: TStringField;
    procedure BtnAceptarClick(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  frmBusuarios: TfrmBusuarios;

implementation

{ TfrmBusuarios }

procedure TfrmBusuarios.FormShow(Sender: TObject);
begin
  userqry.close;
  userqry.sql.clear;
  userqry.sql.add('select * from USUARIOS where activo=''S'' and  '+
  ' pluperfil in (select distinct pluperfil from autoriza  '+
  ' where pluopcion=66 and opcion=''S'') order by usuario asc');
  userqry.open;

end;

procedure TfrmBusuarios.edtCodigoChange(Sender: TObject);
begin

  userqry.close;
  userqry.sql.clear;
  userqry.sql.add('select * from USUARIOS where activo=''S'' and  '+
  ' pluperfil in (select distinct pluperfil from autoriza  '+
  ' where usuario like '''+edtcodigo.text+'%''  '+
  ' and pluopcion=66 and opcion=''S'' order by usuario asc');
  userqry.open;

end;

procedure TfrmBusuarios.BtnAceptarClick(Sender: TObject);
begin

end;

initialization
  {$I liqfrmbusuarios.lrs}

end.

