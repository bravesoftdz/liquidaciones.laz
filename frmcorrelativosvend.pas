unit frmCorrelativosVend;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBGrids, DBControlGrid, IBDynamicGrid,
  IBLookupComboEditBox, IBQuery, types;

type

  { TfrmCorrelativosVend }

  TfrmCorrelativosVend = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    IBDynamicGrid1: TIBDynamicGrid;
    IBLookupComboEditBox1: TIBLookupComboEditBox;
    LstVendQRY: TIBQuery;
    Label2: TLabel;
    Panel1: TPanel;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBControlGrid1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure edtcodigoChange(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmCorrelativosVend: TfrmCorrelativosVend;

implementation

USES LIQDM;

{ TfrmCorrelativosVend }

procedure TfrmCorrelativosVend.edtcodigoChange(Sender: TObject);
begin

end;

procedure TfrmCorrelativosVend.DBControlGrid1ContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin

end;

procedure TfrmCorrelativosVend.BitBtn1Click(Sender: TObject);
begin

end;

initialization
  {$I unit1.lrs}

end.

