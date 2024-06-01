unit Unit12;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniGUIBaseClasses,
  uniPanel, uniLabel, Data.DB, Data.Win.ADODB;

type
  TFDaftarMhs = class(TUniForm)
    UniPanel1: TUniPanel;
    UniDBGrid1: TUniDBGrid;
    UniLabel3: TUniLabel;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    procedure UniDBGrid1AfterLoad(Sender: TUniCustomDBGrid);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FDaftarMhs: TFDaftarMhs;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function FDaftarMhs: TFDaftarMhs;
begin
  Result := TFDaftarMhs(UniMainModule.GetFormInstance(TFDaftarMhs));
end;

procedure TFDaftarMhs.UniDBGrid1AfterLoad(Sender: TUniCustomDBGrid);
begin
  UniDBGrid1.Columns[0].Width := 30;
  UniDBGrid1.Columns[1].Width := 40;
  UniDBGrid1.Columns[2].Width := 150;
  UniDBGrid1.Columns[3].Width := 250;
  UniDBGrid1.Columns[4].Width := 150;
  UniDBGrid1.Columns[5].Width := 150;
  UniDBGrid1.Columns[6].Width := 150;
  UniDBGrid1.Columns[7].Width := 150;
end;

end.
