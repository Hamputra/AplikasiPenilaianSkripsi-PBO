unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniEdit, uniLabel,
  uniMultiItem, uniComboBox, uniButton, Data.DB, Data.Win.ADODB;

type
  TFPenjadwalan = class(TUniForm)
    UniPanel1: TUniPanel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    EdNIM: TUniEdit;
    UniLabel4: TUniLabel;
    EdNamaMhs: TUniEdit;
    UniLabel10: TUniLabel;
    UniLabel7: TUniLabel;
    JadwalJam: TUniComboBox;
    UniLabel3: TUniLabel;
    JadwalRuangSidang: TUniComboBox;
    BtnSimpan: TUniButton;
    BtnRevisi: TUniButton;
    BtnKeluar: TUniButton;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    EdTanggalSidang: TUniEdit;
    UniLabel5: TUniLabel;
    DataSource2: TDataSource;
    ADOQuery2: TADOQuery;
    procedure EdNIMChange(Sender: TObject);
    procedure BtnSimpanClick(Sender: TObject);
    procedure BtnRevisiClick(Sender: TObject);
    procedure BtnKeluarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FPenjadwalan: TFPenjadwalan;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function FPenjadwalan: TFPenjadwalan;
begin
  Result := TFPenjadwalan(UniMainModule.GetFormInstance(TFPenjadwalan));
end;


procedure TFPenjadwalan.EdNIMChange(Sender: TObject);
begin
 // Lakukan pencarian data berdasarkan NIM
  ADOQuery1.SQL.Text := 'SELECT Nama, JudulSkripsi, Penguji1, Penguji2 FROM Mahasiswa WHERE NIM = :nim';
  ADOQuery1.Parameters.ParamByName('nim').Value := EdNIM.Text;
  ADOQuery1.Open;

  // Tampilkan hasil pencarian
  if not ADOQuery1.IsEmpty then
  begin
    EdNamaMhs.Text := ADOQuery1.FieldByName('Nama').AsString;
  end
  else
  begin
    EdNamaMhs.Text := '';
  end;

  ADOQuery2.SQL.Text := 'SELECT Tanggal, Jam, Ruang FROM JadwalSkripsi WHERE NIM = :nim';
  ADOQuery2.Parameters.ParamByName('nim').Value := EdNIM.Text;
  ADOQuery2.Open;

  if not ADOQuery2.IsEmpty then
  begin
    EdTanggalSidang.Text := ADOQuery2.FieldByName('Tanggal').AsString;
    JadwalJam.Text := ADOQuery2.FieldByName('Jam').AsString;
    JadwalRuangSidang.Text := ADOQuery2.FieldByName('Ruang').AsString;
  end
  else
  begin
    EdTanggalSidang.Text := '';
    JadwalJam.Text := '';
    JadwalRuangSidang.Text := '';
  end;
end;

procedure TFPenjadwalan.BtnKeluarClick(Sender: TObject);
begin
close;
end;

procedure TFPenjadwalan.BtnRevisiClick(Sender: TObject);
begin
  ADOQuery2.SQL.Text := 'UPDATE JadwalSkripsi SET Tanggal = :x, Jam = :y, Ruang = :z WHERE NIM = :nim';

  ADOQuery2.Parameters.ParamByName('x').Value := EdTanggalSidang.Text;
  ADOQuery2.Parameters.ParamByName('y').Value := JadwalJam.Text;
  ADOQuery2.Parameters.ParamByName('z').Value := JadwalRuangSidang.Text;
  ADOQuery2.Parameters.ParamByName('nim').Value := EdNIM.Text;
  ADOQuery2.ExecSQL;
  Showmessage('data berhasil di simpan');
end;

procedure TFPenjadwalan.BtnSimpanClick(Sender: TObject);
begin
  ADOQuery2.SQL.Text := 'UPDATE JadwalSkripsi SET Tanggal = :x, Jam = :y, Ruang = :z WHERE NIM = :nim';

  ADOQuery2.Parameters.ParamByName('x').Value := EdTanggalSidang.Text;
  ADOQuery2.Parameters.ParamByName('y').Value := JadwalJam.Text;
  ADOQuery2.Parameters.ParamByName('z').Value := JadwalRuangSidang.Text;
  ADOQuery2.Parameters.ParamByName('nim').Value := EdNIM.Text;
  ADOQuery2.ExecSQL;
  Showmessage('data berhasil di simpan');
end;

end.
