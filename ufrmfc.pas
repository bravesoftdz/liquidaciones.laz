unit ufrmFC;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, BufDataset, memds, FileUtil, LResources, Forms,
  Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, DbCtrls, ComCtrls, Buttons,
 LCLType, MaskEdit, DBGrids, IBQuery,
  IBUpdateSQL, IBCustomDataSet, Messages, StrUtils, Variants;

type

  { TfrmFC2 }

  TfrmFC2 = class(TForm)
    btnGuardar: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    chkRFecha: TCheckBox;
    chRVend: TCheckBox;
    CorrelativoQRYCORRELATIVO: TIBStringField;
    CorrelativoQRYFINAL: TIntegerField;
    CorrelativoQRYINICIAL: TIntegerField;
    DataSource1: TDatasource;
    DataSource2: TDatasource;
    DBGrid1: TDBGrid;
    edtCliente: TEdit;
    edtcodigo: TEdit;
    edtCorrelativo: TEdit;
    edtFecha: TMaskEdit;
    edttotal: TMaskEdit;
    edtVendedor: TEdit;
    FACTMANULADO: TStringField;
    FACTMCODIGO: TLongintField;
    FACTMCONDICIONES: TStringField;
    FACTMCORRELATIVO: TStringField;
    FACTMDIA: TLongintField;
    FACTMDIASCREDITO: TLongintField;
    FACTMDIRECCION_ENVIO: TStringField;
    FACTMESEXENTO: TStringField;
    FACTMFECHA: TDateField;
    FACTMFLETE: TFloatField;
    FACTMFORMAPAGO: TStringField;
    FACTMGRAVADO: TFloatField;
    FACTMID: TLongintField;
    FACTMIMPRESO: TStringField;
    FACTMIVA: TFloatField;
    FACTMLEGAL: TStringField;
    FACTMNOMBRE: TStringField;
    FACTMOBSERVACIONES: TStringField;
    FACTMPAGADO: TStringField;
    FACTMPC_CREA: TStringField;
    FACTMPENDIENTE: TFloatField;
    FACTMPLUCLIENTE: TLongintField;
    FACTMPLUDOCCLIENTES: TLongintField;
    FACTMPLUEMPLEADOS: TLongintField;
    FACTMPLUEMPRESAS: TLongintField;
    FACTMPLUFACTURANC: TLongintField;
    FACTMPLUSUCURSALES: TLongintField;
    FACTMPOST: TStringField;
    FACTMTIPO: TStringField;
    FACTMTOTAL: TFloatField;
    FACTMVENDEDOR: TStringField;
    FACTMV_EXENTO: TFloatField;
    FACTM: TIBQuery;
    FACTMSQL: TIBUpdateSQL;
    CorrelativoQRY: TIBQuery;
    Label1: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    factura: TMemDataset;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    procedure btnGuardarClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
    procedure edtClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtClienteKeyPress(Sender: TObject; var Key: char);
    procedure edtcodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCorrelativoKeyPress(Sender: TObject; var Key: char);
    procedure edtFechaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure edttotalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure edtVendedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtVendedorKeyPress(Sender: TObject; var Key: char);
    procedure FACTMAfterDelete(DataSet: TDataSet);
    procedure FACTMAfterInsert(DataSet: TDataSet);
    procedure FACTMAfterPost(DataSet: TDataSet);
    procedure FACTMBeforeCancel(DataSet: TDataSet);
    procedure FACTMBeforeEdit(DataSet: TDataSet);
    procedure FACTMCalcFields(DataSet: TDataSet);
    procedure FACTMNewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { private declarations }
    procedure limpiar;
  public
    { public declarations }
  end;

var
  frmFC2: TfrmFC2;
  vendedor: string;
  fechaAnt : TDate;
  vcodigo, vcliente, vvendedor: boolean;
  plucliente, pluvendedor: integer;

implementation

uses liqdm, clfrm, ufrmBVendedor, procesos;

{ TfrmFC2 }

procedure TfrmFC2.edtFechaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
    edtcodigo.SetFocus
end;

procedure TfrmFC2.edttotalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then  btnGuardar.SetFocus;

end;

procedure TfrmFC2.edtVendedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
  begin

    dm.myqry.close;
    dm.myqry.SQL.Clear;
    dm.myqry.sql.add('select pluempleados,nombre from empleados' +
      ' where codigo like ''' + edtvendedor.Text + '''  and '+
      ' PLUEMPRESAS=:PLUEMPRESA ');
    dm.myqry.Params[0].Value := dm.empresaqrypluempresa.value;
    dm.myqry.Open;

    if (dm.myqry.fieldbyname('pluempleados').Value > 0) then
    begin
      vvendedor := true;
      label1.Caption := dm.myqry.fieldbyname('nombre').Value;
      pluvendedor := dm.myqry.fieldbyname('pluempleados').Value;
      edtTOTAL.SetFocus;
    end
    else
    begin
      vvendedor := false;
      label5.Caption := '';
      pluvendedor := 0;
      showmessage('Este Vendedor no existe!!!');
      edtVendedor.SetFocus;
      exit;
    end;

  end;
end;

procedure TfrmFC2.edtVendedorKeyPress(Sender: TObject; var Key: char);
begin

  //'Ñ', 'ñ'
  if not (Upcase(Key) in [#8, '0'..'9', 'A'..'Z']) then
  begin
    Key := #0;

    Beep;

  end;
end;

procedure TfrmFC2.FACTMAfterDelete(DataSet: TDataSet);
begin

end;

procedure TfrmFC2.FACTMAfterInsert(DataSet: TDataSet);
begin

end;

procedure TfrmFC2.FACTMAfterPost(DataSet: TDataSet);
begin
    factm.ApplyUpdates;
end;

procedure TfrmFC2.FACTMBeforeCancel(DataSet: TDataSet);
begin

end;

procedure TfrmFC2.FACTMBeforeEdit(DataSet: TDataSet);
begin

end;

procedure TfrmFC2.FACTMCalcFields(DataSet: TDataSet);
begin

end;

procedure TfrmFC2.FACTMNewRecord(DataSet: TDataSet);
begin

end;

procedure TfrmFC2.FormCreate(Sender: TObject);
begin
   if dm.PeriodoQRYPOST.Value='S' then
  begin
    showmessage('Periodo Cerrado!!!');
    close;
  end;

  shortdateformat := 'DD/MM/YYYY';

  correlativoQry.Close;
  CorrelativoQry.Params[0].Value := 'FC';
  CorrelativoQry.Params[1].Value := dm.EmpresaQRYpluempresa.Value;
  CorrelativoQry.Open;
  fechaAnt :=DATE();
  limpiar;

  vcodigo := false;
  vcliente := false;
  vvendedor := false;
  factura.Close;
  factura.open;
end;

procedure TfrmFC2.SpeedButton4Click(Sender: TObject);
begin

   with tfrmCLIENTES.Create(SELF) do
  try
    if ShowModal = mrOk then
    begin
      if not CLQRY.IsEmpty then
      begin


        edtcliente.text := CLQRYCODIGO.AsString;
        edtcliente.SetFocus;
      end;

    end;
  finally
  end;
end;

procedure TfrmFC2.SpeedButton5Click(Sender: TObject);
begin
   with TfrmBVendedor.Create(SELF) do
  try

    if ShowModal = mrOk then
    begin

      if not VENDQRY.IsEmpty then
      begin

        edtvendedor.text := vendQRY.FIELDBYNAME('CODIGO').AsString;
        edtvendedor.SetFocus;
      end;

    end;
  finally

  end;
end;

procedure TfrmFC2.edtCorrelativoKeyPress(Sender: TObject; var Key: char);
begin
    if not (Upcase(Key) in [#8, '0'..'9', 'A'..'Z']) then
  begin
    Key := #0;

    Beep;

  end;
end;

procedure TfrmFC2.edtcodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if ( key = qword(VK_RETURN)) then
  begin

    if edtcodigo.Text = '' then
    begin
      showmessage('Debe Digitar un Numero de Factura!!');
      edtcodigo.SetFocus;
      exit;
    end;
    dm.myqry.close;
    dm.myqry.SQL.Clear;
    dm.myqry.sql.add('select count(*) cnt from docclientesm where' +
      ' correlativo=''' + edtcorrelativo.Text + ''' and codigo=' + edtcodigo.Text +
      ' and pluempresaS=' + dm.EmpresaQryPLUEMPRESA.AsString + ' and ' +
      ' plusucursales=' + dm.bodegaqryPLUBODEGA.AsString + '');
    dm.myqry.Open;

    if not (dm.myqry.fieldbyname('cnt').Value > 0) then
    begin
      vcodigo := true;
      edtcliente.SetFocus;
    end
    else
    begin
      vcodigo := false;
      showmessage('Este Documento ya existe!!!');
      edtcodigo.SetFocus;
      exit;
    end;

  end;
end;

procedure TfrmFC2.edtClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
  begin

    dm.myqry.close;
    dm.myqry.SQL.Clear;
    dm.myqry.sql.add('select plucliente,nombre from clientes' +
      ' where codigo=' + edtcliente.Text);
    dm.myqry.Open;

    if (dm.myqry.fieldbyname('plucliente').Value > 0) then
    begin
      vcliente := true;
      Label5.Caption := dm.myqry.fieldbyname('nombre').Value;
      plucliente := dm.myqry.fieldbyname('plucliente').Value;
      edtvendedor.SetFocus;
    end
    else
    begin
      plucliente := 0;
      vcliente := false;
      Label5.Caption := '';
      showmessage('Este Cliente no existe!!!');
      edtcliente.SetFocus;
      exit;
    end;

  end;
end;

procedure TfrmFC2.btnGuardarClick(Sender: TObject);
begin

  FACTM.Close;
  FACTM.Open;

  if (vcodigo = false) then
  begin
    showmessage('Debe Digitar un Numero de Factura Valido!!');
    edtcodigo.SetFocus;
    exit;
  end;

  if ((edtcodigo.Text = '') or (edtcodigo.Text = '0')) then
  begin
    showmessage('Debe Digitar un Numero de Factura Valido!!');
    edtcodigo.SetFocus;
    exit;
  end;

  if (edtcliente.Text = '') or (vcliente = false) then
  begin
    showmessage('Debe Digitar un cliente Valido!!!');
    edtcliente.SetFocus;
    exit;
  end;

  if (edtVendedor.Text = '') or (vvendedor = false) then
  begin
    showmessage('Debe Digitar un Vendedor Valido!!');
    edtVendedor.SetFocus;
    exit;
  end;

  //WWDBDATEEDIT1.MaxDate := DM.PeriodoQRYFECHAFINAL.Value;
  //WWDBDATEEDIT1.MinDate := DM.PeriodoQRYFECHAINICIAL.Value;
  //ShowMessage(edtFecha.Text);
  //ShowMessage(DM.PeriodoQRYFECHAFINAL.AsString);
  if ((StrToDate(edtFecha.Text)>DM.PeriodoQRYFECHAFINAL.Value)
  or (StrToDate(edtFecha.Text)<DM.PeriodoQRYFECHAINICIAL.Value)) then
  begin
    ShowMessage('Error, fecha Fuera de Rango Del Periodo Actual!!');
    edtFecha.SetFocus;
    exit;
  end;



  if messagedlg('Guardar Documento? ',
    mtconfirmation, [mbyes, mbno], 0) = mryes then
  begin

    try

      factura.Insert;
      factura.FieldByName('fecha').Value:= strtodate(edtfecha.Text);
      factura.FieldByName('correlativo').Value := edtcorrelativo.Text;
      factura.FieldByName('codigo').Value := strtoint(edtcodigo.Text);
      factura.FieldByName('cliente').Value := strtoint(edtcliente.Text);
      factura.FieldByName('vendedor').Value := edtvendedor.Text;
      factura.FieldByName('total').Value := strtocurr(edttotal.Text);
      factura.Post;

      FACTM.Insert;
      FACTM.FieldByName('fecha').VALUE := EDTFECHA.Text;
      FACTM.FieldByName('codigo').VALUE := edtcodigo.Text;
      FACTM.FieldByName('correlativo').VALUE := edtcorrelativo.Text;
      FACTM.FieldByName('tipo').VALUE := 'FC';
      FACTM.FieldByName('plucliente').Value := PLUCLIENTE;
      FACTM.FieldByName('pluempleados').VALUE := pluvendedor;
      FACTM.FieldByName('nombre').VALUE := Label5.Caption; //nombre
      FACTM.FieldByName('esexento').VALUE := 'F';
      FACTM.FieldByName('gravado').Value := EDTTOTAL.Text;
      FACTM.FieldByName('iva').VALUE := 0;
      FACTM.FieldByName('post').VALUE := 'T';
      FACTM.FieldByName('total').VALUE := EDTTOTAL.Text;
      FACTM.FieldByName('pluempresas').VALUE := dm.EmpresaQryPLUEMPRESA.Value;
      FACTM.FieldByName('plusucursales').VALUE := DM.bodegaqryPLUBODEGA.VALUE;
      FACTM.FieldByName('flete').VALUE := 0;
      FACTM.FieldByName('pagado').VALUE := 'T';
      FACTM.FieldByName('diascredito').VALUE := 0;
      FACTM.FieldByName('legal').VALUE := 'T';
      FACTM.FieldByName('formapago').VALUE := '###';
      FACTM.FieldByName('plufacturanc').VALUE := 0;
      FACTM.FieldByName('direccion_envio').VALUE := 'SS';
      FACTM.FieldByName('CONDICIONES').AsString := 'CONT';
      FACTM.FieldByName('pendiente').VALUE := 0;
      FACTM.FieldByName('impreso').VALUE := 'S';
      FACTM.FieldByName('v_exento').VALUE := 0;
      FACTM.FieldByName('anulado').VALUE := 'N';
      FACTM.FieldByName('pc_crea').VALUE := GetPcName;
      FACTM.FieldByName('id').VALUE := DM.PeriodoQRYID.Value;
      FACTM.FieldByName('dia').VALUE := 1;//CDM.CORTEdQRYDIA.VALUE;
      FACTM.FieldByName('OBSERVACIONES').VALUE := 'NUEVA FACTURACION';
      FACTM.Post;

      if chRVend.Checked then
      begin
        if edtvendedor.Text <> '' then
          vendedor := edtvendedor.Text;
      end
      else
        edtvendedor.Text := '';

      if chkRFecha.Checked then
      begin
        if edtfecha.Text <> '' then
           fechaAnt := StrToDate(edtFecha.text);

      end
      else
      edtFecha.Text := DateToStr(date());


    except
      on e: exception do
      begin

        showmessage(e.Message);
      end;
    end; //try

    limpiar;
    edtfecha.SetFocus;
  end;

end;

procedure TfrmFC2.BitBtn3Click(Sender: TObject);
begin
   if messagedlg('Seguro que desea Cancelar Cambios? ',
    mtconfirmation, [mbyes, mbno], 0) = mryes then
  begin
    limpiar;
    edtfecha.SetFocus;
  end;
end;

procedure TfrmFC2.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmFC2.DataSource2DataChange(Sender: TObject; Field: TField);
begin

end;

procedure TfrmFC2.edtClienteKeyPress(Sender: TObject; var Key: char);
begin
    if not (key in [#8, '0'..'9']) then
  begin
    Key := #0;

    Beep;

  end;
end;

procedure TfrmFC2.limpiar();
begin

  if chkRFecha.Checked then
    //if NOT (fechaAnt > STRTODATE('01/01/2000')) then
       edtFecha.Text := DateToStr(fechaAnt)
  else
  edtFecha.Text := datetostr(date());

  edtcorrelativo.Text := correlativoQRY.FieldByName('correlativo').asstring;
  edtcodigo.Text := '';
  edtcliente.Text := '1';

  if chRVend.Checked then
    edtvendedor.Text := vendedor
  else
    edtvendedor.Text := '';
  edtTotal.text := '0.00';

  vcodigo := false;
  vcliente := false;
  vvendedor := false;

end;

initialization
  {$I ufrmfc.lrs}

end.

