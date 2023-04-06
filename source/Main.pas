
{

Créditos
    João B. S. Junior - (69) 9 9250-3445 - jr.playsoft@gmail.com

    Doações pelo PIX Chave Email: jr.playsoft@gmail.com

    https://codepen.io/arkev/pen/nRGEYZ

}



unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniURLFrame,
  uniPanel, uniPageControl, uniLabel, Vcl.Imaging.pngimage, uniImage, uniEdit,
  Vcl.Imaging.jpeg;

type
  TMainForm = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    PG_PRINCIPAL: TUniPageControl;
    tab_dados: TUniTabSheet;
    tab_produtos: TUniTabSheet;
    tab_transporte: TUniTabSheet;
    tab_totalizadores: TUniTabSheet;
    UniContainerPanel3: TUniContainerPanel;
    URLFrame: TUniURLFrame;
    UniContainerPanel4: TUniContainerPanel;
    UniContainerPanel5: TUniContainerPanel;
    UniLabel1: TUniLabel;
    UniContainerPanel6: TUniContainerPanel;
    UniImage1: TUniImage;
    UniContainerPanel14: TUniContainerPanel;
    UniContainerPanel13: TUniContainerPanel;
    UniContainerPanel15: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniEdit1: TUniEdit;
    base1: TUniContainerPanel;
    UniContainerPanel7: TUniContainerPanel;
    UniContainerPanel8: TUniContainerPanel;
    UniLabel2: TUniLabel;
    UniImage2: TUniImage;
    UniContainerPanel16: TUniContainerPanel;
    UniContainerPanel17: TUniContainerPanel;
    UniContainerPanel18: TUniContainerPanel;
    UniEdit2: TUniEdit;
    UniContainerPanel19: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniContainerPanel20: TUniContainerPanel;
    UniContainerPanel21: TUniContainerPanel;
    UniEdit3: TUniEdit;
    UniContainerPanel22: TUniContainerPanel;
    UniLabel7: TUniLabel;
    UniContainerPanel9: TUniContainerPanel;
    UniContainerPanel10: TUniContainerPanel;
    UniLabel3: TUniLabel;
    UniImage3: TUniImage;
    UniContainerPanel11: TUniContainerPanel;
    UniContainerPanel28: TUniContainerPanel;
    UniContainerPanel29: TUniContainerPanel;
    UniLabel9: TUniLabel;
    UniImage4: TUniImage;
    UniContainerPanel30: TUniContainerPanel;
    UniContainerPanel12: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniImage5: TUniImage;
    procedure UniFormShow(Sender: TObject);
    procedure URLFrameAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
  private
    procedure _PROC_Breadcrumb;
    function SubstituiStr(S, Localizar, Substituir: string): string;
    { Private declarations }
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

function TMainForm.SubstituiStr (S,Localizar,Substituir : string) : string;
begin
       Result:=StringReplace(S, Localizar, Substituir, [rfReplaceAll, rfIgnoreCase]);
end;


procedure TMainForm._PROC_Breadcrumb;
var

    Clique,
    xNome:string;
    xMenu,
    xHTML:TStringList;
begin

      URLFrame.HTML.Clear;

      xHTML:=TStringList.Create;
      xNome:=ExtractFileDir(ParamStr(0));

      xHTML.LoadFromFile(xNome+'\index.html');
      xMenu:=TStringList.Create;

      //-----------------------------------------------
      if PG_PRINCIPAL.ActivePage = tab_dados then
      begin
         Clique :='class="active" href="javascript:window.parent.ajaxRequest(window.parent.'+URLFrame.JSName+', ''_menu_nfe'', ['+QuotedStr('cod_produto='+'0')+']);"';
      end
      else
      begin
         Clique :='href="javascript:window.parent.ajaxRequest(window.parent.'+URLFrame.JSName+', ''_menu_nfe'', ['+QuotedStr('cod_produto='+'0')+']);"';
      end;
      xMenu.Add('<a '+Clique+'>Nota Fiscal</a>');

      if PG_PRINCIPAL.ActivePage = tab_produtos then
      begin
          Clique :='class="active" href="javascript:window.parent.ajaxRequest(window.parent.'+URLFrame.JSName+', ''_menu_produtos'', ['+QuotedStr('cod_produto='+'0')+']);"';
      end
      ELSE
      BEGIN
          Clique :='href="javascript:window.parent.ajaxRequest(window.parent.'+URLFrame.JSName+', ''_menu_produtos'', ['+QuotedStr('cod_produto='+'0')+']);"';
      END;
      xMenu.Add('<a '+Clique+'>Produtos</a>');



      //-----------------------------------------------
      if PG_PRINCIPAL.ActivePage = tab_transporte then
      begin
         Clique :='class="active" href="javascript:window.parent.ajaxRequest(window.parent.'+URLFrame.JSName+', ''_menu_transporte'', ['+QuotedStr('cod_produto='+'0')+']);"';
      end
      else
      begin
          Clique :='href="javascript:window.parent.ajaxRequest(window.parent.'+URLFrame.JSName+', ''_menu_transporte'', ['+QuotedStr('cod_produto='+'0')+']);"';
      end;
      xMenu.Add('<a '+Clique+'>Transporte</a>');


        if PG_PRINCIPAL.ActivePage = tab_totalizadores then
      begin
          Clique :='class="active" href="javascript:window.parent.ajaxRequest(window.parent.'+URLFrame.JSName+', ''_menu_totalizadores'', ['+QuotedStr('cod_produto='+'0')+']);"';
      end
      ELSE
      BEGIN
          Clique :='href="javascript:window.parent.ajaxRequest(window.parent.'+URLFrame.JSName+', ''_menu_totalizadores'', ['+QuotedStr('cod_produto='+'0')+']);"';
      END;
      xMenu.Add('<a '+Clique+'>Totalizadores</a>');

      xHTML.Text:=SubstituiStr(xHTML.Text,'{%menu%}', xMenu.Text);

      URLFrame.HTML.text:=xHTML.Text;

      xMenu.Free;
      xHTML.Free;


end;

procedure TMainForm.UniFormShow(Sender: TObject);
begin
       UniSession.AddJS('Ext.Loader.loadScript("/files/edit-border-radius_colors.css?'+IntToStr(random(9999))+'")');
       PG_PRINCIPAL.ActivePageIndex:=0;
       _PROC_Breadcrumb;
end;

procedure TMainForm.URLFrameAjaxEvent(Sender: TComponent; EventName: string;
  Params: TUniStrings);
begin

      if EventName='_menu_nfe' then
      begin
         PG_PRINCIPAL.ActivePage:=tab_dados;
         _PROC_Breadcrumb;
         exit;
      end;

      if EventName='_menu_produtos' then
      begin
         PG_PRINCIPAL.ActivePage:=tab_produtos;
         _PROC_Breadcrumb;
         exit;
      end;

      if EventName='_menu_transporte' then
      begin
         PG_PRINCIPAL.ActivePage:=tab_transporte;
         _PROC_Breadcrumb;
         exit;
      end;

      if EventName='_menu_totalizadores' then
      begin
         PG_PRINCIPAL.ActivePage:=tab_totalizadores;
         _PROC_Breadcrumb;
         exit;
      end;

end;

initialization
  RegisterAppFormClass(TMainForm);

end.
