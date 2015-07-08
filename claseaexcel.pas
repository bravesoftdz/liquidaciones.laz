unit claseaexcel;

{$mode objfpc}{$H+}

interface

uses
 SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, LResources,ibquery,db;

type TAExcel =  class(TObject)
 // private

  public
  mDataset              :Tibquery;
   nombre                :string;
  //==property getDataset      : TzQuery read mDataset;
  //property setDataset      : TzQuery write mDataset;
 // property GetNomFile    : String read nombre;
  //property SetNomFile    : String write nombre;
  constructor Create();
  destructor Destroy; override;
  procedure exportar;
  private
  procedure XlsBeginStream(XlsStream: TStream; const BuildNumber: Word);
  procedure XlsEndStream(XlsStream: TStream);
  procedure XlsWriteCellRk(XlsStream: TStream;const ACol, ARow: Word;
                           const AValue: Integer);
  procedure XlsWriteCellLabel(XlsStream: TStream;
                       const ACol, ARow: Word;
                            const AValue: string);
  procedure XlsWriteCellNumber(XlsStream: TStream;
                             const ACol, ARow: Word;
                             const AValue: Double);
  procedure anchoQRY();



end ;

var
  CXlsBof   : array[0..5] of Word = ($809, 8, 00, $10, 0, 0);
  CXlsEof   : array[0..1] of Word = ($0A, 00);
  CXlsLabel : array[0..5] of Word = ($204, 0, 0, 0, 0, 0);
  CXlsNumber: array[0..4] of Word = ($203, 14, 0, 0, 0);
  CXlsRk    : array[0..4] of Word = ($27E, 10, 0, 0, 0);
  columnas,filas :integer;

implementation

{ TAExcel }


destructor TAExcel.Destroy;
begin

    inherited destroy;
end;

constructor TAExcel.Create();
begin

End;

procedure TAExcel.XlsBeginStream(XlsStream: TStream; const BuildNumber: Word);
begin
//  CXlsBof[4] := BuildNumber;
  XlsStream.WriteBuffer(CXlsBof, SizeOf(CXlsBof));
end;

procedure TAExcel.XlsEndStream(XlsStream: TStream);
begin
  XlsStream.WriteBuffer(CXlsEof, SizeOf(CXlsEof));
end;


procedure TAExcel.XlsWriteCellRk(XlsStream: TStream;
                           const ACol, ARow: Word;
                           const AValue: Integer);
var
  V: Integer;
begin
  CXlsRk[2] := ARow;
  CXlsRk[3] := ACol;
  XlsStream.WriteBuffer(CXlsRk, SizeOf(CXlsRk));
  V := (AValue shl 2) or 2;
  XlsStream.WriteBuffer(V, 4);
end;

procedure TAExcel.XlsWriteCellNumber(XlsStream: TStream;
                             const ACol, ARow: Word;
                             const AValue: Double);
begin
  CXlsNumber[2] := ARow;
  CXlsNumber[3] := ACol;
  XlsStream.WriteBuffer(CXlsNumber, SizeOf(CXlsNumber));
  XlsStream.WriteBuffer(AValue, 8);
end;

procedure TAExcel.anchoQRY();
begin

    columnas := mDataset.RecordCount;
    filas    := mDataset.FieldCount;

end;

procedure TAExcel.XlsWriteCellLabel(XlsStream: TStream;
                            const ACol, ARow: Word;
                            const AValue: string);
var
  L: Word;
begin

  L := Length(AValue);
  CXlsLabel[1] := 8 + L;
  CXlsLabel[2] := ARow;
  CXlsLabel[3] := ACol;
  CXlsLabel[5] := L;
  XlsStream.WriteBuffer(CXlsLabel, SizeOf(CXlsLabel));
  XlsStream.WriteBuffer(Pointer(AValue)^, L);

end;


procedure TAExcel.exportar;
var
  aa : string ;
  FStream: TFileStream;
  I, J: Integer;
  campo,campo_old:string;
  tipo:string;
begin
  // Nombre y trayectoria que tendrá la hoja de cálculo
  //aa := ExtractFilePath( Application.ExeName ) + trim ( Nombre ) + '.xls' ;
  aa := trim(nombre);
  AnchoQRy;
  FStream := TFileStream.Create( aa, fmCreate);
  try
    XlsBeginStream(FStream, 0);
    mdataset.First;

    //encabezados
    for j:=0 to mdataset.FieldCount-1 do
    BEGIN
       XlsWriteCellLabel(FStream, j, 0, mdataset.Fields[j].DisplayName);
    END;

    WHILE NOT mdataset.EOF do
    begin

       j:= mdataset.RecNo;
       for i:=0 to mdataset.FieldCount-1 do
       begin

       {  if   mdataset.Fields[i].DataType= ftString then
              XlsWriteCellLabel(FStream, i, j, mdataset.Fields[i].AsString); }
         {in ( ftString, ftSmallint, ftInteger, ftWord,
    ftBoolean, ftFloat, ftCurrency, ftBCD, ftDate, ftTime, ftDateTime,
    ftBytes, ftVarBytes, ftAutoInc, ftBlob, ftMemo, ftGraphic, ftFmtMemo,
    ftParadoxOle, ftDBaseOle, ftTypedBinary, ftCursor, ftFixedChar, ftWideString,
    ftLargeint, ftADT, ftArray, ftReference, ftDataSet, ftOraBlob, ftOraClob,
    ftVariant, ftInterface, ftIDispatch, ftGuid, ftTimeStamp, ftFMTBcd,ftUnknown) then
          XlsWriteCellLabel(FStream, i, j, mdataset.Fields[i].AsString);}



         if mdataset.Fields[i].DataType in [ftFloat,ftCurrency]  then
           XlsWriteCellNumber(FStream, i, j, mdataset.Fields[i].Value)
          else
          XlsWriteCellLabel(FStream, i, j, mdataset.Fields[i].AsString);
       end;

         //  subtot := subtot + mdataset.Fields[6].Value;
         //total  := total + subtot;

         //campo_old := campo;
        mdataset.Next;



    end;

   // XlsWriteCellLabel (FStream, 5,j+2, 'Total');
   // XlsWriteCellNumber(FStream, 6,j+2, total);

    XlsEndStream(FStream);

  finally
    FStream.Free;
  end;



 // Carga la hoja de cálculo recien creada
 // ShellExecute(Handle,nil, PChar( aa ), '', '',SW_SHOWNORMAL) ;

end;


end.

