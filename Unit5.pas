unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniEdit,
  uniLabel, uniMultiItem, uniComboBox, uniButton, Data.DB, Data.Win.ADODB;

type
  TFPendaftaranSidang = class(TUniForm)
    UniPanel1: TUniPanel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    EdNIM: TUniEdit;
    UniLabel4: TUniLabel;
    EdNamaMhs: TUniEdit;
    UniLabel5: TUniLabel;
    EdDospem1: TUniEdit;
    EdDospem2: TUniEdit;
    EdJudulSkripsi: TUniEdit;
    UniLabel6: TUniLabel;
    UniLabel10: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel7: TUniLabel;
    UniLabel8: TUniLabel;
    UniLabel9: TUniLabel;
    UniLabel11: TUniLabel;
    UniLabel12: TUniLabel;
    BtnUpdate: TUniButton;
    UniButton1: TUniButton;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    EdTanggalSidang: TUniEdit;
    DataSource2: TDataSource;
    ADOQuery2: TADOQuery;
    DataSource3: TDataSource;
    ADOQuery3: TADOQuery;
    n1: TUniComboBox;
    n2: TUniComboBox;
    n3: TUniComboBox;
    n4: TUniComboBox;
    n5: TUniComboBox;
    procedure EdNIMChange(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FPendaftaranSidang: TFPendaftaranSidang;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function FPendaftaranSidang: TFPendaftaranSidang;
begin
  Result := TFPendaftaranSidang(UniMainModule.GetFormInstance(TFPendaftaranSidang));
end;




procedure TFPendaftaranSidang.EdNIMChange(Sender: TObject);
begin
 // Lakukan pencarian data berdasarkan NIM dari UniEdit1
  ADOQuery1.SQL.Text := 'SELECT Nama, JudulSkripsi, Penguji1, Penguji2 FROM Mahasiswa WHERE NIM = :nim';
  ADOQuery1.Parameters.ParamByName('nim').Value := EdNIM.Text;
  ADOQuery1.Open;

  // Tampilkan hasil pencarian di UniEdit2
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

  ADOQuery2.SQL.Text := 'SELECT Tanggal FROM TabelRevisi WHERE NIM = :nim';
  ADOQuery2.Parameters.ParamByName('nim').Value := EdNIM.Text;
  ADOQuery2.Open;

  if not ADOQuery2.IsEmpty then
  begin
    EdTanggalSidang.Text := ADOQuery2.FieldByName('Tanggal').AsString;

  end
  else
  begin
    EdTanggalSidang.Text := '';
  end;

  ADOQuery3.SQL.Text := 'SELECT Persyaratan1, Persyaratan2, Persyaratan3, Persyaratan4, Persyaratan5 FROM PesyaratanSidang WHERE NIM = :nim';
  ADOQuery3.Parameters.ParamByName('nim').Value := EdNIM.Text;
  ADOQuery3.Open;

  if not ADOQuery3.IsEmpty then
  begin
    n1.Text := ADOQuery3.FieldByName('Persyaratan1').AsString;
    n2.Text := ADOQuery3.FieldByName('Persyaratan2').AsString;
    n3.Text := ADOQuery3.FieldByName('Persyaratan3').AsString;
    n4.Text := ADOQuery3.FieldByName('Persyaratan4').AsString;
    n5.Text := ADOQuery3.FieldByName('Persyaratan5').AsString;
  end
  else
  begin
    n1.ItemIndex := 1;
    n2.ItemIndex := 1;
    n3.ItemIndex := 1;
    n4.ItemIndex := 1;
    n5.ItemIndex := 1;
  end;
  ADOQuery3.Close;
end;

procedure TFPendaftaranSidang.UniButton1Click(Sender: TObject);
begin
close;
end;

procedure TFPendaftaranSidang.BtnUpdateClick(Sender: TObject);
begin
  ADOQuery1.SQL.Text := 'UPDATE PesyaratanSidang SET Persyaratan1 = :n1, Persyaratan2 = :n2, Persyaratan3 = :n3, Persyaratan4 = :n4, Persyaratan5 = :n5 WHERE NIM = :nim';

  ADOQuery1.Parameters.ParamByName('n1').Value := n1.Text;
  ADOQuery1.Parameters.ParamByName('n2').Value := n2.Text;
  ADOQuery1.Parameters.ParamByName('n3').Value := n3.Text;
  ADOQuery1.Parameters.ParamByName('n4').Value := n4.Text;
  ADOQuery1.Parameters.ParamByName('n5').Value := n5.Text;
  ADOQuery1.Parameters.ParamByName('nim').Value := EdNIM.Text;
  ADOQuery1.ExecSQL;
  Showmessage('data berhasil di simpan');
  close;
end;

end.
