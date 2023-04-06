
{

Créditos
    João B. S. Junior - (69) 9 9250-3445 - jr.playsoft@gmail.com

    Doações pelo PIX Chave Email: jr.playsoft@gmail.com

    https://codepen.io/arkev/pen/nRGEYZ

}
unit ServerModule;

interface

uses
  Classes, SysUtils, uniGUIServer, uniGUIMainModule, uniGUIApplication, uIdCustomHTTPServer,
  uniGUITypes;

type
  TUniServerModule = class(TUniGUIServerModule)
  private
    { Private declarations }
  protected
    procedure FirstInit; override;
  public
    { Public declarations }
  end;

function UniServerModule: TUniServerModule;

implementation

{$R *.dfm}

uses
  UniGUIVars;

function UniServerModule: TUniServerModule;
begin
  Result:=TUniServerModule(UniGUIServerInstance);
end;

procedure TUniServerModule.FirstInit;
begin
  InitServerModule(Self);
end;

initialization
  RegisterServerModuleClass(TUniServerModule);
end.
