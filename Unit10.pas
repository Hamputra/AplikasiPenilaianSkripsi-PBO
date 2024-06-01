unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniGUIBaseClasses,
  uniPanel, uniLabel, Data.DB, Data.Win.ADODB;

type
  TFLaporanPenguji = class(TUniForm)
    UniPanel1: TUniPanel;
    UniDBGrid1: TUniDBGrid;
    UniLabel1: TUniLabel;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    UniDBGrid2: TUniDBGrid;
    UniLabel2: TUniLabel;
    UniDBGrid3: TUniDBGrid;
    UniLabel3: TUniLabel;
    UniDBGrid4: TUniDBGrid;
    UniLabel4: TUniLabel;
    ADOQuery3: TADOQuery;
    DataSource3: TDataSource;
    ADOQuery4: TADOQuery;
    DataSource4: TDataSource;
    ADOQuery5: TADOQuery;
    DataSource5: TDataSource;
    procedure UniDBGrid1AfterLoad(Sender: TUniCustomDBGrid);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FLaporanPenguji: TFLaporanPenguji;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function FLaporanPenguji: TFLaporanPenguji;
begin
  Result := TFLaporanPenguji(UniMainModule.GetFormInstance(TFLaporanPenguji));
end;

procedure TFLaporanPenguji.UniDBGrid1AfterLoad(Sender: TUniCustomDBGrid);
begin
  UniDBGrid1.Columns[0].Width := 30;
  UniDBGrid1.Columns[1].Width := 40;

  UniDBGrid2.Columns[0].Width := 30;
  UniDBGrid2.Columns[1].Width := 40;

  UniDBGrid3.Columns[0].Width := 30;
  UniDBGrid3.Columns[1].Width := 40;

  UniDBGrid4.Columns[0].Width := 30;
  UniDBGrid4.Columns[1].Width := 40;
end;

end.
