unit ufrmpsql;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, DBGrids, Buttons, ZDataset;

type

  { Tfrmpsql }

  Tfrmpsql = class(TForm)
    BitBtn1: TBitBtn;
    Datasource1: TDatasource;
    DBGrid1: TDBGrid;
    ZQuery1: TZQuery;
    procedure BitBtn1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  frmpsql: Tfrmpsql;

implementation

{ Tfrmpsql }

procedure Tfrmpsql.BitBtn1Click(Sender: TObject);
begin
  ZQUERY1.CLOSE;
  ZQUERY1.OPEN;
end;

initialization
  {$I ufrmpsql.lrs}

end.

