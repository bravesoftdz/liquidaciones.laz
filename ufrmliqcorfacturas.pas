unit ufrmLiqCorFacturas;

{$mode delphi}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, IBDynamicGrid;

type

  { TfrmLiqCorFacturas }

  TfrmLiqCorFacturas = class(TForm)
    IBDynamicGrid1: TIBDynamicGrid;
    Panel1: TPanel;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmLiqCorFacturas: TfrmLiqCorFacturas;

implementation

initialization
  {$I ufrmLiqCorFacturas.lrs}

end.

