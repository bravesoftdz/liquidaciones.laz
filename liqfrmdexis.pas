unit LiqfrmDexis;

{$mode delphi}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Buttons;

type

  { TfrmDExisIni }

  TfrmDExisIni = class(TForm)
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblkardex: TLabel;
    lblLiquid: TLabel;
    Label6: TLabel;
    lblProd: TLabel;
    rbtnKardex: TRadioButton;
    rbtLiq: TRadioButton;
    procedure BitBtn1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  frmDExisIni: TfrmDExisIni;

implementation

uses liqLiquidacion;

{ TfrmDExisIni }

procedure TfrmDExisIni.BitBtn1Click(Sender: TObject);
begin
    if rbtnKardex.Checked then
       cual_existencia :=1;
    if rbtliq.Checked then
       cual_existencia :=2;
end;

initialization
  {$I liqfrmdexis.lrs}

end.

