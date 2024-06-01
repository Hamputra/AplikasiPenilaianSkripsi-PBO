unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniButton, Unit4, unit5,
  unit6, unit7;

type
  TSubMenuPraUjian = class(TUniForm)
    UniPanel1: TUniPanel;
    BtnPembimbingan: TUniButton;
    BtnPendaftaran: TUniButton;
    BtnPenentuan: TUniButton;
    BtnPenjadwalan: TUniButton;
    procedure BtnPembimbinganClick(Sender: TObject);
    procedure BtnPendaftaranClick(Sender: TObject);
    procedure BtnPenentuanClick(Sender: TObject);
    procedure BtnPenjadwalanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function SubMenuPraUjian: TSubMenuPraUjian;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function SubMenuPraUjian: TSubMenuPraUjian;
begin
  Result := TSubMenuPraUjian(UniMainModule.GetFormInstance(TSubMenuPraUjian));
end;

procedure TSubMenuPraUjian.BtnPembimbinganClick(Sender: TObject);
begin
FPembimbinganSkripsi.Show;
end;

procedure TSubMenuPraUjian.BtnPendaftaranClick(Sender: TObject);
begin
FPendaftaranSidang.Show;
end;

procedure TSubMenuPraUjian.BtnPenentuanClick(Sender: TObject);
begin
FPenentuan.Show;
end;

procedure TSubMenuPraUjian.BtnPenjadwalanClick(Sender: TObject);
begin
FPenjadwalan.show;
end;

end.
