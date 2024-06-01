unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniEdit, uniLabel,
  uniMultiItem, uniComboBox, uniButton, Data.DB, Data.Win.ADODB;

type
  TFInputNilaiPenguji = class(TUniForm)
    UniPanel1: TUniPanel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    EdNIM: TUniEdit;
    UniLabel4: TUniLabel;
    EdNamaMhs: TUniEdit;
    UniLabel7: TUniLabel;
    StatusPenguji: TUniComboBox;
    UniLabel3: TUniLabel;
    UniLabel5: TUniLabel;
    Nilai1: TUniEdit;
    UniLabel6: TUniLabel;
    UniLabel8: TUniLabel;
    Nilai2: TUniEdit;
    UniLabel9: TUniLabel;
    Nilai3: TUniEdit;
    UniLabel10: TUniLabel;
    Nilai4: TUniEdit;
    UniLabel11: TUniLabel;
    Nilai5: TUniEdit;
    UniLabel12: TUniLabel;
    Nilai6: TUniEdit;
    UniLabel13: TUniLabel;
    UniLabel14: TUniLabel;
    Nilai7: TUniEdit;
    UniLabel15: TUniLabel;
    Nilai8: TUniEdit;
    UniLabel27: TUniLabel;
    Nilai9: TUniEdit;
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
    procedure BtnSimpanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FInputNilaiPenguji: TFInputNilaiPenguji;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function FInputNilaiPenguji: TFInputNilaiPenguji;
begin
  Result := TFInputNilaiPenguji(UniMainModule.GetFormInstance(TFInputNilaiPenguji));
end;

procedure TFInputNilaiPenguji.BtnSimpanClick(Sender: TObject);
begin
case StatusPenguji.itemindex of
  0:
  begin
  ADOQuery2.SQL.Text := 'UPDATE NilaiKetuaPenguji SET Signifikan_Masalah = :Nilai1, Metode_Penelitian = :Nilai2,' +
                        'Sistematika_Pembahasan = :Nilai3, Analisis = :Nilai4, Keputusan = :Nilai5, Aspek_Penulisan = :Nilai6,' +
                        'Penguasaan_Materi = :Nilai7, Presentasi = :Nilai8, Konsultasi = :Nilai9 WHERE NIM = :nim';

  ADOQuery2.Parameters.ParamByName('Nilai1').Value := StrToInt(Nilai1.Text);
  ADOQuery2.Parameters.ParamByName('Nilai2').Value := StrToInt(Nilai2.Text);
  ADOQuery2.Parameters.ParamByName('Nilai3').Value := StrToInt(Nilai3.Text);
  ADOQuery2.Parameters.ParamByName('Nilai4').Value := StrToInt(Nilai4.Text);
  ADOQuery2.Parameters.ParamByName('Nilai5').Value := StrToInt(Nilai5.Text);
  ADOQuery2.Parameters.ParamByName('Nilai6').Value := StrToInt(Nilai6.Text);
  ADOQuery2.Parameters.ParamByName('Nilai7').Value := StrToInt(Nilai7.Text);
  ADOQuery2.Parameters.ParamByName('Nilai8').Value := StrToInt(Nilai8.Text);
  ADOQuery2.Parameters.ParamByName('Nilai9').Value := StrToInt(Nilai9.Text);
  ADOQuery2.Parameters.ParamByName('nim').Value := EdNIM.Text;
  ADOQuery2.ExecSQL;

  Showmessage('data berhasil di tambahkan');
  end;
  1:
  begin
  ADOQuery3.SQL.Text := 'UPDATE NilaiSekretarisPenguji SET Signifikan_Masalah = :Nilai1, Metode_Penelitian = :Nilai2,' +
                        'Sistematika_Pembahasan = :Nilai3, Analisis = :Nilai4, Keputusan = :Nilai5, Aspek_Penulisan = :Nilai6,' +
                        'Penguasaan_Materi = :Nilai7, Presentasi = :Nilai8, Konsultasi = :Nilai9 WHERE NIM = :nim';

  ADOQuery3.Parameters.ParamByName('Nilai1').Value := StrToInt(Nilai1.Text);
  ADOQuery3.Parameters.ParamByName('Nilai2').Value := StrToInt(Nilai2.Text);
  ADOQuery3.Parameters.ParamByName('Nilai3').Value := StrToInt(Nilai3.Text);
  ADOQuery3.Parameters.ParamByName('Nilai4').Value := StrToInt(Nilai4.Text);
  ADOQuery3.Parameters.ParamByName('Nilai5').Value := StrToInt(Nilai5.Text);
  ADOQuery3.Parameters.ParamByName('Nilai6').Value := StrToInt(Nilai6.Text);
  ADOQuery3.Parameters.ParamByName('Nilai7').Value := StrToInt(Nilai7.Text);
  ADOQuery3.Parameters.ParamByName('Nilai8').Value := StrToInt(Nilai8.Text);
  ADOQuery3.Parameters.ParamByName('Nilai9').Value := StrToInt(Nilai9.Text);
  ADOQuery3.Parameters.ParamByName('nim').Value := EdNIM.Text;
  ADOQuery3.ExecSQL;

  Showmessage('data berhasil di tambahkan');
  end;
  2:
  begin
  ADOQuery4.SQL.Text := 'UPDATE NilaiPenguji1 SET Signifikan_Masalah = :Nilai1, Metode_Penelitian = :Nilai2,' +
                        'Sistematika_Pembahasan = :Nilai3, Analisis = :Nilai4, Keputusan = :Nilai5, Aspek_Penulisan = :Nilai6,' +
                        'Penguasaan_Materi = :Nilai7, Presentasi = :Nilai8, Konsultasi = :Nilai9 WHERE NIM = :nim';

  ADOQuery4.Parameters.ParamByName('Nilai1').Value := StrToInt(Nilai1.Text);
  ADOQuery4.Parameters.ParamByName('Nilai2').Value := StrToInt(Nilai2.Text);
  ADOQuery4.Parameters.ParamByName('Nilai3').Value := StrToInt(Nilai3.Text);
  ADOQuery4.Parameters.ParamByName('Nilai4').Value := StrToInt(Nilai4.Text);
  ADOQuery4.Parameters.ParamByName('Nilai5').Value := StrToInt(Nilai5.Text);
  ADOQuery4.Parameters.ParamByName('Nilai6').Value := StrToInt(Nilai6.Text);
  ADOQuery4.Parameters.ParamByName('Nilai7').Value := StrToInt(Nilai7.Text);
  ADOQuery4.Parameters.ParamByName('Nilai8').Value := StrToInt(Nilai8.Text);
  ADOQuery4.Parameters.ParamByName('Nilai9').Value := StrToInt(Nilai9.Text);
  ADOQuery4.Parameters.ParamByName('nim').Value := EdNIM.Text;
  ADOQuery4.ExecSQL;

  Showmessage('data berhasil di tambahkan');
  end;
  3:
  begin
  ADOQuery5.SQL.Text := 'UPDATE NilaiPenguji2 SET Signifikan_Masalah = :Nilai1, Metode_Penelitian = :Nilai2,' +
                        'Sistematika_Pembahasan = :Nilai3, Analisis = :Nilai4, Keputusan = :Nilai5, Aspek_Penulisan = :Nilai6,' +
                        'Penguasaan_Materi = :Nilai7, Presentasi = :Nilai8, Konsultasi = :Nilai9 WHERE NIM = :nim';

  ADOQuery5.Parameters.ParamByName('Nilai1').Value := StrToInt(Nilai1.Text);
  ADOQuery5.Parameters.ParamByName('Nilai2').Value := StrToInt(Nilai2.Text);
  ADOQuery5.Parameters.ParamByName('Nilai3').Value := StrToInt(Nilai3.Text);
  ADOQuery5.Parameters.ParamByName('Nilai4').Value := StrToInt(Nilai4.Text);
  ADOQuery5.Parameters.ParamByName('Nilai5').Value := StrToInt(Nilai5.Text);
  ADOQuery5.Parameters.ParamByName('Nilai6').Value := StrToInt(Nilai6.Text);
  ADOQuery5.Parameters.ParamByName('Nilai7').Value := StrToInt(Nilai7.Text);
  ADOQuery5.Parameters.ParamByName('Nilai8').Value := StrToInt(Nilai8.Text);
  ADOQuery5.Parameters.ParamByName('Nilai9').Value := StrToInt(Nilai9.Text);
  ADOQuery5.Parameters.ParamByName('nim').Value := EdNIM.Text;
  ADOQuery5.ExecSQL;

  Showmessage('data berhasil di tambahkan');
  end;

end;


  end;

procedure TFInputNilaiPenguji.EdNIMChange(Sender: TObject);
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
end;

end.
