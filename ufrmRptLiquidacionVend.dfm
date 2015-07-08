object frmRptLiquidacionVend: TfrmRptLiquidacionVend
  Left = 468
  Top = 179
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Reportes de Vendedores'
  ClientHeight = 196
  ClientWidth = 325
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 6
    Top = 9
    Width = 234
    Height = 72
  end
  object Label4: TLabel
    Left = 14
    Top = 23
    Width = 34
    Height = 13
    Caption = 'Desde:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 14
    Top = 44
    Width = 28
    Height = 13
    Caption = 'Hasta'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label1: TLabel
    Left = 7
    Top = 103
    Width = 49
    Height = 13
    Caption = 'Vendedor:'
  end
  object BitBtn1: TBitBtn
    Left = 18
    Top = 153
    Width = 75
    Height = 25
    Caption = 'Generar'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object dtp1: TDateTimePicker
    Left = 76
    Top = 18
    Width = 153
    Height = 21
    CalAlignment = dtaLeft
    CalColors.TitleBackColor = clBlue
    Date = 38138.3994944444
    Time = 38138.3994944444
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
  end
  object dtp2: TDateTimePicker
    Left = 76
    Top = 44
    Width = 152
    Height = 21
    CalAlignment = dtaLeft
    CalColors.TitleBackColor = clBlue
    Date = 38138.3996004977
    Time = 38138.3996004977
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
  end
  object BitBtn2: TBitBtn
    Left = 214
    Top = 154
    Width = 66
    Height = 22
    Caption = '&Salir'
    TabOrder = 3
    OnClick = BitBtn2Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
  end
  object cmbVendedor: TDBLookupComboBox
    Left = 8
    Top = 120
    Width = 305
    Height = 19
    Ctl3D = False
    Enabled = False
    KeyField = 'PLUEMPLEADOS'
    ListField = 'NOMBRE'
    ListSource = VEndDS
    ParentCtl3D = False
    TabOrder = 4
  end
  object chCheck: TCheckBox
    Left = 8
    Top = 88
    Width = 97
    Height = 17
    Caption = 'Todos'
    TabOrder = 5
  end
  object vendQRY: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select pluempleados,nombre from empleados'
      ' where pluempresas=:pluempresa'
      ' and activo='#39'T'#39)
    Left = 230
    Top = 75
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pluempresa'
        ParamType = ptUnknown
      end>
    object vendQRYPLUEMPLEADOS: TIntegerField
      FieldName = 'PLUEMPLEADOS'
      Origin = 'EMPLEADOS.PLUEMPLEADOS'
      Required = True
    end
    object vendQRYNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'EMPLEADOS.NOMBRE'
      Size = 60
    end
  end
  object VEndDS: TDataSource
    DataSet = vendQRY
    Left = 237
    Top = 82
  end
end
