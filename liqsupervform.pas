unit liqsupervform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, StdCtrls, DbCtrls, ComCtrls, Buttons,
  LCLType, IBQuery, IBUpdateSQL, IBCustomDataSet;

type

  { TfrmSupervisor }

  TfrmSupervisor = class(TForm)
    btnBuscar: TSpeedButton;
    btnBuscaVend1: TSpeedButton;
    DBLookupComboBox1: TDBLookupComboBox;
    StringField1: TStringField;
    SupervisorQRY: TIBQuery;
    SupervisorQRYACTIVO: TIBStringField;
    SupervisorQRYCELULAR: TIBStringField;
    SupervisorQRYCODIGO: TIntegerField;
    SupervisorQRYCORREO: TIBStringField;
    SupervisorQRYDIRECCION: TIBStringField;
    SupervisorQRYDUI: TIBStringField;
    SupervisorQRYEXTENCION: TIntegerField;
    SupervisorQRYFECHA_CREA: TDateTimeField;
    SupervisorQRYNIT: TIBStringField;
    SupervisorQRYNOMBRE: TIBStringField;
    SupervisorQRYPLUBODEGA: TIntegerField;
    SupervisorQRYPLUSUARIO: TIntegerField;
    SupervisorQRYPLUSUPERVISOR: TIntegerField;
    SupervisorQRYTELEFONO: TIBStringField;
    SupervisorQRYZONA: TIBStringField;
    userqry: TIBQuery;
    SupervisorSQL: TIBUpdateSQL;
    Label19: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SupervisorDS: TDatasource;
    dbcel: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    dbdir: TDBEdit;
    dbdir1: TDBEdit;
    dbDUI: TDBEdit;
    dbEXT: TDBEdit;
    dbNIT: TDBEdit;
    dbCodigo: TDBEdit;
    dbnombre: TDBEdit;
    dbpais: TDBEdit;
    dbTEL: TDBEdit;
    DBText1: TDBText;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label2: TLabel;
    Label38: TLabel;
    Label52: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    SupervisorQRYUSUARIO1: TStringField;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    userqryPLUSUARIO: TLongintField;
    userqryUSUARIO: TStringField;
    procedure btnBuscarClick(Sender: TObject);
    procedure btnBuscaVend1Click(Sender: TObject);
    procedure dbCodigoEnter(Sender: TObject);
    procedure dbCodigoExit(Sender: TObject);
    procedure dbCodigoKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SupervisorQRYAfterDelete(DataSet: TDataSet);
    procedure SupervisorQRYAfterPost(DataSet: TDataSet);
    procedure SupervisorQRYBeforeCancel(DataSet: TDataSet);
    procedure SupervisorQRYBeforeEdit(DataSet: TDataSet);
    procedure SupervisorQRYBeforePost(DataSet: TDataSet);
    procedure SupervisorQRYCalcFields(DataSet: TDataSet);
    procedure SupervisorQRYNewRecord(DataSet: TDataSet);
  private
    { private declarations }
    procedure controles(estado:boolean);
    function compruebatecla(key:char):char;
  public
    { public declarations }
  end; 

var
  frmSupervisor: TfrmSupervisor;

implementation
uses liqDM,
liqbsuperform,
LiqMenuform,
liqfrmbusuarios;
{ TfrmSupervisor }

procedure TfrmSupervisor.controles(estado:boolean);
var
i:integer;
begin


        for I := 0 to self.Panel1.ControlCount - 1 do    { Iterate }
        begin
                if self.Panel1.Controls[i].ClassType<> ttoolbar then
                self.Panel1.Controls[i].Enabled := estado;

        end;    { for }

        Toolbar1.Enabled:= true;
end;


procedure TfrmSupervisor.SupervisorQRYNewRecord(DataSet: TDataSet);
VAR
I:INTEGER;
begin

  CONTROLES(TRUE);
  SupervisorQryplubodega.Value := dm.bodegaqryplubodega.value;

  DM.MYQRY.CLOSE;
  DM.MYQRY.SQL.CLEAR;
  DM.MYQRY.SQL.ADD('SELECT MAX(CODIGO) as codigo FROM SUPERVISORES  ');
  DM.MYQRY.Open;
  IF DM.MYQRY.FieldByName('codigo').IsNull THEN
     I:= 1
     ELSE
     I:= DM.MYQRY.FIELDBYNAME('CODIGO').VALUE +1 ;

  SupervisorQrycodigo.Value := i;
  SUPERVISORQRYACTIVO.Value:= 'T';

  dbnombre.SetFocus;


end;

procedure TfrmSupervisor.btnBuscarClick(Sender: TObject);
begin


   CONTROLES(FALSE);
   with TFrmBSuper.Create(SELF) do
  try

   if ShowModal = mrOk then
    begin

    IF NOT BSUPERQRY.IsEmpty THEN
    BEGIN

         USERQRY.CLOSE;
         USERQRY.OPEN;

         SupervisorQRY.close;
         SupervisorQry.params[0].value := bsuperqryplusupervisor.value;
         SupervisorQry.open;



    END;

    end;
  finally

  end;

end;

procedure TfrmSupervisor.btnBuscaVend1Click(Sender: TObject);
begin

    with TfrmBusuarios.Create(SELF) do
  try

   if ShowModal = mrOk then
    begin

    IF NOT userqry.IsEmpty THEN
    BEGIN

     supervisorqryplusuario.value := userqryplusuario.value;

    END;

    end;
  finally

  end;

end;

function Tfrmsupervisor.compruebatecla(key:char):char;
begin

   if ( key = Char(VK_RETURN) ) then // -- En caso de pulsar enter, pasa al siguiente campo
         begin
              key:=#0;
              SelectNext(activecontrol,true,true);
         end;
      if ( key = Char(VK_UP) ) then // -- Si pulsamos la flecha arriba, vuelve al campo anterior
         begin
              key:=#0;
              SelectNext(activecontrol,false,true);
         end;
      if ( key = Char(VK_DOWN) ) then // -- Si pulsamos la flecha abajo, pasa al campo siguiente
         begin
              key:=#0;
              SelectNext(activecontrol,true,true);
         end;
      compruebatecla:=(key);
 end;


procedure TfrmSupervisor.dbCodigoEnter(Sender: TObject);
begin
  menufrm.entrar(sender);
end;

procedure TfrmSupervisor.dbCodigoExit(Sender: TObject);
begin
  menufrm.salir(sender);
end;

procedure TfrmSupervisor.dbCodigoKeyPress(Sender: TObject; var Key: char);
begin
   key := compruebatecla(key);
end;

procedure TfrmSupervisor.FormShow(Sender: TObject);
begin
  CONTROLES(FALSE);
  supervisorqry.close;
  supervisorqry.open;

  USERQRY.CLOSE;
  USERQRY.OPEN;

  TOOLBAR1.Enabled:= TRUE;

end;

procedure TfrmSupervisor.GroupBox1Click(Sender: TObject);
begin

end;

procedure TfrmSupervisor.Panel1Click(Sender: TObject);
begin

end;

procedure TfrmSupervisor.SpeedButton11Click(Sender: TObject);
begin

  if (SUPERVISORQRY.State = dsinsert) or (SUPERVISORQRY.State = dsedit) then
  Supervisorqry.Post;

end;

procedure TfrmSupervisor.SpeedButton12Click(Sender: TObject);
begin

  IF SUPERVISORQRYPLUSUPERVISOR.Value >0 THEN
  Supervisorqry.Edit;

end;

procedure TfrmSupervisor.SpeedButton13Click(Sender: TObject);
begin
    CONTROLES(TRUE);
   Supervisorqry.Insert;
end;

procedure TfrmSupervisor.SpeedButton1Click(Sender: TObject);
begin
  CLOSE;
end;

procedure TfrmSupervisor.SpeedButton3Click(Sender: TObject);
begin
  supervisorqry.CancelUpdates;
end;

procedure TfrmSupervisor.SpeedButton5Click(Sender: TObject);
begin

end;

procedure TfrmSupervisor.SpeedButton9Click(Sender: TObject);
begin

     IF SUPERVISORQRY.IsEmpty THEN
     EXIT;

     if MessageDlg('Desea Borrar Registro...?',
   mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin

    dm.MyQry.Close;
    dm.MyQry.SQL.Clear;
    dm.MyQry.SQL.Add('select count(*) cnt from liquidacionm where plusupervisor='''+Supervisorqryplusupervisor.AsString+''' ');
    dm.MyQry.Open;

    if dm.MyQry.FieldByName('cnt').AsInteger>0 then
    begin
      showmessage('Supervisor posee liquidaciones, no puede eliminarlo!!!');
      exit;
    end;
    Supervisorqry.Delete;

  end;

end;

procedure TfrmSupervisor.SupervisorQRYAfterDelete(DataSet: TDataSet);
begin
    SUPERVISORQRY.ApplyUpdates;
end;

procedure TfrmSupervisor.SupervisorQRYAfterPost(DataSet: TDataSet);
begin
  SUPERVISORQRY.ApplyUpdates;
end;

procedure TfrmSupervisor.SupervisorQRYBeforeCancel(DataSet: TDataSet);
begin
   CONTROLES(FALSE);
end;

procedure TfrmSupervisor.SupervisorQRYBeforeEdit(DataSet: TDataSet);
begin
  CONTROLES(TRUE);
end;

procedure TfrmSupervisor.SupervisorQRYBeforePost(DataSet: TDataSet);
begin
  CONTROLES(FALSE);
end;

procedure TfrmSupervisor.SupervisorQRYCalcFields(DataSet: TDataSet);
begin

end;

initialization
  {$I liqsupervform.lrs}

end.

