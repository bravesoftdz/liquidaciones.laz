unit pickdate;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Calendar, Buttons, StdCtrls;

type

  { TBrDateForm }

  TBrDateForm = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Calendar1: TCalendar;
    Edit1: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure Calendar1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  BrDateForm: TBrDateForm;

implementation

{ TBrDateForm }

procedure TBrDateForm.Calendar1Click(Sender: TObject);
begin
  EDIT1.Caption:= CALENDAR1.Date;
end;

procedure TBrDateForm.FormCreate(Sender: TObject);
begin
   calendar1.Date:= DATETOSTR(NOW);

end;

procedure TBrDateForm.BitBtn1Click(Sender: TObject);
begin

end;

initialization
  {$I pickdate.lrs}

end.

