object FRMCLIENTES: TFRMCLIENTES
  Left = 210
  Top = 130
  Width = 581
  Height = 327
  BorderIcons = [biSystemMenu]
  Caption = 'Manejo de Clientes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 573
    Height = 293
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Busqueda'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 565
        Height = 57
        Align = alTop
        Color = clSilver
        TabOrder = 0
        object Buscar: TGroupBox
          Left = 8
          Top = 3
          Width = 545
          Height = 49
          Caption = 'Buscar'
          Color = clSilver
          ParentColor = False
          TabOrder = 0
          object Label3: TLabel
            Left = 8
            Top = 22
            Width = 36
            Height = 13
            Caption = 'Codigo:'
          end
          object Label4: TLabel
            Left = 104
            Top = 22
            Width = 40
            Height = 13
            Caption = 'Nombre:'
          end
          object Label5: TLabel
            Left = 464
            Top = 22
            Width = 23
            Height = 13
            Caption = 'Reg.'
          end
          object Label1: TLabel
            Left = 280
            Top = 22
            Width = 48
            Height = 13
            Caption = 'Direcci'#243'n:'
          end
          object Edit1: TEdit
            Left = 48
            Top = 20
            Width = 49
            Height = 19
            Hint = 'Busqueda de Clientes por Codigo'
            CharCase = ecUpperCase
            Ctl3D = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnChange = Edit1Change
          end
          object Edit2: TEdit
            Left = 146
            Top = 20
            Width = 127
            Height = 19
            Hint = 'Busqueda de clientes por nombre'
            CharCase = ecUpperCase
            Ctl3D = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnChange = Edit2Change
          end
          object Edit3: TEdit
            Left = 488
            Top = 19
            Width = 49
            Height = 19
            Hint = 'Busqueda de clientes por  No. Registro...!'
            CharCase = ecUpperCase
            Ctl3D = False
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnChange = Edit3Change
          end
          object Edit4: TEdit
            Left = 336
            Top = 20
            Width = 121
            Height = 19
            Hint = 'Busqueda de clientes por Direcci'#243'n'
            Color = 16053503
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 3
            OnChange = Edit4Change
          end
        end
      end
      object dxDBGrid1: TdxDBGrid
        Left = 0
        Top = 57
        Width = 565
        Height = 163
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnDblClick = dxDBGrid1DblClick
        BandColor = clWhite
        BandFont.Charset = DEFAULT_CHARSET
        BandFont.Color = clWindowText
        BandFont.Height = -10
        BandFont.Name = 'MS Sans Serif'
        BandFont.Style = []
        DataSource = ClDS
        Filter.Criteria = {00000000}
        GridLineColor = clSilver
        HeaderColor = clBlue
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clSilver
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Style = [fsBold]
        LookAndFeel = lfUltraFlat
        OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoTabs, edgoTabThrough, edgoVertThrough]
        OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoUseBookmarks]
        PreviewFont.Charset = DEFAULT_CHARSET
        PreviewFont.Color = clBlue
        PreviewFont.Height = -11
        PreviewFont.Name = 'MS Sans Serif'
        PreviewFont.Style = []
        object dxDBGrid1PLUCLIENTE: TdxDBGridMaskColumn
          ReadOnly = True
          Visible = False
          Width = 70
          BandIndex = 0
          RowIndex = 0
          FieldName = 'PLUCLIENTE'
        end
        object dxDBGrid1CODIGO: TdxDBGridMaskColumn
          Caption = 'Codigo'
          ReadOnly = True
          BandIndex = 0
          RowIndex = 0
          FieldName = 'CODIGO'
        end
        object dxDBGrid1NOMBRE: TdxDBGridMaskColumn
          Caption = 'Nombre'
          ReadOnly = True
          Width = 207
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NOMBRE'
        end
        object dxDBGrid1DIRECCION1: TdxDBGridMaskColumn
          Caption = 'Direccion'
          ReadOnly = True
          Width = 364
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DIRECCION1'
        end
        object dxDBGrid1DIRRECCION1: TdxDBGridMaskColumn
          ReadOnly = True
          Visible = False
          Width = 354
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DIRRECCION1'
        end
        object dxDBGrid1DIRECCION2: TdxDBGridMaskColumn
          ReadOnly = True
          Visible = False
          Width = 354
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DIRECCION2'
        end
        object dxDBGrid1COLONIA: TdxDBGridMaskColumn
          ReadOnly = True
          Visible = False
          Width = 122
          BandIndex = 0
          RowIndex = 0
          FieldName = 'COLONIA'
        end
        object dxDBGrid1CIUDAD: TdxDBGridMaskColumn
          ReadOnly = True
          Visible = False
          Width = 122
          BandIndex = 0
          RowIndex = 0
          FieldName = 'CIUDAD'
        end
        object dxDBGrid1DEPARTAMENTO: TdxDBGridMaskColumn
          ReadOnly = True
          Visible = False
          Width = 122
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DEPARTAMENTO'
        end
        object dxDBGrid1PAIS: TdxDBGridMaskColumn
          ReadOnly = True
          Visible = False
          Width = 122
          BandIndex = 0
          RowIndex = 0
          FieldName = 'PAIS'
        end
        object dxDBGrid1ZONA: TdxDBGridMaskColumn
          ReadOnly = True
          Visible = False
          Width = 62
          BandIndex = 0
          RowIndex = 0
          FieldName = 'ZONA'
        end
        object dxDBGrid1clasificacion: TdxDBGridLookupColumn
          ReadOnly = True
          Width = 70
          BandIndex = 0
          RowIndex = 0
          FieldName = 'clasificacion'
        end
        object dxDBGrid1EXT1: TdxDBGridMaskColumn
          ReadOnly = True
          Visible = False
          Width = 62
          BandIndex = 0
          RowIndex = 0
          FieldName = 'EXT1'
        end
        object dxDBGrid1EXT2: TdxDBGridMaskColumn
          ReadOnly = True
          Visible = False
          Width = 62
          BandIndex = 0
          RowIndex = 0
          FieldName = 'EXT2'
        end
        object dxDBGrid1NIT: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 124
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NIT'
        end
        object dxDBGrid1GIRO: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 628
          BandIndex = 0
          RowIndex = 0
          FieldName = 'GIRO'
        end
        object dxDBGrid1TIPO: TdxDBGridMaskColumn
          ReadOnly = True
          Visible = False
          Width = 122
          BandIndex = 0
          RowIndex = 0
          FieldName = 'TIPO'
        end
        object dxDBGrid1PLUCLRUBRO: TdxDBGridMaskColumn
          ReadOnly = True
          Visible = False
          Width = 77
          BandIndex = 0
          RowIndex = 0
          FieldName = 'PLUCLRUBRO'
        end
        object dxDBGrid1PLUCLCATEGORIA: TdxDBGridMaskColumn
          ReadOnly = True
          Visible = False
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'PLUCLCATEGORIA'
        end
        object dxDBGrid1DEPTOPAIS: TdxDBGridMaskColumn
          ReadOnly = True
          Visible = False
          Width = 65
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DEPTOPAIS'
        end
        object dxDBGrid1PLUTARJETA: TdxDBGridMaskColumn
          ReadOnly = True
          Visible = False
          Width = 73
          BandIndex = 0
          RowIndex = 0
          FieldName = 'PLUTARJETA'
        end
        object dxDBGrid1NOMBRETARJETA: TdxDBGridMaskColumn
          ReadOnly = True
          Visible = False
          Width = 237
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NOMBRETARJETA'
        end
        object dxDBGrid1FECHATARJETA: TdxDBGridDateColumn
          ReadOnly = True
          Visible = False
          Width = 110
          BandIndex = 0
          RowIndex = 0
          FieldName = 'FECHATARJETA'
        end
        object dxDBGrid1TELEFONO: TdxDBGridMaskColumn
          ReadOnly = True
          Visible = False
          Width = 237
          BandIndex = 0
          RowIndex = 0
          FieldName = 'TELEFONO'
        end
        object dxDBGrid1FAX: TdxDBGridMaskColumn
          ReadOnly = True
          Visible = False
          Width = 237
          BandIndex = 0
          RowIndex = 0
          FieldName = 'FAX'
        end
        object dxDBGrid1REGISTRO: TdxDBGridMaskColumn
          ReadOnly = True
          Visible = False
          Width = 122
          BandIndex = 0
          RowIndex = 0
          FieldName = 'REGISTRO'
        end
        object dxDBGrid1TELTARJETA: TdxDBGridMaskColumn
          ReadOnly = True
          Visible = False
          Width = 72
          BandIndex = 0
          RowIndex = 0
          FieldName = 'TELTARJETA'
        end
        object dxDBGrid1DIAPAGO: TdxDBGridMaskColumn
          ReadOnly = True
          Visible = False
          Width = 122
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DIAPAGO'
        end
        object dxDBGrid1DIAQUEDAN: TdxDBGridMaskColumn
          ReadOnly = True
          Visible = False
          Width = 122
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DIAQUEDAN'
        end
        object dxDBGrid1PERSONACOBRO: TdxDBGridMaskColumn
          ReadOnly = True
          Visible = False
          Width = 354
          BandIndex = 0
          RowIndex = 0
          FieldName = 'PERSONACOBRO'
        end
        object dxDBGrid1TELCOBRO: TdxDBGridMaskColumn
          ReadOnly = True
          Visible = False
          Width = 62
          BandIndex = 0
          RowIndex = 0
          FieldName = 'TELCOBRO'
        end
        object dxDBGrid1EXTCOBRO: TdxDBGridMaskColumn
          ReadOnly = True
          Visible = False
          Width = 63
          BandIndex = 0
          RowIndex = 0
          FieldName = 'EXTCOBRO'
        end
        object dxDBGrid1CREDITOACTIVO: TdxDBGridMaskColumn
          ReadOnly = True
          Visible = False
          Width = 91
          BandIndex = 0
          RowIndex = 0
          FieldName = 'CREDITOACTIVO'
        end
        object dxDBGrid1CREDITO: TdxDBGridMaskColumn
          ReadOnly = True
          Visible = False
          Width = 52
          BandIndex = 0
          RowIndex = 0
          FieldName = 'CREDITO'
        end
        object dxDBGrid1CREDITO1: TdxDBGridMaskColumn
          ReadOnly = True
          Visible = False
          Width = 58
          BandIndex = 0
          RowIndex = 0
          FieldName = 'CREDITO1'
        end
        object dxDBGrid1EMAIL: TdxDBGridMaskColumn
          ReadOnly = True
          Visible = False
          Width = 354
          BandIndex = 0
          RowIndex = 0
          FieldName = 'EMAIL'
        end
        object dxDBGrid1NOTARJETA: TdxDBGridMaskColumn
          ReadOnly = True
          Visible = False
          Width = 122
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NOTARJETA'
        end
        object dxDBGrid1PLUEMPLEADOS: TdxDBGridMaskColumn
          ReadOnly = True
          Visible = False
          Width = 91
          BandIndex = 0
          RowIndex = 0
          FieldName = 'PLUEMPLEADOS'
        end
        object dxDBGrid1LIMITECREDITO: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 89
          BandIndex = 0
          RowIndex = 0
          FieldName = 'LIMITECREDITO'
        end
        object dxDBGrid1EXCENTO: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 57
          BandIndex = 0
          RowIndex = 0
          FieldName = 'EXCENTO'
        end
        object dxDBGrid1SALDO: TdxDBGridMaskColumn
          ReadOnly = True
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SALDO'
        end
        object dxDBGrid1WEB: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 364
          BandIndex = 0
          RowIndex = 0
          FieldName = 'WEB'
        end
        object dxDBGrid1GENERAR_ECUENTA: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 116
          BandIndex = 0
          RowIndex = 0
          FieldName = 'GENERAR_ECUENTA'
        end
        object dxDBGrid1TARJETA: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 54
          BandIndex = 0
          RowIndex = 0
          FieldName = 'TARJETA'
        end
        object dxDBGrid1CEDULA: TdxDBGridMaskColumn
          ReadOnly = True
          BandIndex = 0
          RowIndex = 0
          FieldName = 'CEDULA'
        end
        object dxDBGrid1DUI: TdxDBGridMaskColumn
          ReadOnly = True
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DUI'
        end
        object dxDBGrid1OBSERVACIONES1: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 1534
          BandIndex = 0
          RowIndex = 0
          FieldName = 'OBSERVACIONES1'
        end
        object dxDBGrid1OBSERVACIONES2: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 1534
          BandIndex = 0
          RowIndex = 0
          FieldName = 'OBSERVACIONES2'
        end
        object dxDBGrid1TRABAJO: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 364
          BandIndex = 0
          RowIndex = 0
          FieldName = 'TRABAJO'
        end
        object dxDBGrid1TEL_TRABAJO: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 124
          BandIndex = 0
          RowIndex = 0
          FieldName = 'TEL_TRABAJO'
        end
        object dxDBGrid1RECOMENDACIONES: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 1534
          BandIndex = 0
          RowIndex = 0
          FieldName = 'RECOMENDACIONES'
        end
        object dxDBGrid1NOMBRE_FIADOR: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 364
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NOMBRE_FIADOR'
        end
        object dxDBGrid1DIRECCION_FIADOR: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 1534
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DIRECCION_FIADOR'
        end
        object dxDBGrid1TEL_FIADOR: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 364
          BandIndex = 0
          RowIndex = 0
          FieldName = 'TEL_FIADOR'
        end
        object dxDBGrid1TRABAJO_FIADOR: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 364
          BandIndex = 0
          RowIndex = 0
          FieldName = 'TRABAJO_FIADOR'
        end
        object dxDBGrid1DUI_FIADOR: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 71
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DUI_FIADOR'
        end
        object dxDBGrid1CEDULA_FIADOR: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 95
          BandIndex = 0
          RowIndex = 0
          FieldName = 'CEDULA_FIADOR'
        end
        object dxDBGrid1OBSERVACIONES_FIADOR: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 1534
          BandIndex = 0
          RowIndex = 0
          FieldName = 'OBSERVACIONES_FIADOR'
        end
        object dxDBGrid1MUNICIPIO: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 124
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MUNICIPIO'
        end
        object dxDBGrid1DIAS_CREDITO: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 85
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DIAS_CREDITO'
        end
        object dxDBGrid1PLUCLIENTE_MAYOR: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 117
          BandIndex = 0
          RowIndex = 0
          FieldName = 'PLUCLIENTE_MAYOR'
        end
        object dxDBGrid1CALIFICACION_CREDITO: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 132
          BandIndex = 0
          RowIndex = 0
          FieldName = 'CALIFICACION_CREDITO'
        end
        object dxDBGrid1CALIFICACION_COMPRAS: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 137
          BandIndex = 0
          RowIndex = 0
          FieldName = 'CALIFICACION_COMPRAS'
        end
        object dxDBGrid1NOTA_COBRO: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 1504
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NOTA_COBRO'
        end
        object dxDBGrid1PRECIO: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 76
          BandIndex = 0
          RowIndex = 0
          FieldName = 'PRECIO'
        end
        object dxDBGrid1PLUCTA: TdxDBGridMaskColumn
          ReadOnly = True
          BandIndex = 0
          RowIndex = 0
          FieldName = 'PLUCTA'
        end
        object dxDBGrid1TIPODOC: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 54
          BandIndex = 0
          RowIndex = 0
          FieldName = 'TIPODOC'
        end
        object dxDBGrid1DIASCRED: TdxDBGridMaskColumn
          ReadOnly = True
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DIASCRED'
        end
        object dxDBGrid1USUARIO: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 76
          BandIndex = 0
          RowIndex = 0
          FieldName = 'USUARIO'
        end
        object dxDBGrid1ACTIVO: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 45
          BandIndex = 0
          RowIndex = 0
          FieldName = 'ACTIVO'
        end
        object dxDBGrid1CONTACTO: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 244
          BandIndex = 0
          RowIndex = 0
          FieldName = 'CONTACTO'
        end
        object dxDBGrid1FORMAPAGO: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 74
          BandIndex = 0
          RowIndex = 0
          FieldName = 'FORMAPAGO'
        end
        object dxDBGrid1PLUDOC: TdxDBGridMaskColumn
          ReadOnly = True
          BandIndex = 0
          RowIndex = 0
          FieldName = 'PLUDOC'
        end
        object dxDBGrid1PLUABONO: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 65
          BandIndex = 0
          RowIndex = 0
          FieldName = 'PLUABONO'
        end
        object dxDBGrid1TASA_CERO: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 70
          BandIndex = 0
          RowIndex = 0
          FieldName = 'TASA_CERO'
        end
        object dxDBGrid1CODIGO2: TdxDBGridMaskColumn
          ReadOnly = True
          Width = 124
          BandIndex = 0
          RowIndex = 0
          FieldName = 'CODIGO2'
        end
        object dxDBGrid1CODIGO3: TdxDBGridMaskColumn
          Width = 124
          BandIndex = 0
          RowIndex = 0
          FieldName = 'CODIGO3'
        end
        object dxDBGrid1CLASE: TdxDBGridMaskColumn
          Width = 184
          BandIndex = 0
          RowIndex = 0
          FieldName = 'CLASE'
        end
        object dxDBGrid1depto: TdxDBGridLookupColumn
          Width = 124
          BandIndex = 0
          RowIndex = 0
          FieldName = 'depto'
        end
        object dxDBGrid1munic: TdxDBGridLookupColumn
          Width = 124
          BandIndex = 0
          RowIndex = 0
          FieldName = 'munic'
        end
        object dxDBGrid1MUNI: TdxDBGridMaskColumn
          Width = 34
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MUNI'
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 220
        Width = 565
        Height = 45
        Align = alBottom
        Color = clSilver
        TabOrder = 2
        object BitBtn1: TBitBtn
          Left = 384
          Top = 8
          Width = 75
          Height = 25
          TabOrder = 0
          Kind = bkOK
        end
        object BitBtn2: TBitBtn
          Left = 472
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Salir'
          TabOrder = 1
          OnClick = BitBtn2Click
          Kind = bkCancel
        end
      end
    end
  end
  object ClDS: TDataSource
    Left = 241
    Top = 161
  end
  object deptoDS: TDataSource
    DataSet = DeptoQRY
    Left = 107
    Top = 126
  end
  object DataSource1: TDataSource
    Left = 125
    Top = 189
  end
  object clasqry: TZQuery
    SQL.Strings = (
      'select NOMBRE, PLUCLCATEGORIA  from CLCATEGORIA')
    Params = <>
    Left = 41
    Top = 32
  end
  object ClQry: TZQuery
    UpdateObject = ClSQL
    SQL.Strings = (
      'SELECT '
      '  CLIENTES.*,'
      '  CLCATEGORIA.NOMBRE AS CLASE'
      'FROM'
      '  CLIENTES'
      
        '  INNER JOIN CLCATEGORIA ON (CLIENTES.PLUCLCATEGORIA = CLCATEGOR' +
        'IA.PLUCLCATEGORIA)'
      'ORDER BY clientes.CODIGO ASC')
    Params = <>
    Sequence = ZSequence1
    Left = 165
    Top = 64
  end
  object ClSQL: TZUpdateSQL
    UseSequenceFieldForRefreshSQL = False
    Left = 194
    Top = 94
  end
  object ZSequence1: TZSequence
    SequenceName = 'CLIENTES_GEN'
    Left = 221
    Top = 119
  end
  object myqry: TZQuery
    SQL.Strings = (
      'select max(codigo) from clientes where pluempresa=:pluempresa')
    Params = <
      item
        DataType = ftUnknown
        Name = 'pluempresa'
        ParamType = ptUnknown
      end>
    Left = 400
    Top = 109
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pluempresa'
        ParamType = ptUnknown
      end>
  end
  object DeptoQRY: TZQuery
    SQL.Strings = (
      'select * from DEPTOPAIS')
    Params = <>
    Left = 73
    Top = 101
  end
  object MUNIQRY: TZQuery
    SQL.Strings = (
      'select * from MUNI WHERE DEPTO=:DEPTO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'DEPTO'
        ParamType = ptUnknown
      end>
    DataSource = deptoDS
    Left = 81
    Top = 172
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DEPTO'
        ParamType = ptUnknown
      end>
  end
end
