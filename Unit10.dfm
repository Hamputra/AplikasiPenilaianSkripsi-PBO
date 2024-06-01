object FLaporanPenguji: TFLaporanPenguji
  Left = 0
  Top = 0
  ClientHeight = 562
  ClientWidth = 1115
  Caption = 'Laporan Penguji Skripsi'
  Color = clWhite
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  TextHeight = 15
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 1115
    Height = 562
    Hint = ''
    Align = alClient
    TabOrder = 0
    Caption = ''
    ExplicitWidth = 1109
    ExplicitHeight = 553
    object UniDBGrid1: TUniDBGrid
      Left = 1
      Top = 32
      Width = 552
      Height = 241
      Hint = ''
      DataSource = DataSource2
      LoadMask.Message = 'Loading data...'
      TabOrder = 1
      OnAfterLoad = UniDBGrid1AfterLoad
    end
    object UniLabel1: TUniLabel
      Left = 144
      Top = 7
      Width = 224
      Height = 19
      Hint = ''
      Caption = 'Rincian Nilai Dari Ketua Penguji'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Height = -17
      Font.Name = 'Times New Roman'
      TabOrder = 2
    end
    object UniDBGrid2: TUniDBGrid
      Left = 559
      Top = 32
      Width = 552
      Height = 241
      Hint = ''
      DataSource = DataSource3
      LoadMask.Message = 'Loading data...'
      TabOrder = 3
      OnAfterLoad = UniDBGrid1AfterLoad
    end
    object UniLabel2: TUniLabel
      Left = 728
      Top = 7
      Width = 253
      Height = 19
      Hint = ''
      Caption = 'Rincian Nilai Dari Sekretaris Penguji'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Height = -17
      Font.Name = 'Times New Roman'
      TabOrder = 4
    end
  end
  object UniDBGrid3: TUniDBGrid
    Left = 0
    Top = 313
    Width = 552
    Height = 241
    Hint = ''
    DataSource = DataSource4
    LoadMask.Message = 'Loading data...'
    TabOrder = 1
    OnAfterLoad = UniDBGrid1AfterLoad
  end
  object UniLabel3: TUniLabel
    Left = 167
    Top = 288
    Width = 193
    Height = 19
    Hint = ''
    Caption = 'Rincian Nilai Dari Penguji 1'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Height = -17
    Font.Name = 'Times New Roman'
    TabOrder = 2
  end
  object UniDBGrid4: TUniDBGrid
    Left = 558
    Top = 313
    Width = 552
    Height = 241
    Hint = ''
    DataSource = DataSource5
    LoadMask.Message = 'Loading data...'
    TabOrder = 3
    OnAfterLoad = UniDBGrid1AfterLoad
  end
  object UniLabel4: TUniLabel
    Left = 741
    Top = 288
    Width = 193
    Height = 19
    Hint = ''
    Caption = 'Rincian Nilai Dari Penguji 2'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Height = -17
    Font.Name = 'Times New Roman'
    TabOrder = 4
  end
  object ADOQuery2: TADOQuery
    Active = True
    Connection = UniMainModule.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from NilaiKetuaPenguji')
    Left = 384
    Top = 112
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 272
    Top = 112
  end
  object ADOQuery3: TADOQuery
    Active = True
    Connection = UniMainModule.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from NilaiSekretarisPenguji')
    Left = 952
    Top = 128
  end
  object DataSource3: TDataSource
    DataSet = ADOQuery3
    Left = 840
    Top = 128
  end
  object ADOQuery4: TADOQuery
    Active = True
    Connection = UniMainModule.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from NilaiPenguji1;')
    Left = 384
    Top = 408
  end
  object DataSource4: TDataSource
    DataSet = ADOQuery4
    Left = 280
    Top = 408
  end
  object ADOQuery5: TADOQuery
    Active = True
    Connection = UniMainModule.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from NilaiPenguji2')
    Left = 952
    Top = 376
  end
  object DataSource5: TDataSource
    DataSet = ADOQuery5
    Left = 840
    Top = 376
  end
end
