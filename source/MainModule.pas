
{

Créditos
    João B. S. Junior - (69) 9 9250-3445 - jr.playsoft@gmail.com

    Doações pelo PIX Chave Email: jr.playsoft@gmail.com

    https://codepen.io/arkev/pen/nRGEYZ

}
unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes;

type
  TUniMainModule = class(TUniGUIMainModule)
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
