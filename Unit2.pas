unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniButton,
  unit8, unit9;

type
  TSubMenuProsesSkripsi = class(TUniForm)
    BtnInputNilaiPenguji: TUniButton;
    BtnInputNilaiAkhir: TUniButton;
    UniPanel1: TUniPanel;
    procedure BtnInputNilaiPengujiClick(Sender: TObject);
    procedure BtnInputNilaiAkhirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function SubMenuProsesSkripsi: TSubMenuProsesSkripsi;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function SubMenuProsesSkripsi: TSubMenuProsesSkripsi;
begin
  Result := TSubMenuProsesSkripsi(UniMainModule.GetFormInstance(TSubMenuProsesSkripsi));
end;

procedure TSubMenuProsesSkripsi.BtnInputNilaiAkhirClick(Sender: TObject);
begin
FInputNilaiAkhir.Show;
end;

procedure TSubMenuProsesSkripsi.BtnInputNilaiPengujiClick(Sender: TObject);
begin
FInputNilaiPenguji.Show;
end;

end.
