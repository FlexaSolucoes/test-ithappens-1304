unit uprincipal_vcl;

interface

uses
  Winapi.Windows      ,
  Winapi.Messages     ,
  System.SysUtils     ,
  System.Variants     ,
  System.Classes      ,
  Vcl.Graphics        ,
  Vcl.Controls        ,
  Vcl.Forms           ,
  Vcl.Dialogs         ,
//  datamodule          ,
  Vcl.Imaging.pngimage,
  Vcl.ExtCtrls        ,
  Vcl.Imaging.jpeg    ;

type
  Tfrmprincipal_vcl = class(TForm)
    pnlTitulo: TPanel;
    imgSair: TImage;
    imgMenu: TImage;
    pnlPrincipal: TPanel;
    pnlMenuPrincipal: TPanel;
    pnlMenuItemCadastro: TPanel;
    ScrollBoxCadastros: TScrollBox;
    imgCadastros: TImage;
    pnlMenuItemPedido: TPanel;
    ScrollBox1: TScrollBox;
    imgPedido: TImage;
    pnlMenuItemSistema: TPanel;
    ScrollBox2: TScrollBox;
    imgLogin: TImage;
    imgSistema: TImage;
    imgMenuSair: TImage;
    imgCadasroPais: TImage;
    procedure MenuInicializar;
    procedure MenuShow;
    procedure MenuItemShow(MenuItem:TPanel);
    procedure SairAplicacao;
    procedure imgSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure imgMenuClick(Sender: TObject);
    procedure imgCadastrosClick(Sender: TObject);
    procedure imgMenuSairClick(Sender: TObject);
    procedure imgCadasroPaisClick(Sender: TObject);
  private
    { Private declarations }
    function MenuAtual(obj:TObject):TPanel;
    function AlturaMenu(obj:TPanel):integer;
  public
    { Public declarations }
  end;



var frmprincipal_vcl: Tfrmprincipal_vcl;

implementation

//uses ufrmCadastroPais;
uses ufrmpedido;

const iLarguraMenu       =050;
const iLarguraMaxMenu    =201;
const iAlturaMaxMenuItem =201;
const iAlturaMimMenuItem =040;

{$R *.dfm}

function Tfrmprincipal_vcl.MenuAtual(obj:TObject):TPanel;
var i:Integer;
begin
     Result:=nil;
     for i := 0 to pred(ComponentCount) do
     begin
          if (Components[i] = obj) then
          begin
               if (Components[i].GetParentComponent) Is TPanel then
               begin
                    Result:= TPanel(Components[i].GetParentComponent);
                    Break;
               end
               else
               begin
                    Result:= MenuAtual(Components[i].GetParentComponent);
                    if Result<>nil then
                    begin
                         Break;
                    end;
               end;
          end;
     end;
end;

function Tfrmprincipal_vcl.AlturaMenu(obj: TPanel): integer;
var i:Integer;
var iqtditens:Integer;
begin
     iqtditens:=-1;
     for i := 0 to pred(ComponentCount) do
     begin
          if (Components[i].GetParentComponent = pnlMenuPrincipal) then
          begin
               if (Components[i].GetParentComponent) Is TPanel then
               begin
                    Inc(iqtditens);
               end;
          end;
     end;
     Result:=pnlMenuPrincipal.Height-(iqtditens*iAlturaMimMenuItem)-10;
end;

procedure Tfrmprincipal_vcl.MenuInicializar;
var i:Integer;
begin
     pnlMenuPrincipal        .Width  := iLarguraMenu;
//     pnlMenuItemCadastro     .Height := iAlturaMimMenuItem;
//     pnlMenuItemPreferencias .Height := iAlturaMimMenuItem;
//     pnlMenuItemSistema      .Height := iAlturaMimMenuItem;

     for i := 0 to pred(ComponentCount) do
     begin
          if (Components[i].GetParentComponent = pnlMenuPrincipal) then
          begin
               if (Components[i]) Is TPanel then
               begin
                    TPanel(Components[i]).Height := iAlturaMimMenuItem;
               end;
          end;
          if (Components[i]) Is TScrollBox then
          begin
               TScrollBox(Components[i]).VertScrollBar.Visible := false;
               TScrollBox(Components[i]).Update;
          end;
     end;

end;

procedure Tfrmprincipal_vcl.MenuShow;
var i:integer;
   procedure Recolher(MI:TPanel);
   var j:Integer;
   begin
        for j := 0 to pred(ComponentCount) do
        begin
             if (Components[i]) Is TScrollBox then
             begin
                  TScrollBox(Components[i]).VertScrollBar.Visible := false;
                  TScrollBox(Components[i]).Update;
             end;
        end;
        while MI.Height>iAlturaMimMenuItem do
        begin
             MI.Height:=MI.Height-2;
             MI.Update;
             pnlPrincipal.Update;
        end;
   end;
begin
     if pnlMenuPrincipal.Width = iLarguraMenu then
     begin
          while pnlMenuPrincipal.Width<iLarguraMaxMenu do
          begin
               pnlMenuPrincipal.Width:=pnlMenuPrincipal.Width+2;
               pnlMenuPrincipal.Update;
          end;

     end
     else
     begin
          for i := 0 to pred(ComponentCount) do
          begin
               if (Components[i].GetParentComponent = pnlMenuPrincipal) then
               begin
                    if (Components[i]) Is TPanel then
                    begin
                         Recolher(TPanel(Components[i]));
                    end;
               end;
          end;
          while pnlMenuPrincipal.Width>iLarguraMenu do
          begin
               pnlMenuPrincipal.Width:=pnlMenuPrincipal.Width-2;
               pnlMenuPrincipal.Update;
          end;
          pnlMenuPrincipal.Width:=iLarguraMenu;
     end;
end;

procedure Tfrmprincipal_vcl.MenuItemShow(MenuItem:TPanel);
var i:Integer;

   procedure Recolher(MI:TPanel);
   var j:Integer;
   begin
        for j := 0 to pred(ComponentCount) do
        begin
             if (Components[i].GetParentComponent = MenuItem) then
             begin
                  if (Components[i]) Is TScrollBox then
                  begin
                       TScrollBox(Components[i]).VertScrollBar.Visible := false;
                       TScrollBox(Components[i]).Update;
                  end;
             end;
        end;
        while MI.Height>iAlturaMimMenuItem do
        begin
             MI.Height:=MI.Height-2;
             MI.Update;
             pnlPrincipal.Update;
        end;
   end;

   procedure Expandir(MI:TPanel);
   var j:Integer;
   var iAltura:Integer;
   begin
        iAltura:=AlturaMenu(MI);
        while MI.Height<iAltura do
        begin
             MI.Height:=MI.Height+2;
             MI.Update;
             pnlPrincipal.Update;
        end;
        for j := 0 to pred(ComponentCount) do
        begin
             if (Components[i].GetParentComponent = MenuItem) then
             begin
                  if (Components[i]) Is TScrollBox then
                  begin
                       TScrollBox(Components[i]).VertScrollBar.Visible := true;
                       TScrollBox(Components[i]).Update;
                  end;
             end;
        end;
   end;
begin
     if pnlMenuPrincipal.Width = iLarguraMenu then
     begin
          MenuShow;
     end;

     for i := 0 to pred(ComponentCount) do
     begin
          if (Components[i].GetParentComponent = pnlMenuPrincipal) then
          begin
               if (Components[i]) Is TPanel then
               begin
                    if (TPanel(Components[i]).Name <> MenuItem.Name) then
                    begin
                         Recolher(TPanel(Components[i]));
                    end;
               end;
          end;
     end;

     for i := 0 to pred(ComponentCount) do
     begin
          if (Components[i].GetParentComponent = pnlMenuPrincipal) then
          begin
               if (Components[i]) Is TPanel then
               begin
                    if (TPanel(Components[i]).Name = MenuItem.Name) then
                    begin
                         if (TPanel(Components[i]).Height=iAlturaMimMenuItem) then
                         begin
                              Expandir(TPanel(Components[i]));
                         end
                         else
                         begin
                              Recolher(TPanel(Components[i]));
                         end;
                    end;
               end;
          end;
     end;
end;

procedure Tfrmprincipal_vcl.FormCreate(Sender: TObject);
begin
     MenuInicializar;
end;

procedure Tfrmprincipal_vcl.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case Key of
        VK_ESCAPE : SairAplicacao;
     end;
end;

procedure Tfrmprincipal_vcl.imgCadasroPaisClick(Sender: TObject);
//var F:TfrmCadastroPais;
begin
//     F:=TfrmCadastroPais.Create(nil);
//     F.ShowModal;
//     F.Free;
end;

procedure Tfrmprincipal_vcl.imgCadastrosClick(Sender: TObject);
var F:Tfrmpedido;
begin
     F:=Tfrmpedido.Create(nil);
     F.ShowModal;
     F.Free;
end;

procedure Tfrmprincipal_vcl.imgMenuClick(Sender: TObject);
begin
     MenuShow;
end;

procedure Tfrmprincipal_vcl.imgMenuSairClick(Sender: TObject);
begin
     SairAplicacao;
end;

procedure Tfrmprincipal_vcl.imgSairClick(Sender: TObject);
begin
     SairAplicacao;
end;

procedure Tfrmprincipal_vcl.SairAplicacao;
begin
     if MessageDlg('Deseja realmente sair da aplicação?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 1, TMsgDlgBtn.mbNo) = mrYes then
     begin
          Application.Terminate;
     end;
end;

end.
