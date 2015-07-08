unit LiqMenuForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  ComCtrls, Buttons, Menus, ExtCtrls, StdCtrls, DbCtrls, RTTICtrls,messages,
  ToolWin,LCLType,  EditBtn,   ExtDlgs, Process;


type

  { Tmenufrm }

  Tmenufrm = class(TForm)
    Acerca1: TMenuItem;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    PopupMenu1: TPopupMenu;
    SpeedButton16: TSpeedButton;
    BtnTraslado: TSpeedButton;
    super1: TMenuItem;
    TrayIcon1: TTrayIcon;
    Vendedor1: TMenuItem;
    Vende2: TMenuItem;
    Liquida: TMenuItem;
    Asigna1: TMenuItem;
    CreditosCancelados1: TMenuItem;
    Dev1: TMenuItem;
    Estadistica1: TMenuItem;
    MainMenu1: TMainMenu;
    Mantenimiento1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Parametros1: TMenuItem;
    Liq1: TMenuItem;
    Procesos1: TMenuItem;
    Bodega1: TMenuItem;
    Reportes1: TMenuItem;
    Salir1: TMenuItem;
    SpeedButton1: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton9: TSpeedButton;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    Usuarios1: TMenuItem;
    Label1: TLabel;
    procedure Acerca1Click(Sender: TObject);
    procedure AntiguedaddeSaldos1Click(Sender: TObject);
    procedure Asigna1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Bodega1Click(Sender: TObject);
    procedure CreditosCancelados1Click(Sender: TObject);
    procedure Dev1Click(Sender: TObject);
    procedure Estadistica1Click(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Liq1Click(Sender: TObject);
    procedure ListadodeClientes1Click(Sender: TObject);
    procedure Mantenimiento1Click(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem23Click(Sender: TObject);
    procedure MenuItem25Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure super1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ToolBar1Click(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
    procedure Vendedor1Click(Sender: TObject);
    procedure Salir1Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private
    { private declarations }
  public    { public declarations }
   // procedure compruebatecla(key:char):char;
   //function compruebatecla(key:char):char;
   procedure salir(Sender: TObject);
   procedure entrar(Sender: TObject);

  end; 

var
  menufrm: Tmenufrm;
  GSBD ,GSREPORTES,GSLASTUSER,GSSERVER,GTES: string;
  GSLogin: boolean;
  //variables para formularios de busqueda
  GBLCODIGO,GBLVENDEDOR:string;// busqueda de liquidaciones
  GBACODIGO,GBAVENDEDOR:string;
  GNSUCURSAL:integer;
  serverClave:string;

implementation

uses liqasignaform,
     liqloginform,
     liqdm,
     liqdevform,
     liqLiquidacion,
     liqLreportes,
     liqsupervform,
     liqtrasladoform,
     liqfpagosform,
     procesos,
     liqacercaForm,
     liqEVendedor,
     liqRptCuadre,
     LiqPendieterpt,
     liqfaltantesform,
     liqasignareporte,
     liqrptfaltanteform,
     ufrmpsql, ufrmFC,
     ufrmVerDocProcesado,
     ufrmRptLiquidacionVend,
     ufrmRptLiqVendExis;

{ Tmenufrm }


procedure Tmenufrm.entrar(Sender: TObject);
begin

  if sender is TDBEdit   then
  BEGIN
  TDBEdit(sender).Color := $0080FFFF;
  TDBEdit(sender).SelStart:=0;
  END
  else if sender is TDBCombobox then
  begin
  TDBCombobox(sender).Color:= $0080FFFF;
  TDBCombobox(sender).SelStart:= 0;

  end
  else if sender is TDBMemo then
  begin
  TDBMemo(sender).Color:=  $0080FFFF;
  TDBMemo(sender).SelStart:= 0;

  end
  else if sender is TDBlookupcombobox then
  begin
  TDBlookupcombobox(sender).Color:=  $0080FFFF;
  TDBlookupcombobox(sender).SelStart:= 0;

  end;

end;

procedure Tmenufrm.salir(Sender: TObject);
begin

  if sender is TDBEdit then  TDBEdit(sender).color := clwindow
  else if sender is TDBCombobox then  TDBCombobox(sender).Color := clwindow
  else if sender is TDBMemo then  TDBMemo(sender).Color:= clwindow
  else if sender is TDBlookupcombobox then  TDBlookupcombobox(sender).Color:= clwindow;


end;


procedure Tmenufrm.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

procedure Tmenufrm.Label1Click(Sender: TObject);
begin
   
    application.Createform(TfrmRptPendLiq,frmRptPendLiq);
    frmRptPendLiq.show;

end;

procedure Tmenufrm.Salir1Click(Sender: TObject);
begin
  close;
end;

procedure Tmenufrm.Vendedor1Click(Sender: TObject);
begin

  application.CreateForm(TliqEVendedorfrm,liqEVendedorfrm);
  liqEVendedorfrm.show;

end;

procedure Tmenufrm.ToolBar1Click(Sender: TObject);
begin
 // Application.OnMessage :=  AppMessage;
end;

procedure Tmenufrm.TrayIcon1Click(Sender: TObject);
begin

end;

procedure Tmenufrm.Liq1Click(Sender: TObject);
begin

  if permisos(dm.UserQRYPLUPERFIL.Value,72)='S' then
  begin

  application.CreateForm(TliquidFRM,liquidFRM);
  liquidFRM.show;

  end
  ELSE
  SHOWMESSAGE('Opcion no Autorizada!!!');

end;

procedure Tmenufrm.ListadodeClientes1Click(Sender: TObject);
begin

end;

procedure Tmenufrm.Mantenimiento1Click(Sender: TObject);
begin

end;

procedure Tmenufrm.MenuItem10Click(Sender: TObject);
begin

  application.CreateForm(Tliqasignarpt,liqasignarpt);
  liqasignarpt.show;

end;

procedure Tmenufrm.MenuItem12Click(Sender: TObject);
begin
  application.createform(Tliqrptfaltantefrm,liqrptfaltantefrm);
  liqrptfaltantefrm.show;
end;

procedure Tmenufrm.MenuItem15Click(Sender: TObject);
begin
      if permisos(dm.UserQRYPLUPERFIL.Value,84)='S' then
      begin

      Application.CreateForm(TfrmVerDocProcesado,frmVerDocProcesado);
      frmVerDocProcesado.show;


      end
      ELSE
      SHOWMESSAGE('Opcion no Autorizada!!!');

end;

procedure Tmenufrm.MenuItem16Click(Sender: TObject);
begin

  if permisos(dm.UserQRYPLUPERFIL.Value,62)='S' then
  begin

  application.CreateForm(TfrmFC2,frmFC2);
  frmFC2.show;

  end
  ELSE
  SHOWMESSAGE('Opcion no Autorizada!!!');


end;

procedure Tmenufrm.MenuItem1Click(Sender: TObject);
begin

  if permisos(dm.UserQRYPLUPERFIL.Value,70)='S' then
begin

  application.CreateForm(Tliqtrasladofrm,liqtrasladofrm);
  liqtrasladofrm.showmodal;

end
ELSE
SHOWMESSAGE('Opcion no Autorizada!!!');

end;

procedure Tmenufrm.MenuItem23Click(Sender: TObject);
begin
  Application.CreateForm(tfrmRptLiquidacionVend,frmRptLiquidacionVend);
  frmRptLiquidacionVend.SHOW;
end;

procedure Tmenufrm.MenuItem25Click(Sender: TObject);
begin
    Application.CreateForm(tfrmRptLiqVendExis,frmRptLiqVendExis);
    frmRptLiqVendExis.SHOW;
end;

procedure Tmenufrm.MenuItem2Click(Sender: TObject);
begin

  if permisos(dm.UserQRYPLUPERFIL.Value,71)='S' then
begin

  application.createform(TliqpagosFrm,liqpagosFrm);
  liqpagosFrm.show;


end;

end;

procedure Tmenufrm.MenuItem5Click(Sender: TObject);
begin
  application.createform(TfrmRptCuadre,frmRptCuadre);
  frmRptCuadre.show;
end;

procedure Tmenufrm.MenuItem7Click(Sender: TObject);
begin
    application.Createform(TfrmRptPendLiq,frmRptPendLiq);
    frmRptPendLiq.show;
end;

procedure Tmenufrm.MenuItem8Click(Sender: TObject);
begin

  if permisos(dm.UserQRYPLUPERFIL.Value,72)='S' then
  begin

  application.CreateForm(Tliqfaltantefrm,liqfaltantefrm);
  liqfaltantefrm.show;

  end
  ELSE
  SHOWMESSAGE('Opcion no Autorizada!!!');

end;

procedure Tmenufrm.N5Click(Sender: TObject);
begin

end;

procedure Tmenufrm.SpeedButton6Click(Sender: TObject);
begin

end;

procedure Tmenufrm.super1Click(Sender: TObject);
begin

if permisos(dm.UserQRYPLUPERFIL.Value,67)='S' then
begin

  application.createform(TfrmSupervisor,frmSupervisor);
  frmSupervisor.show;


end
ELSE
SHOWMESSAGE('Opcion no Autorizada!!!');

end;

procedure Tmenufrm.Timer1Timer(Sender: TObject);
begin
 
 statusbar1.Panels[3].text := timetostr(now);
 
end;

procedure Tmenufrm.Asigna1Click(Sender: TObject);
begin

  if permisos(dm.UserQRYPLUPERFIL.Value,68)='S' then
  begin

    application.createform(Tliqasignafrm,liqasignafrm);
  liqasignafrm.ShowModal;

  end
  ELSE
  SHOWMESSAGE('Opcion no Autorizada!!!');


end;

procedure Tmenufrm.BitBtn1Click(Sender: TObject);
begin
  application.createform(tfrmpsql,frmpsql);
  frmpsql.show;
end;

procedure Tmenufrm.Acerca1Click(Sender: TObject);
begin
 frmacerca.show;
end;

procedure Tmenufrm.AntiguedaddeSaldos1Click(Sender: TObject);
begin

end;

procedure Tmenufrm.Bodega1Click(Sender: TObject);
begin

end;

procedure Tmenufrm.CreditosCancelados1Click(Sender: TObject);
begin

end;

procedure Tmenufrm.Dev1Click(Sender: TObject);
begin

  if permisos(dm.UserQRYPLUPERFIL.Value,69)='S' then
  begin

    application.CreateForm(Tliqdevfrm,liqdevfrm);
    liqdevfrm.showmodal;

  end
  ELSE
  SHOWMESSAGE('Opcion no Autorizada!!!');

end;

procedure Tmenufrm.Estadistica1Click(Sender: TObject);
begin

  application.createform(TliqRptfrm,liqRptfrm);
  liqRptfrm.show;

end;

procedure Tmenufrm.FormClick(Sender: TObject);
begin

end;

procedure Tmenufrm.FormCreate(Sender: TObject);
begin

end;

procedure Tmenufrm.FormShow(Sender: TObject);
begin

   frmacerca.show;

   loginfrm.showmodal;

   if not GSLogin then close;

   statusbar1.Panels[1].Text := dm.userqryusuario.asstring;
   statusbar1.panels[2].Text := datetostr(now);
   statusbar1.panels[4].Text := DM.BodegaQRYCODIGO.ASSTRING;
   statusbar1.Panels[5].Text := dm.fbDB.DatabaseName;
end;

procedure Tmenufrm.SpeedButton10Click(Sender: TObject);
begin

end;


initialization
  {$I liqmenuform.lrs}

end.

