unit frametools; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, ComCtrls, Buttons;

type

  { Tfrmtoolsbar }

  Tfrmtoolsbar = class(TFrame)
    btnBuscar: TSpeedButton;
    btnprocesar: TSpeedButton;
    btnSalir: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton9: TSpeedButton;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    procedure btnSalirClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

implementation

{ Tfrmtoolsbar }

procedure Tfrmtoolsbar.SpeedButton4Click(Sender: TObject);
begin

end;

procedure Tfrmtoolsbar.btnSalirClick(Sender: TObject);
begin

end;

initialization
  {$I frametools.lrs}

end.

