unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, Data.DB, Data.Win.ADODB;

type
  TUniMainModule = class(TUniGUIMainModule)
    ADOConnection1: TADOConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UniMainModule: TUniMainModule;

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication;

function UniMainModule: TUniMainModule;
begin
  Result := TUniMainModule(UniApplication.UniMainModule)
end;

initialization
  RegisterMainModuleClass(TUniMainModule);
end.
