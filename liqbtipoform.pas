unit liqbtipoForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DBGrids, IBQuery, IBCustomDataSet;

type

  { TliqBtipofrm }

  TliqBtipofrm = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    tipoQRY: TIBQuery;
    tipods: TDatasource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    tipoQRYDESCRIPCION: TIBStringField;
    tipoQRYPLUTIPO: TIntegerField;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  liqBtipofrm: TliqBtipofrm;

implementation

{ TliqBtipofrm }

procedure TliqBtipofrm.FormCreate(Sender: TObject);
begin
   tipoqry.Close;
   tipoqry.Open;
end;

procedure TliqBtipofrm.DBGrid1DblClick(Sender: TObject);
begin
  bitbtn1.Click;
end;

procedure TliqBtipofrm.BitBtn1Click(Sender: TObject);
begin

end;

initialization
  {$I liqbtipoform.lrs}

end.

