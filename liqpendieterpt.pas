unit LiqPendieterpt;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, StdCtrls, Buttons, EditBtn, DBGrids, DbCtrls, ComCtrls,
  IBQuery, IBCustomDataSet, LR_Class, LR_DBSet, ZDataset;

type

  { TfrmRptPendLiq }

  TfrmRptPendLiq = class(TForm)
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    btnprint: TSpeedButton;
    frDBDataSet1: TfrDBDataSet;
    PENDLIQQRY: TIBQuery;
    PENDLIQQRYFECHA: TDateField;
    PENDLIQQRYNOMBRE: TIBStringField;
    RPT: TfrReport;
    PENDLIQDS: TDatasource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    PENDLIQQRYTITULO1: TStringField;
    PENDLIQQRYTITULO2_1: TStringField;
    Timer1: TTimer;
    procedure BitBtn4Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure PENDLIQQRYCalcFields(DataSet: TDataSet);
    procedure btnprintClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  frmRptPendLiq: TfrmRptPendLiq;

implementation
USES LIQDM;
{ TfrmRptPendLiq }

procedure TfrmRptPendLiq.BitBtn4Click(Sender: TObject);
begin

  BTNPRINT.ENABLED := FALSE;

  PENDLIQQRY.Close;
  PENDLIQQRY.Open;

  IF PENDLIQQRY.ISEMPTY THEN EXIT;

  BTNPRINT.ENABLED := TRUE;

end;

procedure TfrmRptPendLiq.ListBox1Click(Sender: TObject);
begin

end;

procedure TfrmRptPendLiq.PENDLIQQRYCalcFields(DataSet: TDataSet);
begin

  PENDLIQQRYTITULO1.VALUE := DM.EMPRESAQRYNOMBRE.ASSTRING;
  PENDLIQQRYTITULO2_1.VALUE := 'DETALLE DE VENDEDORES NO LIQUIDADOS AL :'+DATETOSTR(DATE());

end;

procedure TfrmRptPendLiq.btnprintClick(Sender: TObject);
begin
  rpt.ShowReport;
end;

procedure TfrmRptPendLiq.Timer1Timer(Sender: TObject);
begin
  BITBTN4.CLICK;
end;

procedure TfrmRptPendLiq.FormShow(Sender: TObject);
begin
  Timer1.enabled := true;
  BITBTN4.CLICK;
end;

procedure TfrmRptPendLiq.FormClose(Sender: TObject; 
  var CloseAction: TCloseAction);
begin
    Timer1.enabled := false;
end;

procedure TfrmRptPendLiq.BitBtn2Click(Sender: TObject);
begin
  close;
end;

initialization
  {$I liqpendieterpt.lrs}

end.

