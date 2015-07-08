unit liqfpagosform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, ComCtrls, Buttons, DBGrids, IBQuery, IBUpdateSQL,
  IBCustomDataSet, ZDataset, ZSqlUpdate;

type

  { TliqpagosFrm }

  TliqpagosFrm = class(TForm)
    FPAGODS: TDatasource;
    FPAGOQRYCODIGO: TIBStringField;
    FPAGOQRYCODIGO1_1: TStringField;
    FPAGOQRYCREDITO: TIBStringField;
    FPAGOQRYDESCRIPCION: TIBStringField;
    FPAGOQRYDIASCRED: TIntegerField;
    FPAGOQRYFECHA_CREA: TDateTimeField;
    FPAGOQRYPLUCUENTA: TIntegerField;
    FPAGOQRYPLUSUARIO: TIntegerField;
    FPAGOQRYREGLASCRED: TIBStringField;
    griddet: TDBGrid;
    FPAGOQRY: TIBQuery;
    FPagoSQL: TIBUpdateSQL;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton9: TSpeedButton;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FPAGOQRYAfterDelete(DataSet: TDataSet);
    procedure FPAGOQRYAfterEdit(DataSet: TDataSet);
    procedure FPAGOQRYAfterInsert(DataSet: TDataSet);
    procedure FPAGOQRYAfterPost(DataSet: TDataSet);
    procedure FPAGOQRYBeforeEdit(DataSet: TDataSet);
    procedure FPAGOQRYBeforePost(DataSet: TDataSet);
    procedure FPAGOQRYCalcFields(DataSet: TDataSet);
    procedure FPAGOQRYNewRecord(DataSet: TDataSet);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
  private
    { private declarations }
    procedure controles(estado:boolean);
  public
    { public declarations }
  end; 

var
  liqpagosFrm: TliqpagosFrm;

implementation

uses liqdm;

{ TliqpagosFrm }

procedure TliqpagosFrm.controles(estado:boolean);
var
i:integer;
begin

        for I := 0 to griddet.Columns.Count - 1 do    { Iterate }
        begin
                  griddet.Columns[i].ReadOnly := not estado;
                  if estado=true then
                  griddet.Color:= $00B3FFFD
                  else
                  griddet.Color:= CLWINDOW;

        end;    { for }


end;


procedure TliqpagosFrm.FormCreate(Sender: TObject);
begin

     DM.CtasQRY.CLOSE;
     DM.CtasQRY.Params[0].Value := DM.EmpresaQRYPLUEMPRESA.Value;
     DM.CtasQRY.OPEN;

     FPAGOQRY.CLOSE;
     FPAGOQRY.Open;

end;

procedure TliqpagosFrm.FormShow(Sender: TObject);
begin
  GridDet.Columns[4].PickList.Clear;
  while not dm.CtasQRY.EOF do
  begin
       GridDet.Columns[4].PickList.Add(dm.CtasQRYcodigo.AsString);
       dm.CtasQRY.Next;
  end;
  controles(false);
end;

procedure TliqpagosFrm.FPAGOQRYAfterDelete(DataSet: TDataSet);
begin

  dm.myqry.close;
  dm.myqry.sql.clear;
  dm.myqry.sql.add('select count(*) cont from liquidacion_det where codigo=:codigo ');
  dm.myqry.parambyname('codigo').value := fpagoqrycodigo.value;
  dm.myqry.open;

  if dm.myqry.fieldbyname('cont').value >0 then
  begin

   showmessage(' forma de pago ya fue utilizado en Liquidaciones, no puede ser borrado!!');
   exit;

  end;

    fpagoqry.ApplyUpdates;


end;

procedure TliqpagosFrm.FPAGOQRYAfterEdit(DataSet: TDataSet);
begin

end;

procedure TliqpagosFrm.FPAGOQRYAfterInsert(DataSet: TDataSet);
begin

end;

procedure TliqpagosFrm.FPAGOQRYAfterPost(DataSet: TDataSet);
begin

   IF FPAGOQRYCODIGO.IsNull THEN
    BEGIN
    SHOWMESSAGE('Debe digitar un Codigo!!');
    exit;
    end;

    IF FPAGOQRYCODIGO.IsNull THEN
    BEGIN
    SHOWMESSAGE('Debe digitar una descripcion!!');
    exit;
    end;


    fpagoqry.ApplyUpdates;

end;

procedure TliqpagosFrm.FPAGOQRYBeforeEdit(DataSet: TDataSet);
begin

end;

procedure TliqpagosFrm.FPAGOQRYBeforePost(DataSet: TDataSet);
begin

end;

procedure TliqpagosFrm.FPAGOQRYCalcFields(DataSet: TDataSet);
begin

end;

procedure TliqpagosFrm.FPAGOQRYNewRecord(DataSet: TDataSet);
begin

   fpagoqrycredito.Value:= 'N';
   fpagoqryreglascred.Value:= 'N';
   fpagoqrydiascred.Value:= 0;

end;

procedure TliqpagosFrm.SpeedButton11Click(Sender: TObject);
begin

    controles(false);
    IF FPAGOQRYCODIGO.IsNull THEN
    BEGIN
    SHOWMESSAGE('Debe digitar un Codigo!!');
    exit;
    end;

    IF FPAGOQRYCODIGO.IsNull THEN
    BEGIN
    SHOWMESSAGE('Debe digitar una descripcion!!');
    exit;
    end;


    if (FPAGOQRY.State = dsinsert) or (FPAGOQRY.State = dsedit) then
        FPAGOQRY.Post;

end;

procedure TliqpagosFrm.SpeedButton12Click(Sender: TObject);
begin

  controles(true);
  griddet.Columns[0].ReadOnly:=false;
  griddet.Columns[2].ReadOnly := false;
  griddet.Columns[3].ReadOnly := false;
  FPAGOQRY.Edit;
end;

procedure TliqpagosFrm.SpeedButton13Click(Sender: TObject);
begin

  controles(true);
  griddet.Columns[2].ReadOnly := false;
  griddet.Columns[3].ReadOnly := false;
  FPAGOQRY.Insert;

end;

procedure TliqpagosFrm.SpeedButton1Click(Sender: TObject);
begin
  CLOSE;
end;

procedure TliqpagosFrm.SpeedButton3Click(Sender: TObject);
begin
  controles(false);
end;

procedure TliqpagosFrm.SpeedButton9Click(Sender: TObject);
begin

  dm.myqry.close;
  dm.myqry.sql.clear;
  dm.myqry.sql.add('select count(*) cont from liquidacion_det where codigo=:codigo ');
  dm.myqry.parambyname('codigo').value := fpagoqrycodigo.value;
  dm.myqry.open;

  if dm.myqry.fieldbyname('cont').value >0 then
  begin

   showmessage(' forma de pago ya fue utilizado en Liquidaciones, no puede ser borrado!!');
   exit;

  end;

   if MessageDlg('Desea Borrar Registro...?',
   mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    fpagoqry.Delete;

  end;

  controles(false);

end;

initialization
  {$I liqfpagosform.lrs}

end.

