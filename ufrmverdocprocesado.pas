unit ufrmVerDocProcesado;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, Buttons, StdCtrls, DBGrids, ZDataset;

type

  { TfrmVerDocProcesado }

  TfrmVerDocProcesado = class(TForm)
    btn1: TBitBtn;
    btn2: TBitBtn;
    btn3: TBitBtn;
    btn4: TBitBtn;
    dbgrd1: TDBGrid;
    dbgrd2: TDBGrid;
    dsDOC: TDatasource;
    dsDOCD: TDatasource;
    grp1: TGroupBox;
    lbl1: TLabel;
    pnl1: TPanel;
    msucursalmqry: TZReadOnlyQuery;
    msucursald2qry: TZReadOnlyQuery;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure pnl1Click(Sender: TObject);
  private
    procedure procesar;
  public
    { public declarations }
  end; 

var
  frmVerDocProcesado: TfrmVerDocProcesado;

implementation

uses liqprogresoform,liqdm,procesos;
{ TfrmVerDocProcesado }

procedure TfrmVerDocProcesado.btn2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmVerDocProcesado.btn3Click(Sender: TObject);
begin
   if MessageDlg('Desea Procesar Todos...?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin

        msucursalmqry.first;
        while not msucursalmqry.EOF do
        begin

          procesar;
          msucursalmqry.Next;
        end;
        btn1.Click;

    end;
end;

procedure TfrmVerDocProcesado.btn4Click(Sender: TObject);
begin
    if MessageDlg('Desea Procesar la Devolucion :'+msucursalmqry.fieldbyname('codigo').asstring+'...?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
        procesar;
        btn1.Click;

    end;
end;

procedure TfrmVerDocProcesado.procesar;
VAR PROCESO:BOOLEAN;
EXISTENCIA:INTEGER;

begin


  dm.IBTransInv.Active:=false;
  dm.IBTransInv.StartTransaction;
  try

  Application.CreateForm(Tprogresofrm,progresofrm);

  //Cierro el query de la tabla inv_reservas y la abro
  //DM.InsResSQL.Close;
  //DM.InsResSQL.Open;

  //abro el detalle de la asignacion
  msucursald2qry.close;
  msucursald2qry.Params[0].value := msucursalmqry.fieldbyname('plumovsucursal').Value;
  msucursald2qry.Open;

  progresofrm.ProgressBar1.Min:=0;
  progresofrm.ProgressBar1.Max:=msucursald2QRY.RecordCount;
  progresofrm.ProgressBar1.Step:=1;
  progresofrm.Show;

  msucursald2qry.First;

  while NOT msucursald2qry.EOF do
  begin

  //extraemos la existencia
  //existencia := K_Existencia(msucursald2qrypluproducto.Value,msucursalmqryplusucursal.Value);
  // Verificar si producto existe en bodega del vendedor

  dm.myqry.close;
  dm.myqry.sql.clear;
  dm.myqry.sql.add('select sum(entrada)-sum(salida) existe from inv_reservas where pluproducto=:pluprod ');
  dm.myqry.sql.add(' and plubodegas=:pluv  ');
  dm.myqry.params[0].value := msucursald2qry.fieldbyname('pluproducto').Value;
  dm.MyQry.Params[1].Value := msucursalmqry.fieldbyname('plusucursal2').Value;//pluvendedor
  dm.MyQry.Open;

  if dm.MyQry.FieldByName('existe').Value >0 then
     existencia := dm.MyQry.FieldByName('existe').Value
     else
     existencia := 0;

  //si no hay suficiente existencia se rompe el proceso
  if (msucursald2qry.fieldbyname('cantidad').Value>existencia) then
  begin

     progresofrm.Close;
     showmessage('Vendedor:"'+msucursalmqry.fieldbyname('nombre').asstring+'", tiene asignado:"'+inttostr(existencia)+'", en Producto:"'+msucursald2qry.FieldByName('codigo').asstring+'", No puede devolver mas que eso!!');
     dm.IBTransInv.Rollback;
     exit;

  end;

  // procesado de la orden, inserta datos en la tabla de inventario
  PROCESO := procesar_reserva(msucursalmqry.fieldbyname('tipo').Value,msucursald2qry.fieldbyname('pluproducto').Value,
  msucursalmqry.fieldbyname('fecha').Value,msucursalmqry.fieldbyname('tipo').Asstring+'-'+
  msucursalmqry.fieldbyname('codigo').asstring,
  msucursalmqry.fieldbyname('tipo').AsString,0,msucursald2qry.fieldbyname('cantidad').Value,msucursalmqry.fieldbyname('observaciones').AsString,
  msucursalmqry.fieldbyname('plusucursal2').Value,msucursalmqry.fieldbyname('plumovsucursal').Value);

  // si ocurre algun error al procesar, rompo el lazo
  if not PROCESO then
  begin

     progresofrm.Close;
     showmessage('error al procesar');
     dm.IBTransInv.Rollback;
     exit;
  end;

  progresofrm.ProgressBar1.StepIt;
  msucursald2qry.Next;
  end;

   // si todo se ejecuta con exito, se aplican los cambios
   dm.IBTransInv.Commit;





 except
  on e : exception do
    begin

      progresofrm.Close;
      //si hay algun error , se deshacen los cambios
      dm.IBTransInv.Rollback;
      ShowMessage ('Clase de error: ' + e.ClassName + chr(13) + chr(13) +
          'Mensaje del error: ' + e.Message+', Error al Procesar...');


    end;

  end; //try

  progresofrm.Close;


end;

procedure TfrmVerDocProcesado.btn1Click(Sender: TObject);
var
 i:Integer;
begin
        msucursalmqry.Close;
        msucursalmqry.Open;
        msucursalmqry.First;
        I:=0;
        while not msucursalmqry.Eof do
          begin
            i := i + 1;
            msucursalmqry.Next;
          end;    // while
        lbl1.Caption := '# Registros:'+inttostr(i);
        msucursalmqry.First;

        msucursald2qry.Close;
        msucursald2qry.Open;


end;

procedure TfrmVerDocProcesado.pnl1Click(Sender: TObject);
begin

end;

initialization
  {$I ufrmverdocprocesado.lrs}

end.

