unit clfrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, db, FileUtil, ZDataset, LResources, Forms, Controls,
  Graphics, Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, DBGrids;

type

  { Tfrmclientes }

  Tfrmclientes = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Buscar: TGroupBox;
    ClDS: TDatasource;
    ClQry: TZQuery;
    ClQryACTIVO: TStringField;
    ClQryCALIFICACION_COMPRAS: TStringField;
    ClQryCALIFICACION_CREDITO: TStringField;
    ClQryCEDULA: TStringField;
    ClQryCEDULA_FIADOR: TStringField;
    ClQryCIUDAD: TStringField;
    ClQryCLASE: TStringField;
    ClQryCLASIFICACION: TStringField;
    ClQryCODIGO: TLongintField;
    ClQryCODIGO2: TStringField;
    ClQryCODIGO3: TStringField;
    ClQryCOLONIA: TStringField;
    ClQryCONTACTO: TStringField;
    ClQryCREDITO: TStringField;
    ClQryCREDITO1: TStringField;
    ClQryCREDITOACTIVO: TStringField;
    ClQryDEPARTAMENTO: TStringField;
    ClQryDEPTOPAIS: TStringField;
    ClQryDIAPAGO: TStringField;
    ClQryDIAQUEDAN: TStringField;
    ClQryDIASCRED: TLongintField;
    ClQryDIAS_CREDITO: TLongintField;
    ClQryDIRECCION1: TStringField;
    ClQryDIRECCION2: TStringField;
    ClQryDIRECCION_FIADOR: TStringField;
    ClQryDIRRECCION1: TStringField;
    ClQryDUI: TStringField;
    ClQryDUI_FIADOR: TStringField;
    ClQryEDAD: TLongintField;
    ClQryEMAIL: TStringField;
    ClQryEXCENTO: TStringField;
    ClQryEXT1: TStringField;
    ClQryEXT2: TStringField;
    ClQryEXTCOBRO: TStringField;
    ClQryFAX: TStringField;
    ClQryFECHATARJETA: TDateTimeField;
    ClQryFORMAPAGO: TStringField;
    ClQryGENERAR_ECUENTA: TStringField;
    ClQryGIRO: TStringField;
    ClQryJOBI: TStringField;
    ClQryLIMITECREDITO: TFloatField;
    ClQryLUGARTRABAJO: TStringField;
    ClQryMUNI: TStringField;
    ClQryMUNICIPIO: TStringField;
    ClQryNIT: TStringField;
    ClQryNOMBRE: TStringField;
    ClQryNOMBRETARJETA: TStringField;
    ClQryNOMBRE_FIADOR: TStringField;
    ClQryNOTARJETA: TStringField;
    ClQryNOTA_COBRO: TStringField;
    ClQryOBSERVACIONES1: TStringField;
    ClQryOBSERVACIONES2: TStringField;
    ClQryOBSERVACIONES_FIADOR: TStringField;
    ClQryOCUPACION: TStringField;
    ClQryPAIS: TStringField;
    ClQryPERSONACOBRO: TStringField;
    ClQryPLUABONO: TLongintField;
    ClQryPLUCATEGORIA: TLongintField;
    ClQryPLUCLCATEGORIA: TLongintField;
    ClQryPLUCLIENTE: TLongintField;
    ClQryPLUCLIENTE_MAYOR: TLongintField;
    ClQryPLUCLRUBRO: TLongintField;
    ClQryPLUCTA: TLongintField;
    ClQryPLUDOC: TLongintField;
    ClQryPLUEMPLEADOS: TLongintField;
    ClQryPLUSUCURSAL_CREA: TLongintField;
    ClQryPLUSUCURSAL_MOD: TLongintField;
    ClQryPLUTARJETA: TLongintField;
    ClQryPRECIO: TStringField;
    ClQryRECOMENDACIONES: TStringField;
    ClQryREGISTRO: TStringField;
    ClQrySALDO: TFloatField;
    ClQryTARJETA: TStringField;
    ClQryTASA_CERO: TStringField;
    ClQryTELCOBRO: TStringField;
    ClQryTELEFONO: TStringField;
    ClQryTELTARJETA: TStringField;
    ClQryTEL_FIADOR: TStringField;
    ClQryTEL_TRABAJO: TStringField;
    ClQryTIPO: TStringField;
    ClQryTIPODOC: TStringField;
    ClQryTRABAJO: TStringField;
    ClQryTRABAJO_FIADOR: TStringField;
    ClQryUSUARIO: TStringField;
    ClQryWEB: TStringField;
    ClQryZONA: TStringField;
    DBGrid1: TDBGrid;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    edtcodigo: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel3: TPanel;
    TabSheet1: TTabSheet;
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure edtcodigoChange(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmclientes: Tfrmclientes;

implementation

{ Tfrmclientes }

procedure Tfrmclientes.edtcodigoChange(Sender: TObject);
begin
  clqry.Close;
clqry.SQL.Clear;
clqry.SQL.Add('select CLIENTES.*,CLCATEGORIA.NOMBRE AS CLASE from clientes ');
clqry.SQL.Add('INNER JOIN CLCATEGORIA ON (CLIENTES.PLUCLCATEGORIA = CLCATEGORIA.PLUCLCATEGORIA)');
clqry.SQL.Add(' where CLIENTES.codigo like'''+edtcodigo.Text+'%'' order by codigo');
clqry.Open;


edit2.Text:='';
end;

procedure Tfrmclientes.Edit2Change(Sender: TObject);
begin
  edtcodigo.Text:='';


clqry.Close;
clqry.SQL.Clear;
clqry.SQL.Add('select CLIENTES.*,CLCATEGORIA.NOMBRE AS CLASE from clientes ');
clqry.SQL.Add('INNER JOIN CLCATEGORIA ON (CLIENTES.PLUCLCATEGORIA = CLCATEGORIA.PLUCLCATEGORIA)');
clqry.SQL.Add(' WHERE CLIENTES.nombre like'''+edit2.Text+'%'' order by CLIENTES.nombre');
clqry.Open;

end;

procedure Tfrmclientes.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure Tfrmclientes.Edit3Change(Sender: TObject);
begin
  edit2.Text:='';
edtcodigo.Text:='';

clqry.Close;
clqry.SQL.Clear;
clqry.SQL.Add('select CLIENTES.*,CLCATEGORIA.NOMBRE AS CLASE from clientes ');
clqry.SQL.Add('INNER JOIN CLCATEGORIA ON (CLIENTES.PLUCLCATEGORIA = CLCATEGORIA.PLUCLCATEGORIA)');
clqry.SQL.Add(' where CLIENTES.REGISTRO like'''+edit3.Text+'%'' order by CLIENTES.nombre');
clqry.Open;
end;

procedure Tfrmclientes.Edit4Change(Sender: TObject);
begin
  edtcodigo.Text:='';


clqry.Close;
clqry.SQL.Clear;
clqry.SQL.Add('select CLIENTES.*,CLCATEGORIA.NOMBRE AS CLASE from clientes ');
clqry.SQL.Add('INNER JOIN CLCATEGORIA ON (CLIENTES.PLUCLCATEGORIA = CLCATEGORIA.PLUCLCATEGORIA)');
clqry.SQL.Add('where CLIENTES.direccion1 like'''+edit4.Text+'%'' order by CLIENTES.nombre');
clqry.Open;

end;

initialization
  {$I clfrm.lrs}

end.
