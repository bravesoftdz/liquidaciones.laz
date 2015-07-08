unit liqbprodform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DBGrids, IBQuery, IBCustomDataSet;

type

  { Tbprodfrm }

  Tbprodfrm = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edtbc: TEdit;
    edttipo: TEdit;
    ProdQRY: TIBQuery;
    Label3: TLabel;
    prodds: TDatasource;
    DBGrid1: TDBGrid;
    edtCodigo: TEdit;
    EdtNombre: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    ProdQRYBC: TIntegerField;
    ProdQRYCODIGO: TIBStringField;
    ProdQRYDESCRIPCION: TIBStringField;
    ProdQRYEXISTENCIA: TIBBCDField;
    ProdQRYPRECIO: TFloatField;
    ProdQRYPRECIODISTRIBUDOR: TFloatField;
    ProdQRYPRECIOESPECIAL: TFloatField;
    ProdQRYUNIDADMEDIDA: TIBStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edtbcChange(Sender: TObject);
    procedure edtbcKeyPress(Sender: TObject; var Key: char);
    procedure edtCodigoChange(Sender: TObject);
    procedure EdtNombreChange(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
  private
    { private declarations }
    procedure buscar;
  public
    { public declarations }
  end; 

var
  bprodfrm: Tbprodfrm;

implementation

uses liqdm, liqasignaform,liqdevform ,liqtrasladoform;

{ Tbprodfrm }

procedure Tbprodfrm.buscar;
begin

IF  edttipo.Text ='TRA' then
 BEGIN

  Prodqry.Close;
  Prodqry.SQL.Clear;
  PRODQRY.SQL.ADD('select PRODUCTO.BC AS BC,PRODUCTO.CODIGO AS CODIGO,');
  PRODQRY.SQL.ADD('PRODUCTO.DESCRIPCION AS DESCRIPCION,PRODUCTO.PRECIO AS PRECIO,');
  PRODQRY.SQL.ADD('PRODUCTO.PRECIODISTRIBUIDOR AS PRECIODISTRIBUDOR,');
  PRODQRY.SQL.ADD('PRODUCTO.PRECIOESPECIAL AS PRECIOESPECIAL,');
  PRODQRY.SQL.ADD('PRODUCTO.UNIDADMEDIDA AS UNIDADMEDIDA, B.EXISTENCIA AS EXISTENCIA');
  PRODQRY.SQL.ADD(' from PRODUCTO ');
  PRODQRY.SQL.ADD(' INNER JOIN VEND_EXISTENCIA B ON (PRODUCTO.PLUPRODUCTO=B.PLUPRODUCTO) ');
  PRODQRY.SQL.ADD(' WHERE PLUEMPRESAS='+DM.EMPRESAQRYPLUEMPRESA.ASSTRING+' AND ');
  Prodqry.SQL.Add('  B.PLUVENDEDOR=:PLUVENDEDOR AND ');
  Prodqry.SQL.Add('  PRODUCTO.PLUPRODUCTO NOT IN (SELECT DISTINCT PLUPRODUCTO FROM mov_sucursald ');
  Prodqry.SQL.Add('   where plumovsucursal=:plu) AND ');
  PRODQRY.SQL.ADD(' ACTIVO=''T'' and b.existencia>0 ORDER BY descripcion asc ');
  PRODQRY.ParamByName('PLUVENDEDOR').VALUE := liqtrasladofrm.MSUCURSALmQRYPLUEMPLEADOS.VALUE ;
  PRODQRY.ParamByName('PLU').VALUE := liqtrasladofrm.MSUCURSALMQRYPLUMOVSUCURSAL.VALUE ;
  prodqry.Open;


 end
 ELSE IF  edttipo.Text ='DEV' then
 begin

  Prodqry.Close;
  Prodqry.SQL.Clear;
  PRODQRY.SQL.ADD('select p.bc,e.codprod codigo,e.descprod descripcion,p.precio,'+
  ' P.PRECIODISTRIBUIDOR,P.PRECIOESPECIAL,P.UNIDADMEDIDA,e.inicial+e.ped_ruta existencia'+
  ' from exist_vendedor_liq e join (select pluproducto,bc,codigo,precio,preciodistribuidor,precioespecial,'+
  ' unidadmedida from producto WHERE ACTIVO=''T'') as p '+
  ' on e.pluproducto=p.pluproducto  WHERE E.PLUVENDEDOR=:PLUVENDEDOR');
  PRODQRY.ParamByName('PLUVENDEDOR').VALUE := liqdevfrm.MSUCURSALmQRYPLUEMPLEADOS.VALUE ;
  //PRODQRY.ParamByName('PLU').VALUE := liqdevfrm.MSUCURSALMQRYPLUMOVSUCURSAL.VALUE ;
  prodqry.Open;

  END
  ELSE
  BEGIN

  Prodqry.Close;
  Prodqry.SQL.Clear;
  PRODQRY.SQL.ADD('select PRODUCTO.BC AS BC,PRODUCTO.CODIGO AS CODIGO,');
  PRODQRY.SQL.ADD('PRODUCTO.DESCRIPCION AS DESCRIPCION,PRODUCTO.PRECIO AS PRECIO,');
  PRODQRY.SQL.ADD('PRODUCTO.PRECIODISTRIBUIDOR AS PRECIODISTRIBUDOR,');
  PRODQRY.SQL.ADD('PRODUCTO.PRECIOESPECIAL AS PRECIOESPECIAL,');
  PRODQRY.SQL.ADD('PRODUCTO.UNIDADMEDIDA AS UNIDADMEDIDA, PRODUCTO.EXISTENCIA AS EXISTENCIA');
  PRODQRY.SQL.ADD(' from PRODUCTO WHERE PLUEMPRESAS='+DM.EMPRESAQRYPLUEMPRESA.ASSTRING+' AND ');
  Prodqry.SQL.Add(' UPPER(codigo) like ''A%'' AND');
  PRODQRY.SQL.ADD(' ACTIVO=''T'' ORDER BY descripcion asc ');
  prodqry.Open;

 END;


end;


procedure Tbprodfrm.edtCodigoChange(Sender: TObject);
begin

 IF  EDTTIPO.Text = 'CAR' THEN
 BEGIN

     Prodqry.Close;
    Prodqry.SQL.Clear;
    PRODQRY.SQL.ADD('select PRODUCTO.BC AS BC,PRODUCTO.CODIGO AS CODIGO,');
    PRODQRY.SQL.ADD('PRODUCTO.DESCRIPCION AS DESCRIPCION,PRODUCTO.PRECIO AS PRECIO,');
    PRODQRY.SQL.ADD('PRODUCTO.PRECIODISTRIBUIDOR AS PRECIODISTRIBUDOR,');
    PRODQRY.SQL.ADD('PRODUCTO.PRECIOESPECIAL AS PRECIOESPECIAL,');
    PRODQRY.SQL.ADD('PRODUCTO.UNIDADMEDIDA AS UNIDADMEDIDA, PRODUCTO.EXISTENCIA AS EXISTENCIA');
    PRODQRY.SQL.ADD(' from PRODUCTO WHERE PLUEMPRESAS='+DM.EMPRESAQRYPLUEMPRESA.ASSTRING+' AND ');
    Prodqry.SQL.Add(' UPPER(codigo) like :codigo AND');
    PRODQRY.SQL.ADD(' ACTIVO=''T'' ORDER BY descripcion asc ');
    prodqry.ParamByName('codigo').value := edtcodigo.text+'%';
    prodqry.Open;


 end
  ELSE  if edttipo.Text ='TRA' then
 BEGIN

      Prodqry.Close;
      Prodqry.SQL.Clear;
      PRODQRY.SQL.ADD('select PRODUCTO.BC AS BC,PRODUCTO.CODIGO AS CODIGO,');
      PRODQRY.SQL.ADD('PRODUCTO.DESCRIPCION AS DESCRIPCION,PRODUCTO.PRECIO AS PRECIO,');
      PRODQRY.SQL.ADD('PRODUCTO.PRECIODISTRIBUIDOR AS PRECIODISTRIBUDOR,');
      PRODQRY.SQL.ADD('PRODUCTO.PRECIOESPECIAL AS PRECIOESPECIAL,');
      PRODQRY.SQL.ADD('PRODUCTO.UNIDADMEDIDA AS UNIDADMEDIDA, B.EXISTENCIA AS EXISTENCIA');
      PRODQRY.SQL.ADD(' from PRODUCTO ');
      PRODQRY.SQL.ADD(' INNER JOIN VEND_EXISTENCIA B ON (PRODUCTO.PLUPRODUCTO=B.PLUPRODUCTO) ');
      PRODQRY.SQL.ADD(' WHERE PLUEMPRESAS='+DM.EMPRESAQRYPLUEMPRESA.ASSTRING+' AND ');
      Prodqry.SQL.Add(' UPPER(CODIGO) like :CODIGO AND B.PLUVENDEDOR=:PLUVENDEDOR AND ');
      PRODQRY.SQL.ADD(' ACTIVO=''T'' ORDER BY descripcion asc ');
      PRODQRY.ParamByName('PLUVENDEDOR').VALUE := liqtrasladofrm.MSUCURSALmQRYPLUEMPLEADOS.VALUE ;
      prodqry.ParamByName('CODIGO').value := edtCODIGO.text+'%';
      prodqry.Open;


 end
 ELSE  if edttipo.Text ='DEV' then
 BEGIN

      {
       Prodqry.Close;
       Prodqry.SQL.Clear;
       PRODQRY.SQL.ADD('select PRODUCTO.BC AS BC,PRODUCTO.CODIGO AS CODIGO,');
       PRODQRY.SQL.ADD('PRODUCTO.DESCRIPCION AS DESCRIPCION,PRODUCTO.PRECIO AS PRECIO,');
       PRODQRY.SQL.ADD('PRODUCTO.PRECIODISTRIBUIDOR AS PRECIODISTRIBUDOR,');
       PRODQRY.SQL.ADD('PRODUCTO.PRECIOESPECIAL AS PRECIOESPECIAL,');
       PRODQRY.SQL.ADD('PRODUCTO.UNIDADMEDIDA AS UNIDADMEDIDA, B.EXISTENCIA AS EXISTENCIA');
       PRODQRY.SQL.ADD(' from PRODUCTO ');
       PRODQRY.SQL.ADD(' INNER JOIN VEND_EXISTENCIA B ON (PRODUCTO.PLUPRODUCTO=B.PLUPRODUCTO) ');
       PRODQRY.SQL.ADD(' WHERE PLUEMPRESAS='+DM.EMPRESAQRYPLUEMPRESA.ASSTRING+' AND ');
       Prodqry.SQL.Add(' UPPER(CODIGO) like :CODIGO AND B.PLUVENDEDOR=:PLUVENDEDOR AND ');
       PRODQRY.SQL.ADD(' ACTIVO=''T'' ORDER BY descripcion asc ');
       PRODQRY.ParamByName('PLUVENDEDOR').VALUE := liqdevfrm.MSUCURSALmQRYPLUEMPLEADOS.VALUE ;
       prodqry.ParamByName('CODIGO').value := edtCODIGO.text+'%';
       prodqry.Open;
      }
      Prodqry.Close;
      Prodqry.SQL.Clear;
      PRODQRY.SQL.ADD('select p.bc,e.codprod codigo,e.descprod descripcion,p.precio,'+
      ' P.PRECIODISTRIBUIDOR,P.PRECIOESPECIAL,P.UNIDADMEDIDA,e.inicial+e.ped_ruta existencia'+
      ' from exist_vendedor_liq e join (select pluproducto,bc,codigo,precio,preciodistribuidor,precioespecial,'+
      ' unidadmedida from producto WHERE ACTIVO=''T'') as p '+
      ' on e.pluproducto=p.pluproducto  WHERE UPPER(e.codprod) like :CODIGO AND  E.PLUVENDEDOR=:PLUVENDEDOR');
      PRODQRY.ParamByName('PLUVENDEDOR').VALUE := liqdevfrm.MSUCURSALmQRYPLUEMPLEADOS.VALUE ;
      prodqry.ParamByName('CODIGO').value := edtCODIGO.text+'%';
      prodqry.Open;

 end
 ELSE
 BEGIN

      Prodqry.Close;
      Prodqry.SQL.Clear;
      PRODQRY.SQL.ADD('select PRODUCTO.BC AS BC,PRODUCTO.CODIGO AS CODIGO,');
      PRODQRY.SQL.ADD('PRODUCTO.DESCRIPCION AS DESCRIPCION,PRODUCTO.PRECIO AS PRECIO,');
      PRODQRY.SQL.ADD('PRODUCTO.PRECIODISTRIBUIDOR AS PRECIODISTRIBUDOR,');
      PRODQRY.SQL.ADD('PRODUCTO.PRECIOESPECIAL AS PRECIOESPECIAL,');
      PRODQRY.SQL.ADD('PRODUCTO.UNIDADMEDIDA AS UNIDADMEDIDA, B.EXISTENCIA AS EXISTENCIA');
      PRODQRY.SQL.ADD(' from PRODUCTO ');
      PRODQRY.SQL.ADD(' INNER JOIN VEND_EXISTENCIA B ON (PRODUCTO.PLUPRODUCTO=B.PLUPRODUCTO) ');
      PRODQRY.SQL.ADD(' WHERE PLUEMPRESAS='+DM.EMPRESAQRYPLUEMPRESA.ASSTRING+' AND ');
      Prodqry.SQL.Add(' UPPER(CODIGO) like :BC AND B.PLUVENDEDOR=:PLUVENDEDOR AND ');
      PRODQRY.SQL.ADD(' ACTIVO=''T'' ORDER BY descripcion asc ');
      PRODQRY.ParamByName('PLUVENDEDOR').VALUE := liqdevfrm.MSUCURSALmQRYPLUEMPLEADOS.VALUE ;
      prodqry.ParamByName('CODIGO').value := edtCODIGO.text+'%';
      prodqry.Open;


 end;




end;

procedure Tbprodfrm.BitBtn1Click(Sender: TObject);
var
item:integer;
begin

       if prodqry.IsEmpty then
       exit;

     if edttipo.Text ='CAR' then
     begin
       dm.myqry.close;
       dm.myqry.sql.clear;
       dm.myqry.sql.add('select max(item) item from mov_sucursald where plumovsucursal=:plu');
       dm.myqry.parambyname('plu').value := liqasignafrm.MSUCURSALmQRYplumovsucursal.Value;
       dm.myqry.Open;

       //liqasignafrm.MSUCURSALDQRY.First;
       if dm.myqry.fieldbyname('item').value>0 then
       begin
          item := dm.myqry.fieldbyname('item').value;
          liqasignafrm.MSUCURSALDQRY.locate('item',item,[]);
       end;

      // liqasignafrm.MSUCURSALDQRY.Last;
       liqasignafrm.MSUCURSALDQRY.Insert;
       liqasignafrm.MSUCURSALDQRYCODIGO.Value :=  prodqrycodigo.Value;
   end
   else if edttipo.Text ='DEV' then
   begin
     dm.myqry.close;
       dm.myqry.sql.clear;
       dm.myqry.sql.add('select max(item) item from mov_sucursald where plumovsucursal=:plu');
       dm.myqry.parambyname('plu').value := liqdevfrm.MSUCURSALmQRYplumovsucursal.Value;
       dm.myqry.Open;

       //liqasignafrm.MSUCURSALDQRY.First;
       if dm.myqry.fieldbyname('item').value>0 then
       begin
          item := dm.myqry.fieldbyname('item').value;
          liqdevfrm.MSUCURSALDQRY.locate('item',item,[]);
       end;

      // liqasignafrm.MSUCURSALDQRY.Last;
       liqdevfrm.MSUCURSALDQRY.Insert;
       liqdevfrm.MSUCURSALDQRYCODIGO.Value :=  prodqrycodigo.Value;

   end
   else if edttipo.Text ='TRA' then
   begin

       dm.myqry.close;
       dm.myqry.sql.clear;
       dm.myqry.sql.add('select max(item) item from mov_sucursald where plumovsucursal=:plu');
       dm.myqry.parambyname('plu').value := liqtrasladofrm.MSUCURSALmQRYplumovsucursal.Value;
       dm.myqry.Open;

       //liqasignafrm.MSUCURSALDQRY.First;
       if dm.myqry.fieldbyname('item').value>0 then
       begin
          item := dm.myqry.fieldbyname('item').value;
           liqtrasladofrm.MSUCURSALDQRY.locate('item',item,[]);
       end;

      // liqasignafrm.MSUCURSALDQRY.Last;
       liqtrasladofrm.MSUCURSALDQRY.Insert;
       liqtrasladofrm.MSUCURSALDQRYCODIGO.Value :=  prodqrycodigo.Value;
       BUSCAR;
   end;

   if MessageDlg('Insertar Otro Producto..?',
                mtConfirmation, [mbYes, mbNo], 0) = mrNo then
   begin

         ModalResult := mrOk;

   end;

end;

procedure Tbprodfrm.DBGrid1DblClick(Sender: TObject);
begin
    BITBTN1.Click;
end;

procedure Tbprodfrm.edtbcChange(Sender: TObject);
begin

 IF  EDTTIPO.Text = 'CAR' THEN
 BEGIN

     Prodqry.Close;
    Prodqry.SQL.Clear;
    PRODQRY.SQL.ADD('select PRODUCTO.BC AS BC,PRODUCTO.CODIGO AS CODIGO,');
    PRODQRY.SQL.ADD('PRODUCTO.DESCRIPCION AS DESCRIPCION,PRODUCTO.PRECIO AS PRECIO,');
    PRODQRY.SQL.ADD('PRODUCTO.PRECIODISTRIBUIDOR AS PRECIODISTRIBUDOR,');
    PRODQRY.SQL.ADD('PRODUCTO.PRECIOESPECIAL AS PRECIOESPECIAL,');
    PRODQRY.SQL.ADD('PRODUCTO.UNIDADMEDIDA AS UNIDADMEDIDA, PRODUCTO.EXISTENCIA AS EXISTENCIA');
    PRODQRY.SQL.ADD(' from PRODUCTO WHERE PLUEMPRESAS='+DM.EMPRESAQRYPLUEMPRESA.ASSTRING+' AND ');
    Prodqry.SQL.Add(' UPPER(BC) like :BC AND');
    PRODQRY.SQL.ADD(' ACTIVO=''T''  ORDER BY descripcion asc ');
    prodqry.ParamByName('BC').value := edtBC.text+'%';
    prodqry.Open;


 end
 ELSE  if edttipo.Text ='TRA' then
 BEGIN

      Prodqry.Close;
      Prodqry.SQL.Clear;
      PRODQRY.SQL.ADD('select PRODUCTO.BC AS BC,PRODUCTO.CODIGO AS CODIGO,');
      PRODQRY.SQL.ADD('PRODUCTO.DESCRIPCION AS DESCRIPCION,PRODUCTO.PRECIO AS PRECIO,');
      PRODQRY.SQL.ADD('PRODUCTO.PRECIODISTRIBUIDOR AS PRECIODISTRIBUDOR,');
      PRODQRY.SQL.ADD('PRODUCTO.PRECIOESPECIAL AS PRECIOESPECIAL,');
      PRODQRY.SQL.ADD('PRODUCTO.UNIDADMEDIDA AS UNIDADMEDIDA, B.EXISTENCIA AS EXISTENCIA');
      PRODQRY.SQL.ADD(' from PRODUCTO ');
      PRODQRY.SQL.ADD(' INNER JOIN VEND_EXISTENCIA B ON (PRODUCTO.PLUPRODUCTO=B.PLUPRODUCTO) ');
      PRODQRY.SQL.ADD(' WHERE PLUEMPRESAS='+DM.EMPRESAQRYPLUEMPRESA.ASSTRING+' AND ');
      Prodqry.SQL.Add(' UPPER(BC) like :BC AND B.PLUVENDEDOR=:PLUVENDEDOR AND ');
      PRODQRY.SQL.ADD(' ACTIVO=''T'' AND B.EXISTENCIA>0 ORDER BY descripcion asc ');
      PRODQRY.ParamByName('PLUVENDEDOR').VALUE := liqtrasladofrm.MSUCURSALmQRYPLUEMPLEADOS.VALUE ;
      prodqry.ParamByName('BC').value := edtbc.text+'%';
      prodqry.Open;


 end
 ELSE  if edttipo.Text ='DEV' then
 BEGIN

      {
       Prodqry.Close;
       Prodqry.SQL.Clear;
       PRODQRY.SQL.ADD('select PRODUCTO.BC AS BC,PRODUCTO.CODIGO AS CODIGO,');
       PRODQRY.SQL.ADD('PRODUCTO.DESCRIPCION AS DESCRIPCION,PRODUCTO.PRECIO AS PRECIO,');
       PRODQRY.SQL.ADD('PRODUCTO.PRECIODISTRIBUIDOR AS PRECIODISTRIBUDOR,');
       PRODQRY.SQL.ADD('PRODUCTO.PRECIOESPECIAL AS PRECIOESPECIAL,');
       PRODQRY.SQL.ADD('PRODUCTO.UNIDADMEDIDA AS UNIDADMEDIDA, B.EXISTENCIA AS EXISTENCIA');
       PRODQRY.SQL.ADD(' from PRODUCTO ');
       PRODQRY.SQL.ADD(' INNER JOIN VEND_EXISTENCIA B ON (PRODUCTO.PLUPRODUCTO=B.PLUPRODUCTO) ');
       PRODQRY.SQL.ADD(' WHERE PLUEMPRESAS='+DM.EMPRESAQRYPLUEMPRESA.ASSTRING+' AND ');
       Prodqry.SQL.Add(' UPPER(BC) like :BC AND B.PLUVENDEDOR=:PLUVENDEDOR AND ');
       PRODQRY.SQL.ADD(' ACTIVO=''T'' AND B.EXISTENCIA>0 ORDER BY descripcion asc ');
       PRODQRY.ParamByName('PLUVENDEDOR').VALUE := liqdevfrm.MSUCURSALmQRYPLUEMPLEADOS.VALUE ;
       prodqry.ParamByName('BC').value := edtbc.text+'%';
       prodqry.Open;
      }

      Prodqry.Close;
      Prodqry.SQL.Clear;
      PRODQRY.SQL.ADD('select p.bc,e.codprod codigo,e.descprod descripcion,p.precio,'+
      ' P.PRECIODISTRIBUIDOR,P.PRECIOESPECIAL,P.UNIDADMEDIDA,e.inicial+e.ped_ruta existencia'+
      ' from exist_vendedor_liq e join (select pluproducto,bc,codigo,precio,preciodistribuidor,precioespecial,'+
      ' unidadmedida from producto WHERE ACTIVO=''T'') as p '+
      ' on e.pluproducto=p.pluproducto  WHERE UPPER(p.bc) like :BC AND E.PLUVENDEDOR=:PLUVENDEDOR');
      PRODQRY.ParamByName('PLUVENDEDOR').VALUE := liqdevfrm.MSUCURSALmQRYPLUEMPLEADOS.VALUE ;
      prodqry.ParamByName('BC').value := edtbc.text+'%';
      prodqry.Open;


 end;

end;

procedure Tbprodfrm.edtbcKeyPress(Sender: TObject; var Key: char);
begin
  // #8 is Backspace
  if not (Key in [#8, '0'..'9']) then begin
   // ShowMessage('Invalid key');
    // Discard the key
    Key := #0;
  end;

end;

procedure Tbprodfrm.EdtNombreChange(Sender: TObject);
begin

 IF  EDTTIPO.Text = 'CAR' THEN
 BEGIN

    Prodqry.Close;
    Prodqry.SQL.Clear;
    PRODQRY.SQL.ADD('select PRODUCTO.BC AS BC,PRODUCTO.CODIGO AS CODIGO,');
    PRODQRY.SQL.ADD('PRODUCTO.DESCRIPCION AS DESCRIPCION,PRODUCTO.PRECIO AS PRECIO,');
    PRODQRY.SQL.ADD('PRODUCTO.PRECIODISTRIBUIDOR AS PRECIODISTRIBUDOR,');
    PRODQRY.SQL.ADD('PRODUCTO.PRECIOESPECIAL AS PRECIOESPECIAL,');
    PRODQRY.SQL.ADD('PRODUCTO.UNIDADMEDIDA AS UNIDADMEDIDA, PRODUCTO.EXISTENCIA AS EXISTENCIA');
    PRODQRY.SQL.ADD(' from PRODUCTO WHERE PLUEMPRESAS='+DM.EMPRESAQRYPLUEMPRESA.ASSTRING+' AND ');
    Prodqry.SQL.Add(' UPPER(descripcion) like :cdesc  AND');
    PRODQRY.SQL.ADD(' ACTIVO=''T'' ORDER BY descripcion asc ');
    prodqry.ParamByName('cdesc').value := edtnombre.text+'%';
    prodqry.Open;

 end
 ELSE  if edttipo.Text ='TRA' then
 BEGIN

      Prodqry.Close;
      Prodqry.SQL.Clear;
      PRODQRY.SQL.ADD('select PRODUCTO.BC AS BC,PRODUCTO.CODIGO AS CODIGO,');
      PRODQRY.SQL.ADD('PRODUCTO.DESCRIPCION AS DESCRIPCION,PRODUCTO.PRECIO AS PRECIO,');
      PRODQRY.SQL.ADD('PRODUCTO.PRECIODISTRIBUIDOR AS PRECIODISTRIBUDOR,');
      PRODQRY.SQL.ADD('PRODUCTO.PRECIOESPECIAL AS PRECIOESPECIAL,');
      PRODQRY.SQL.ADD('PRODUCTO.UNIDADMEDIDA AS UNIDADMEDIDA, B.EXISTENCIA AS EXISTENCIA');
      PRODQRY.SQL.ADD(' from PRODUCTO ');
      PRODQRY.SQL.ADD(' INNER JOIN VEND_EXISTENCIA B ON (PRODUCTO.PLUPRODUCTO=B.PLUPRODUCTO) ');
      PRODQRY.SQL.ADD(' WHERE PLUEMPRESAS='+DM.EMPRESAQRYPLUEMPRESA.ASSTRING+' AND ');
      Prodqry.SQL.Add(' UPPER(DESCRIPCION) like :DESC AND B.PLUVENDEDOR=:PLUVENDEDOR AND ');
      PRODQRY.SQL.ADD(' ACTIVO=''T'' AND B.EXISTENCIA>0 ORDER BY descripcion asc ');
      PRODQRY.ParamByName('PLUVENDEDOR').VALUE := liqtrasladofrm.MSUCURSALmQRYPLUEMPLEADOS.VALUE ;
      prodqry.ParamByName('DESC').value := edtNombre.text+'%';
      prodqry.Open;


 end
 ELSE  if edttipo.Text ='DEV' then
 BEGIN

      {
       Prodqry.Close;
       Prodqry.SQL.Clear;
       PRODQRY.SQL.ADD('select PRODUCTO.BC AS BC,PRODUCTO.CODIGO AS CODIGO,');
       PRODQRY.SQL.ADD('PRODUCTO.DESCRIPCION AS DESCRIPCION,PRODUCTO.PRECIO AS PRECIO,');
       PRODQRY.SQL.ADD('PRODUCTO.PRECIODISTRIBUIDOR AS PRECIODISTRIBUDOR,');
       PRODQRY.SQL.ADD('PRODUCTO.PRECIOESPECIAL AS PRECIOESPECIAL,');
       PRODQRY.SQL.ADD('PRODUCTO.UNIDADMEDIDA AS UNIDADMEDIDA, B.EXISTENCIA AS EXISTENCIA');
       PRODQRY.SQL.ADD(' from PRODUCTO ');
       PRODQRY.SQL.ADD(' INNER JOIN VEND_EXISTENCIA B ON (PRODUCTO.PLUPRODUCTO=B.PLUPRODUCTO) ');
       PRODQRY.SQL.ADD(' WHERE PLUEMPRESAS='+DM.EMPRESAQRYPLUEMPRESA.ASSTRING+' AND ');
       Prodqry.SQL.Add(' UPPER(descripcion) like :desc AND B.PLUVENDEDOR=:PLUVENDEDOR AND ');
       PRODQRY.SQL.ADD(' ACTIVO=''T'' AND B.EXISTENCIA>0 ORDER BY descripcion asc ');
       PRODQRY.ParamByName('PLUVENDEDOR').VALUE := liqdevfrm.MSUCURSALmQRYPLUEMPLEADOS.VALUE ;
       prodqry.ParamByName('desc').value := edtNombre.text+'%';
       prodqry.Open;
      }

      Prodqry.Close;
      Prodqry.SQL.Clear;
      PRODQRY.SQL.ADD('select p.bc,e.codprod codigo,e.descprod descripcion,p.precio,'+
      ' P.PRECIODISTRIBUIDOR,P.PRECIOESPECIAL,P.UNIDADMEDIDA,e.inicial+e.ped_ruta existencia'+
      ' from exist_vendedor_liq e join (select pluproducto,bc,codigo,precio,preciodistribuidor,precioespecial,'+
      ' unidadmedida from producto WHERE ACTIVO=''T'') as p '+
      ' on e.pluproducto=p.pluproducto  WHERE UPPER(e.descprod) like :desc AND E.PLUVENDEDOR=:PLUVENDEDOR');
      PRODQRY.ParamByName('PLUVENDEDOR').VALUE := liqdevfrm.MSUCURSALmQRYPLUEMPLEADOS.VALUE ;
      prodqry.ParamByName('desc').value := edtNombre.text+'%';
      prodqry.Open;


 end;




end;

procedure Tbprodfrm.Panel1Click(Sender: TObject);
begin

end;

initialization
  {$I liqbprodform.lrs}

end.

