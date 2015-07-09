unit ufrmCorrelativosVend;

{$mode delphi}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBGrids, DBControlGrid, IBDynamicGrid,
  IBLookupComboEditBox, IBQuery, IBCustomDataSet, db, types;

type

  { TfrmCorrelativosVendLiq }

  TfrmCorrelativosVendLiq = class(TForm)
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    LstCorrelativosVendQRYCORRELATIVO: TIBStringField;
    LstCorrelativosVendQRYFACTURADO: TIBStringField;
    LstCorrelativosVendQRYFECHA_ASIGNA: TDateField;
    LstCorrelativosVendQRYFECHA_LIQ: TDateField;
    LstCorrelativosVendQRYIDCORRELATIVO: TIntegerField;
    LstCorrelativosVendQRYIDVENDEDOR: TIntegerField;
    LstCorrelativosVendQRYNUMERO: TIntegerField;
    LstCorrelativosVendQRYTIPO: TIBStringField;
    LstCorrelativosVendQRYUSUARIO_ASIGNA: TIBStringField;
    LstCorrelativosVendQRYUSUARIO_LIQ: TIBStringField;
    LstVendDS: TDataSource;
    LstCorrelativosVendDS: TDataSource;
    IBDynamicGrid1: TIBDynamicGrid;
    IBLookupComboEditBox1: TIBLookupComboEditBox;
    LstCorrelativosVendQRY: TIBQuery;
    LstVendQRY: TIBQuery;
    Label2: TLabel;
    LstVendQRYCODIGO: TIBStringField;
    LstVendQRYISSS: TIBStringField;
    LstVendQRYNOMBRE: TIBStringField;
    LstVendQRYPLUEMPLEADOS: TIntegerField;
    Panel1: TPanel;
    procedure BitBtn2Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmCorrelativosVendLiq: TfrmCorrelativosVendLiq;

implementation

USES LIQDM;

{ TfrmCorrelativosVendLiq }

procedure TfrmCorrelativosVendLiq.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmCorrelativosVendLiq.Panel1Click(Sender: TObject);
begin

end;

{ TfrmCorrelativosVendLiq }



initialization
  {$I frmCorrelativosVend.lrs}

end.

