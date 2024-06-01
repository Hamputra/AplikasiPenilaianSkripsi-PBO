unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniEdit, uniLabel,
  uniMultiItem, uniComboBox, uniMemo, uniRadioButton, uniRadioGroup, uniButton,
  unit5, Data.DB, Data.Win.ADODB;

type
  TFPembimbinganSkripsi = class(TUniForm)
    UniPanel1: TUniPanel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    EdNIM: TUniEdit;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    EdNamaMhs: TUniEdit;
    UniLabel5: TUniLabel;
    EdDospem1: TUniEdit;
    EdDospem2: TUniEdit;
    UniLabel6: TUniLabel;
    EdJudulSkripsi: TUniEdit;
    UniPanel2: TUniPanel;
    UniLabel7: TUniLabel;
    EdTglExRev: TUniEdit;
    UniLabel8: TUniLabel;
    EdBabExRev: TUniEdit;
    UniLabel9: TUniLabel;
    MemoExRev: TUniMemo;
    UniLabel10: TUniLabel;
    UniLabel11: TUniLabel;
    EdBab: TUniEdit;
    RadioButtonACC: TUniRadioGroup;
    LabelRevBaru: TUniLabel;
    MemoRevBaru: TUniMemo;
    BtnRevisi: TUniButton;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    EdNewTanggal: TUniEdit;
    BtnSimpan: TUniButton;
    DataSource2: TDataSource;
    ADOQuery2: TADOQuery;
    procedure RadioButtonACCClick(Sender: TObject);
    procedure EdNIMChange(Sender: TObject);
    procedure BtnRevisiClick(Sender: TObject);
    procedure BtnSimpanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FPembimbinganSkripsi: TFPembimbinganSkripsi;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function FPembimbinganSkripsi: TFPembimbinganSkripsi;
begin
  Result := TFPembimbinganSkripsi(UniMainModule.GetFormInstance(TFPembimbinganSkripsi));
end;




procedure TFPembimbinganSkripsi.EdNIMChange(Sender: TObject);
begin
 // Lakukan pencarian data berdasarkan NIM
  ADOQuery1.SQL.Text := 'SELECT Nama, JudulSkripsi, Penguji1, Penguji2 FROM Mahasiswa WHERE NIM = :nim';
  ADOQuery1.Parameters.ParamByName('nim').Value := EdNIM.Text;
  ADOQuery1.Open;

  // Tampilkan hasil pencarian
  if not ADOQuery1.IsEmpty then
  begin
    EdNamaMhs.Text := ADOQuery1.FieldByName('Nama').AsString;
    EdJudulSkripsi.Text := ADOQuery1.FieldByName('JudulSkripsi').AsString;
    EdDospem1.Text := ADOQuery1.FieldByName('Penguji1').AsString;
    EdDospem2.Text := ADOQuery1.FieldByName('Penguji2').AsString;
  end
  else
  begin
    EdNamaMhs.Text := '';
    EdJudulSkripsi.Text := '';
    EdDospem1.Text := '';
    EdDospem2.Text := '';
  end;

  ADOQuery2.SQL.Text := 'SELECT Tanggal, Bab, IsiRevisi FROM TabelRevisi WHERE NIM = :nim';
  ADOQuery2.Parameters.ParamByName('nim').Value := EdNIM.Text;
  ADOQuery2.Open;

  if (ADOQuery2.FieldByName('IsiRevisi').AsString = 'ACC') or (ADOQuery2.FieldByName('IsiRevisi').AsString = '') then
  begin
    RadioButtonACC.ItemIndex := 0;
    UniPanel2.Visible := False;
    EdNewTanggal.Text := ADOQuery2.FieldByName('Tanggal').AsString;
    EdBab.Text := ADOQuery2.FieldByName('Bab').AsString;
  end
  else
  begin
    RadioButtonACC.ItemIndex := 1;
    LabelRevBaru.Visible := True;
    MemoRevBaru.Visible := True;
    BtnRevisi.Visible := True;
    BtnSimpan.Visible := False;
    UniPanel2.Visible := True;
    EdTglExRev.Text := ADOQuery2.FieldByName('Tanggal').AsString;
    EdBabExRev.Text := ADOQuery2.FieldByName('Bab').AsString;
    MemoExRev.Text := ADOQuery2.FieldByName('IsiRevisi').AsString;
  end;


end;

procedure TFPembimbinganSkripsi.BtnRevisiClick(Sender: TObject);
begin
    ADOQuery2.SQL.Text := 'UPDATE TabelRevisi SET Tanggal = :x, Bab = :y, IsiRevisi = :z WHERE NIM = :nim';

    ADOQuery2.Parameters.ParamByName('x').Value := EdNewTanggal.Text;
    ADOQuery2.Parameters.ParamByName('y').Value := EdBab.Text;
    ADOQuery2.Parameters.ParamByName('z').Value := MemoRevBaru.Text;
    ADOQuery2.Parameters.ParamByName('nim').Value := EdNIM.Text;
    ADOQuery2.ExecSQL;
    Showmessage('data berhasil di simpan');
    close;
end;

procedure TFPembimbinganSkripsi.BtnSimpanClick(Sender: TObject);
begin
    ADOQuery2.SQL.Text := 'UPDATE TabelRevisi SET Tanggal = :x, Bab = :y, IsiRevisi = :z WHERE NIM = :nim';

    ADOQuery2.Parameters.ParamByName('x').Value := EdNewTanggal.Text;
    ADOQuery2.Parameters.ParamByName('y').Value := EdBab.Text;
    ADOQuery2.Parameters.ParamByName('z').Value := 'ACC';
    ADOQuery2.Parameters.ParamByName('nim').Value := EdNIM.Text;
    ADOQuery2.ExecSQL;
    Showmessage('data berhasil di simpan');
    close;
end;

procedure TFPembimbinganSkripsi.RadioButtonACCClick(Sender: TObject);
begin
case RadioButtonACC.ItemIndex of
    0:
      begin
        LabelRevBaru.Visible := False;
        MemoRevBaru.Visible := False;
        BtnRevisi.Visible := False;
        BtnSimpan.Visible := True;
      end;
    1:
      begin
        LabelRevBaru.Visible := True;
        MemoRevBaru.Visible := True;
        BtnRevisi.Visible := True;
        BtnSimpan.Visible := False;
      end;
      end;
end;



end.
