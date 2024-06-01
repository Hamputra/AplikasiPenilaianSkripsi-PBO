unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniEdit, uniLabel, uniGUIBaseClasses, uniPanel,
  uniButton, Data.DB, Data.Win.ADODB;

type
  TFInputNilaiAkhir = class(TUniForm)
    UniPanel1: TUniPanel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    EdNIM: TUniEdit;
    UniLabel4: TUniLabel;
    EdNamaMhs: TUniEdit;
    UniLabel3: TUniLabel;
    UniLabel12: TUniLabel;
    NilaiKetuaPenguji: TUniEdit;
    UniLabel7: TUniLabel;
    NilaiSekretarisPenguji: TUniEdit;
    UniLabel5: TUniLabel;
    NilaiPenguji2: TUniEdit;
    UniLabel6: TUniLabel;
    NilaiPenguji1: TUniEdit;
    BtnRataRata: TUniButton;
    EdNilaiRataRata: TUniEdit;
    AkumulasiNilaiHuruf: TUniEdit;
    BtnSimpan: TUniButton;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADOQuery2: TADOQuery;
    DataSource3: TDataSource;
    ADOQuery3: TADOQuery;
    DataSource4: TDataSource;
    ADOQuery4: TADOQuery;
    DataSource5: TDataSource;
    ADOQuery5: TADOQuery;
    procedure EdNIMChange(Sender: TObject);
    procedure BtnRataRataClick(Sender: TObject);
    procedure BtnSimpanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FInputNilaiAkhir: TFInputNilaiAkhir;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function FInputNilaiAkhir: TFInputNilaiAkhir;
begin
  Result := TFInputNilaiAkhir(UniMainModule.GetFormInstance(TFInputNilaiAkhir));
end;

var
k, k1, k2, k3: Double;

procedure TFInputNilaiAkhir.BtnSimpanClick(Sender: TObject);
begin
Showmessage('data berhasil di simpan');
close;
end;

procedure TFInputNilaiAkhir.EdNIMChange(Sender: TObject);
  var
  a, b, c, d, e, f, g, h, i: integer;
  a1, b1, c1, d1, e1, f1, g1, h1, i1: integer;
  a2, b2, c2, d2, e2, f2, g2, h2, i2: integer;
  a3, b3, c3, d3, e3, f3, g3, h3, i3: integer;
  j, j1, j2, j3: Integer;

begin
 // Lakukan pencarian data berdasarkan NIM dari UniEdit1
  ADOQuery1.SQL.Text := 'SELECT Nama, JudulSkripsi, Penguji1, Penguji2 FROM Mahasiswa WHERE NIM = :nim';
  ADOQuery1.Parameters.ParamByName('nim').Value := EdNIM.Text;
  ADOQuery1.Open;

  // Tampilkan hasil pencarian di UniEdit2
  if not ADOQuery1.IsEmpty then
  begin
    EdNamaMhs.Text := ADOQuery1.FieldByName('Nama').AsString;
  end
  else
  begin
    EdNamaMhs.Text := '';  // Atau berikan pesan jika tidak ada hasil
  end;

  // Rata-rata nilai ketua penguji
  ADOQuery2.SQL.Text := 'SELECT Signifikan_Masalah, Metode_Penelitian, Sistematika_Pembahasan, ' +
                        'Analisis, Keputusan, Aspek_Penulisan, Penguasaan_Materi, ' +
                        'Presentasi, Konsultasi FROM NilaiKetuaPenguji WHERE NIM = :nim';
  ADOQuery2.Parameters.ParamByName('nim').Value := EdNIM.Text;
  ADOQuery2.Open;

  a := ADOQuery2.FieldByName('Signifikan_Masalah').AsInteger;
  b := ADOQuery2.FieldByName('Metode_Penelitian').AsInteger;
  c := ADOQuery2.FieldByName('Sistematika_Pembahasan').AsInteger;
  d := ADOQuery2.FieldByName('Analisis').AsInteger;
  e := ADOQuery2.FieldByName('Keputusan').AsInteger;
  f := ADOQuery2.FieldByName('Aspek_Penulisan').AsInteger;
  g := ADOQuery2.FieldByName('Penguasaan_Materi').AsInteger;
  h := ADOQuery2.FieldByName('Presentasi').AsInteger;
  i := ADOQuery2.FieldByName('Konsultasi').AsInteger;

  j := a + b + c + d + e + f + g + h +i;
  k := j/9.0;

  if not ADOQuery2.IsEmpty then
  begin
  NilaiKetuaPenguji.Text := FloatToStr(k);
  end
  else
  begin
    NilaiKetuaPenguji.Text := '';
  end;

  // Rata-rata nilai sekretaris penguji
  ADOQuery3.SQL.Text := 'SELECT Signifikan_Masalah, Metode_Penelitian, Sistematika_Pembahasan, ' +
                        'Analisis, Keputusan, Aspek_Penulisan, Penguasaan_Materi, ' +
                        'Presentasi, Konsultasi FROM NilaiSekretarisPenguji WHERE NIM = :nim';
  ADOQuery3.Parameters.ParamByName('nim').Value := EdNIM.Text;
  ADOQuery3.Open;

  a1 := ADOQuery3.FieldByName('Signifikan_Masalah').AsInteger;
  b1 := ADOQuery3.FieldByName('Metode_Penelitian').AsInteger;
  c1 := ADOQuery3.FieldByName('Sistematika_Pembahasan').AsInteger;
  d1 := ADOQuery3.FieldByName('Analisis').AsInteger;
  e1 := ADOQuery3.FieldByName('Keputusan').AsInteger;
  f1 := ADOQuery3.FieldByName('Aspek_Penulisan').AsInteger;
  g1 := ADOQuery3.FieldByName('Penguasaan_Materi').AsInteger;
  h1 := ADOQuery3.FieldByName('Presentasi').AsInteger;
  i1 := ADOQuery3.FieldByName('Konsultasi').AsInteger;

  j1 := a1 + b1 + c1 + d1 + e1 + f1 + g1 + h1 +i1;
  k1 := j1/9.0;

  if not ADOQuery2.IsEmpty then
  begin
  NilaiSekretarisPenguji.Text := FloatToStr(k1);
  end
  else
  begin
    NilaiSekretarisPenguji.Text := '';
  end;

  //Nilai rata-rata penguji 1
  ADOQuery4.SQL.Text := 'SELECT Signifikan_Masalah, Metode_Penelitian, Sistematika_Pembahasan, ' +
                        'Analisis, Keputusan, Aspek_Penulisan, Penguasaan_Materi, ' +
                        'Presentasi, Konsultasi FROM NilaiPenguji1 WHERE NIM = :nim';
  ADOQuery4.Parameters.ParamByName('nim').Value := EdNIM.Text;
  ADOQuery4.Open;

  a2 := ADOQuery4.FieldByName('Signifikan_Masalah').AsInteger;
  b2 := ADOQuery4.FieldByName('Metode_Penelitian').AsInteger;
  c2 := ADOQuery4.FieldByName('Sistematika_Pembahasan').AsInteger;
  d2 := ADOQuery4.FieldByName('Analisis').AsInteger;
  e2 := ADOQuery4.FieldByName('Keputusan').AsInteger;
  f2 := ADOQuery4.FieldByName('Aspek_Penulisan').AsInteger;
  g2 := ADOQuery4.FieldByName('Penguasaan_Materi').AsInteger;
  h2 := ADOQuery4.FieldByName('Presentasi').AsInteger;
  i2 := ADOQuery4.FieldByName('Konsultasi').AsInteger;

  j2 := a2 + b2 + c2 + d2 + e2 + f2 + g2 + h2 +i2;
  k2 := j2/9.0;

  if not ADOQuery4.IsEmpty then
  begin
  NilaiPenguji1.Text := FloatToStr(k2);
  end
  else
  begin
    NilaiPenguji1.Text := '';
  end;

  //Nilai rata-rata penguji 2
   ADOQuery5.SQL.Text := 'SELECT Signifikan_Masalah, Metode_Penelitian, Sistematika_Pembahasan, ' +
                        'Analisis, Keputusan, Aspek_Penulisan, Penguasaan_Materi, ' +
                        'Presentasi, Konsultasi FROM NilaiPenguji2 WHERE NIM = :nim';
  ADOQuery5.Parameters.ParamByName('nim').Value := EdNIM.Text;
  ADOQuery5.Open;

  a3 := ADOQuery5.FieldByName('Signifikan_Masalah').AsInteger;
  b3 := ADOQuery5.FieldByName('Metode_Penelitian').AsInteger;
  c3 := ADOQuery5.FieldByName('Sistematika_Pembahasan').AsInteger;
  d3 := ADOQuery5.FieldByName('Analisis').AsInteger;
  e3 := ADOQuery5.FieldByName('Keputusan').AsInteger;
  f3 := ADOQuery5.FieldByName('Aspek_Penulisan').AsInteger;
  g3 := ADOQuery5.FieldByName('Penguasaan_Materi').AsInteger;
  h3 := ADOQuery5.FieldByName('Presentasi').AsInteger;
  i3 := ADOQuery5.FieldByName('Konsultasi').AsInteger;

  j3 := a3 + b3 + c3 + d3 + e3 + f3 + g3 + h3 +i3;
  k3 := j3/9.0;

  if not ADOQuery2.IsEmpty then
  begin
  NilaiPenguji2.Text := FloatToStr(k3);
  end
  else
  begin
    NilaiPenguji2.Text := '';
  end;

end;

procedure TFInputNilaiAkhir.BtnRataRataClick(Sender: TObject);
var
x : double;
begin
x:=(k+k1+k2+k3)/4;

EdNilaiRataRata.Text := FloatToStr(x);

if (x >= 90) then
    AkumulasiNilaiHuruf.Text := 'A'
  else if (x >= 80) then
    AkumulasiNilaiHuruf.Text := 'B'
  else if (x >= 70) then
    AkumulasiNilaiHuruf.Text := 'C'
  else if (x >= 60) then
    AkumulasiNilaiHuruf.Text := 'D'
  else if (x >= 50) then
    AkumulasiNilaiHuruf.Text := 'E'
  else
    AkumulasiNilaiHuruf.Text := 'F';
end;

  end.
