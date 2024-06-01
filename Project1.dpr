program Project1;

uses
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  Main in 'Main.pas' {MainForm: TUniForm},
  Unit1 in 'Unit1.pas' {SubMenuPraUjian: TUniForm},
  Unit2 in 'Unit2.pas' {SubMenuProsesSkripsi: TUniForm},
  Unit3 in 'Unit3.pas' {SubMenuLaporan: TUniForm},
  Unit4 in 'Unit4.pas' {FPembimbinganSkripsi: TUniForm},
  Unit5 in 'Unit5.pas' {FPendaftaranSidang: TUniForm},
  Unit6 in 'Unit6.pas' {FPenentuan: TUniForm},
  Unit7 in 'Unit7.pas' {FPenjadwalan: TUniForm},
  Unit8 in 'Unit8.pas' {FInputNilaiPenguji: TUniForm},
  Unit9 in 'Unit9.pas' {FInputNilaiAkhir: TUniForm},
  Unit10 in 'Unit10.pas' {FLaporanPenguji: TUniForm},
  Unit11 in 'Unit11.pas' {FLaporanJadwal: TUniForm},
  Unit12 in 'Unit12.pas' {FDaftarMhs: TUniForm};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;
end.
