unit Unit11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniGUIBaseClasses,
  uniPanel, Data.DB, Data.Win.ADODB, uniLabel;

type
  TFLaporanJadwal = class(TUniForm)
    UniPanel1: TUniPanel;
    UniDBGrid1: TUniDBGrid;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    UniLabel3: TUniLabel;
    procedure UniDBGrid1AfterLoad(Sender: TUniCustomDBGrid);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FLaporanJadwal: TFLaporanJadwal;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function FLaporanJadwal: TFLaporanJadwal;
begin
  Result := TFLaporanJadwal(UniMainModule.GetFormInstance(TFLaporanJadwal));
end;

procedure TFLaporanJadwal.UniDBGrid1AfterLoad(Sender: TUniCustomDBGrid);
begin
  UniDBGrid1.Columns[0].Width := 30;
  UniDBGrid1.Columns[1].Width := 40;
  UniDBGrid1.Columns[2].Width := 120;
  UniDBGrid1.Columns[3].Width := 120;
end;

end.
