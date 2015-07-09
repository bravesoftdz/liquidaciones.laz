program liquidaciones;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, forms, LResources, LiqMenuForm, RunTimeTypeInfoControls, MemDSLaz,
  DBFLaz, datetimectrls, lazreport, liqLiquidacion, liqloginform, liqdm,
  zcomponent, liqbvendedorform, liqbprodform, frametools, liqasignaform,
  liqbasignaform, Pickdate, liqdevform, liqbliqform, liqbsuperform,
  liqbtipoForm, liqdetpliqform, liqLreportes, liqsupervform, liqBsuper,
  liqtrasladoform, liqfpagosform, liqacercaform, liqevendedor, liqprogresoform,
  liqRptCuadre, LiqPendieterpt, claseaexcel, liqfaltantesform, DBUtils,
  liqasignareporte, liqbfaltanteform, liqrptFaltanteForm, liqfrmBusuarios,
  LiqfrmDexis, ufrmpsql, ufrmVerDocProcesado, ufrmFC, clfrm, ufrmBVendedor,
  ufrmMontoTes, ufrmCorrelativosVend, ufrmLiqCorFacturas;

{$IFDEF WINDOWS}{$R liquidaciones.rc}{$ENDIF}

begin
  {$I liquidaciones.lrs}
  Application.Initialize;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(Tmenufrm, menufrm);
  Application.CreateForm(Tloginfrm, loginfrm);
  Application.CreateForm(Tfrmacerca, frmacerca);
  Application.Run;
end.

