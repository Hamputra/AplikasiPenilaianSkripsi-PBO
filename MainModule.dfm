object UniMainModule: TUniMainModule
  MonitoredKeys.Keys = <>
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\KULIAH\SEMESTER ' +
      '3\PBO\Delphi\Project UAS\Win32\DBMahasiswa.mdb;Persist Security ' +
      'Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 704
    Top = 512
  end
end
