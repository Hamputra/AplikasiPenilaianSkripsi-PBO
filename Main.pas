unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniButton, uniGUIBaseClasses,
  uniPanel, Vcl.Menus, unit1, unit2, unit3, unit4, unit5, unit6, unit7, unit8, unit9;

type
  TMainForm = class(TUniForm)
    UniPanel1: TUniPanel;
    BtnPraUjian: TUniButton;
    BtnLaporan: TUniButton;
    BtnProses: TUniButton;
    procedure BtnPraUjianClick(Sender: TObject);
    procedure BtnProsesSkripsiClick(Sender: TObject);
    procedure BtnLaporanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.BtnLaporanClick(Sender: TObject);
begin

SubMenuLaporan.Show;

end;

procedure TMainForm.BtnPraUjianClick(Sender: TObject);
begin

SubMenuPraUjian.Show;

end;

procedure TMainForm.BtnProsesSkripsiClick(Sender: TObject);
begin

SubMenuProsesSkripsi.Show;

end;

initialization
  RegisterAppFormClass(TMainForm);

end.
