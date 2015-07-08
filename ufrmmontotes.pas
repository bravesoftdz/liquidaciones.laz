unit ufrmMontoTes;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, MaskEdit, Buttons;

type

  { Tfrmmontotes }

  Tfrmmontotes = class(TForm)
    BitBtn1: TBitBtn;
    Label1: TLabel;
    edtTottes: TMaskEdit;
    procedure BitBtn1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmmontotes: Tfrmmontotes;

implementation

uses liqdetpliqform;

{ Tfrmmontotes }

procedure Tfrmmontotes.BitBtn1Click(Sender: TObject);
begin

     if (strtocurr(edttottes.Text)=0) then
    begin
      close;
      ModalResult := mrOk;
      exit;
    end;

    if not(strtocurr(edttottes.Text)>0) then
    begin
      showmessage('debe digitar un valor valido!!');
      edttottes.SetFocus;
      exit;
    end;

    application.CreateForm(TfrmLiqPago,frmLiqPago);
    frmLiqPago.tipo:= 'TES';
    frmliqpago.montoTes:= strtocurr(edttottes.Text) ;
    frmLiqPago.ShowModal;


end;

initialization
  {$I ufrmMontoTes.lrs}

end.

