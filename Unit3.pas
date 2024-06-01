unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniButton, unit10, unit11, unit12;

type
  TSubMenuLaporan = class(TUniForm)
    UniPanel1: TUniPanel;
    BtnLaporan: TUniButton;
    BtnProses: TUniButton;
    BtnPraUjian: TUniButton;
    procedure BtnPraUjianClick(Sender: TObject);
    procedure BtnProsesClick(Sender: TObject);
    procedure BtnLaporanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function SubMenuLaporan: TSubMenuLaporan;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function SubMenuLaporan: TSubMenuLaporan;
begin
  Result := TSubMenuLaporan(UniMainModule.GetFormInstance(TSubMenuLaporan));
end;

procedure TSubMenuLaporan.BtnLaporanClick(Sender: TObject);
begin
FDaftarMhs.Show;
end;

procedure TSubMenuLaporan.BtnPraUjianClick(Sender: TObject);
begin
FLaporanPenguji.Show;
end;

procedure TSubMenuLaporan.BtnProsesClick(Sender: TObject);
begin
FLaporanJadwal.Show;
end;

end.
