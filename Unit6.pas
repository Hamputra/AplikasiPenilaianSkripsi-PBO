unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniBasicGrid,
  uniStringGrid, uniEdit, uniLabel, uniButton, Data.DB, Data.Win.ADODB,
  uniDBGrid;

type
  TFPenentuan = class(TUniForm)
    UniPanel1: TUniPanel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    EdNIM: TUniEdit;
    UniLabel4: TUniLabel;
    EdNamaMhs: TUniEdit;
    UniLabel3: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    EdNoPengujiUtama: TUniEdit;
    EdNipPengujiUtama: TUniEdit;
    EdJudulSkripsi: TUniEdit;
    UniLabel7: TUniLabel;
    EdNamaPengujiUtama: TUniEdit;
    UniLabel8: TUniLabel;
    EdNoSekretarisPenguji: TUniEdit;
    EdNipSekretarisPenguji: TUniEdit;
    EdNamaSekretarisPenguji: TUniEdit;
    UniLabel9: TUniLabel;
    EdDospem1: TUniEdit;
    EdDospem2: TUniEdit;
    UniLabel10: TUniLabel;
    BtnSimpan: TUniButton;
    BtnBatal: TUniButton;
    BtnKeluar: TUniButton;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    UniDBGrid1: TUniDBGrid;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    procedure EdNIMChange(Sender: TObject);
    procedure UniDBGrid1AfterLoad(Sender: TUniCustomDBGrid);
    procedure EdNoPengujiUtamaChange(Sender: TObject);
    procedure EdNoSekretarisPengujiChange(Sender: TObject);
    procedure BtnSimpanClick(Sender: TObject);
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnKeluarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FPenentuan: TFPenentuan;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function FPenentuan: TFPenentuan;
begin
  Result := TFPenentuan(UniMainModule.GetFormInstance(TFPenentuan));
end;





procedure TFPenentuan.EdNIMChange(Sender: TObject);
begin
 // Lakukan pencarian data berdasarkan NIM dari UniEdit1
  ADOQuery1.SQL.Text := 'SELECT Nama, JudulSkripsi, Penguji1, Penguji2, PengujiUtama, SekretarisPenguji FROM Mahasiswa WHERE NIM = :nim';
  ADOQuery1.Parameters.ParamByName('nim').Value := EdNIM.Text;
  ADOQuery1.Open;

  // Tampilkan hasil pencarian di UniEdit2
  if not ADOQuery1.IsEmpty then
  begin
    EdNamaMhs.Text := ADOQuery1.FieldByName('Nama').AsString;
    EdJudulSkripsi.Text := ADOQuery1.FieldByName('JudulSkripsi').AsString;
    EdDospem1.Text := ADOQuery1.FieldByName('Penguji1').AsString;
    EdDospem2.Text := ADOQuery1.FieldByName('Penguji2').AsString;
    EdNamaPengujiUtama.Text := ADOQuery1.FieldByName('PengujiUtama').AsString;
    EdNamaSekretarisPenguji.Text := ADOQuery1.FieldByName('SekretarisPenguji').AsString;
  end
  else
  begin
    EdNamaMhs.Text := '';
    EdJudulSkripsi.Text := '';
    EdDospem1.Text := '';
    EdDospem2.Text := '';
    EdNamaPengujiUtama.Text := '';
    EdNamaSekretarisPenguji.Text := '';
  end;

  ADOQuery1.SQL.Text := 'SELECT NIP, ID FROM Dosen WHERE NamaDosen = :nama';
  ADOQuery1.Parameters.ParamByName('nama').Value := EdNamaPengujiUtama.Text;
  ADOQuery1.Open;

  if not ADOQuery1.IsEmpty then
  begin
    EdNipPengujiUtama.Text := ADOQuery1.FieldByName('NIP').AsString;
    EdNoPengujiUtama.Text := ADOQuery1.FieldByName('ID').AsString;
  end
  else
  begin
    EdNipPengujiUtama.Text := '';
    EdNoPengujiUtama.Text := '';
  end;

  ADOQuery1.SQL.Text := 'SELECT NIP, ID FROM Dosen WHERE NamaDosen = :nama';
  ADOQuery1.Parameters.ParamByName('nama').Value := EdNamaSekretarisPenguji.Text;
  ADOQuery1.Open;

  if not ADOQuery1.IsEmpty then
  begin
    EdNipSekretarisPenguji.Text := ADOQuery1.FieldByName('NIP').AsString;
    EdNoSekretarisPenguji.Text := ADOQuery1.FieldByName('ID').AsString;
  end
  else
  begin
    EdNipSekretarisPenguji.Text := '';
    EdNoSekretarisPenguji.Text := '';
  end;
end;

procedure TFPenentuan.EdNoPengujiUtamaChange(Sender: TObject);
begin
  ADOQuery1.SQL.Text := 'SELECT NIP, NamaDosen FROM Dosen WHERE ID = :id';
  ADOQuery1.Parameters.ParamByName('id').Value := EdNoPengujiUtama.Text;
  ADOQuery1.Open;

   if not ADOQuery1.IsEmpty then
  begin
    EdNipPengujiUtama.Text := ADOQuery1.FieldByName('NIP').AsString;
    EdNamaPengujiUtama.Text := ADOQuery1.FieldByName('NamaDosen').AsString;
  end
  else
  begin
    EdNipPengujiUtama.Text := '';
    EdNamaPengujiUtama.Text := '';
  end;
end;

procedure TFPenentuan.EdNoSekretarisPengujiChange(Sender: TObject);
begin
  ADOQuery1.SQL.Text := 'SELECT NIP, NamaDosen FROM Dosen WHERE ID = :id';
  ADOQuery1.Parameters.ParamByName('id').Value := EdNoSekretarisPenguji.Text;
  ADOQuery1.Open;

   if not ADOQuery1.IsEmpty then
  begin
    EdNipSekretarisPenguji.Text := ADOQuery1.FieldByName('NIP').AsString;
    EdNamaSekretarisPenguji.Text := ADOQuery1.FieldByName('NamaDosen').AsString;
  end
  else
  begin
    EdNipSekretarisPenguji.Text := '';
    EdNamaSekretarisPenguji.Text := '';
  end;
end;

procedure TFPenentuan.BtnBatalClick(Sender: TObject);
begin
EdNIM.Text := '';
EdNamaMhs.Text := '';
EdJudulSkripsi.Text := '';
EdNoPengujiUtama.Text := '';
EdNipPengujiUtama.Text := '';
EdNamaPengujiUtama.Text := '';
EdNoSekretarisPenguji.Text := '';
EdNipSekretarisPenguji.Text := '';
EdNamaSekretarisPenguji.Text := '';
EdDospem1.Text := '';
EdDospem2.Text := '';

end;

procedure TFPenentuan.BtnKeluarClick(Sender: TObject);
begin
close;
end;

procedure TFPenentuan.BtnSimpanClick(Sender: TObject);
begin
  ADOQuery1.SQL.Text := 'UPDATE Mahasiswa SET PengujiUtama = :x, SekretarisPenguji = :y WHERE NIM = :nim';

  ADOQuery1.Parameters.ParamByName('x').Value := EdNamaPengujiUtama.Text;
  ADOQuery1.Parameters.ParamByName('y').Value := EdNamaSekretarisPenguji.Text;
  ADOQuery1.Parameters.ParamByName('nim').Value := EdNIM.Text;
  ADOQuery1.ExecSQL;
  Showmessage('data berhasil di simpan');
  close;

end;

procedure TFPenentuan.UniDBGrid1AfterLoad(Sender: TUniCustomDBGrid);
begin
     UniDBGrid1.Columns[0].Width := 50;
     UniDBGrid1.Columns[1].Width := 50;
end;

end.
