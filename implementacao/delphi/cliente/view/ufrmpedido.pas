unit ufrmpedido;

interface

uses
  Winapi.Windows             ,
  Winapi.Messages            ,
  System.SysUtils            ,
  System.Variants            ,
  System.Classes             ,
  System.JSON                ,
  System.Generics.Collections,
  Vcl.Graphics               ,
  Vcl.Controls               ,
  Vcl.Forms                  ,
  Vcl.Dialogs                ,
  Vcl.StdCtrls               ,
  Vcl.Imaging.pngimage       ,
  Vcl.ExtCtrls               ,
  Vcl.ComCtrls               ,
  REST.Types                 ,
  REST.Client                ,
  REST.Json                  ,
  Data.Bind.Components       ,
  Data.Bind.ObjectScope      ,
  model.entity.filiais       ,
  model.entity.tipo_movimento,
  model.entity.clientes      ,
  model.entity.pedidoestoque ,
  model.entity.retorno       ,
  model.Patterns.functions   ;

type
  Tfrmpedido = class(TForm)
    pnlTitulo         : TPanel;
    imgSair           : TImage;
    pnlPrincipal      : TPanel;
    pnlCabecalhoPedido: TPanel;
    RESTClient        : TRESTClient;
    RESTRequest       : TRESTRequest;
    cmbFilial         : TComboBox;
    cmbtipomovimento  : TComboBox;
    cmbcliente        : TComboBox;
    lblFilial: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    pnlRodapePedido: TPanel;
    RESTResponse: TRESTResponse;
    ListViewItens: TListView;
    pnlItens: TPanel;
    pnlProduto: TPanel;
    pnlBotoes: TPanel;
    pnlMenuItemCadastro: TPanel;
    imgBotaoExcluir: TImage;
    ImgBotaoCancelar: TImage;
    imgBotaoGravar: TImage;
    imgBotaoNovo: TImage;
    pnlGeral: TPanel;
    pnlSeparador1: TPanel;
    pnlSeparador2: TPanel;
    procedure SairTela;
    procedure imgSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgBotaoNovoClick(Sender: TObject);
  private
    { Private declarations }
    FiliaisLista       : TObjectList<model.entity.filiais.Tfiliais>;
    TipoMovimentoLista : TObjectList<model.entity.tipo_movimento.Ttipo_movimento>;
    ClientesLista      : TObjectList<model.entity.clientes.Tclientes>;
  private
    Pedido             : model.entity.pedidoestoque.Tpedidoestoque;
  private
    { Private declarations }
    procedure CarregaRestClient;
    procedure CarregarFiliais;
    procedure CarregarTipoMovimento;
    procedure CarragarClientes;
  private
    procedure IncluirPedido;
  public
    { Public declarations }
  end;

var
  frmpedido: Tfrmpedido;

implementation

{$R *.dfm}

{ TForm1 }

procedure Tfrmpedido.CarragarClientes;
var Cliente : model.entity.clientes.Tclientes;
var JArray  : TJSONARRAY ;
var i       : Integer    ;
var lokc    : boolean    ;
begin
     cmbcliente.Clear;
     cmbcliente.Items.Clear;
     RestClient.BaseURL :='http://localhost:8080/datasnap/rest/TClienteController/';
     RestRequest.Resource :=  '/cliente';
     RestRequest.Method := TRESTRequestMEthod.rmget;
     lokc:=true;
     Try
        RESTRequest.execute;
     except
        on E: Exception do
        begin
             lokc:=false;
        end;
     end;
     if lokc then
     begin
          JArray := RestResponse.JSONValue as TJsonArray;
          for i:=0 to Pred(JArray.Count) do
          begin
               Cliente:=  TJson.JsonTOObject<model.entity.clientes.Tclientes>(JArray.Items[i].toJson);
               ClientesLista.Add(Cliente);
               cmbcliente.Items.Add(Format('%s - %s',[SCod(Cliente.cliente_codigo,6),Cliente.cliente_nomerzsocial]));
          end;
     end;
end;

procedure Tfrmpedido.CarregaRestClient;
begin
     RestClient.ResetToDefaults;
     RestResponse.ResetToDefaults;
     RestRequest.ResetToDefaults;
     RestClient.BaseURL :='http://localhost:8080/datasnap/rest/';
end;

procedure Tfrmpedido.CarregarFiliais;
var Filial : model.entity.filiais.Tfiliais ;
var JArray : TJSONARRAY ;
var i      : Integer    ;
var lokc   : boolean    ;
begin
     cmbFilial.Clear;
     cmbFilial.Items.Clear;
     RestClient.BaseURL :='http://localhost:8080/datasnap/rest/TFilialController/';
     RestRequest.Resource :=  '/filial';
     RestRequest.Method := TRESTRequestMEthod.rmget;
     lokc:=true;
     Try
        RESTRequest.execute;
     except
        on E: Exception do
        begin
             lokc:=false;
        end;
     end;
     if lokc then
     begin
          JArray := RestResponse.JSONValue as TJsonArray;
          for i:=0 to Pred(JArray.Count) do
          begin
               Filial:=  TJson.JsonTOObject<model.entity.filiais.Tfiliais>(JArray.Items[i].toJson);
               FiliaisLista.Add(Filial);
               cmbFilial.Items.Add(Format('%s - %s',[SCod(Filial.filial_codigo,4),Filial.filial_descricao]));
          end;
     end;
end;

procedure Tfrmpedido.CarregarTipoMovimento;
var Tipo   : model.entity.tipo_movimento.Ttipo_movimento ;
var JArray : TJSONARRAY ;
var i      : Integer    ;
var lokc   : boolean    ;
begin
     cmbtipomovimento.Clear;
     cmbtipomovimento.Items.Clear;
     RestClient.BaseURL :='http://localhost:8080/datasnap/rest/TTipoMovimentoController/';
     RestRequest.Resource :=  '/tipo_pagamento';
     RestRequest.Method := TRESTRequestMEthod.rmget;
     lokc:=true;
     Try
        RESTRequest.execute;
     except
        on E: Exception do
        begin
             lokc:=false;
        end;
     end;
     if lokc then
     begin
          JArray := RestResponse.JSONValue as TJsonArray;
          for i:=0 to Pred(JArray.Count) do
          begin
               Tipo:=TJson.JsonTOObject<model.entity.tipo_movimento.Ttipo_movimento>(JArray.Items[i].toJson);
               TipoMovimentoLista.Add(Tipo);
               cmbtipomovimento.Items.Add(Format('%s - %s',[SCod(Tipo.tipo_movimento_ID,4),Tipo.tipo_movimento_descricao]));
          end;
     end;
end;

procedure Tfrmpedido.FormCreate(Sender: TObject);
begin
     FiliaisLista       := TObjectList<model.entity.filiais.Tfiliais>.Create;
     TipoMovimentoLista := TObjectList<model.entity.tipo_movimento.Ttipo_movimento>.Create;
     ClientesLista      := TObjectList<model.entity.clientes.Tclientes>.Create;
end;

procedure Tfrmpedido.FormShow(Sender: TObject);
begin
     CarregaRestClient();
     CarregarFiliais;
     CarregarTipoMovimento;
     CarragarClientes
end;

procedure Tfrmpedido.imgBotaoNovoClick(Sender: TObject);
begin
     IncluirPedido;
end;

procedure Tfrmpedido.imgSairClick(Sender: TObject);
begin
     SairTela;
end;

procedure Tfrmpedido.IncluirPedido;
var Filial  : model.entity.filiais.Tfiliais ;
var Tipo    : model.entity.tipo_movimento.Ttipo_movimento ;
var Cliente : model.entity.clientes.Tclientes;
var Retorno : model.entity.retorno.TRetorno;
var jobj    : TJSONObject;
var sMSG    : String     ;
//var JArray  : TJSONARRAY ;
var lokc    : boolean    ;
var i       : Integer    ;
begin
     if NotAssigned(Pedido) then
     begin
          Pedido := model.entity.pedidoestoque.Tpedidoestoque.create;
     end;
     Filial:=FiliaisLista.Items[cmbFilial.ItemIndex];
     if Assigned(Filial) then
     begin
          Pedido.filial_id:=Filial.filial_id;
     end
     else
     begin
          Pedido.filial_id:=0;
     end;
     Tipo:=TipoMovimentoLista.Items[cmbtipomovimento.ItemIndex];
     if Assigned(Tipo) then
     begin
          Pedido.tipomovimento_id:=Tipo.tipo_movimento_ID;
     end
     else
     begin
          Pedido.tipomovimento_id:=0;
     end;
     Cliente:=ClientesLista.Items[cmbcliente.ItemIndex];
     if Assigned(Cliente) then
     begin
          Pedido.cliente_id:=Cliente.cliente_ID;
     end
     else
     begin
          Pedido.cliente_id:=0;
     end;
     jobj := TJson.ObjecttoJSonObject(Pedido);

     RestClient.BaseURL :='http://localhost:8080/datasnap/rest/TPedidoEstoqueController/';
     RestRequest.Resource :=  '/Pedido';
     RestRequest.Method := TRESTRequestMEthod.rmPost;
     RestRequest.AddBody(JObj.ToString,ContentTypeFromString('application/json'));

    lokc   := true;
    Try
      RESTRequest.execute;
    except
      on E: Exception do
      begin
        sMSG := 'N�o conseguiu conectar. Verifique Internet Tablet ou Servidor ...';
        MessageDlg(sMSG,mtError,[mbOK],0);
        lokc:=false;
      end;
    end;

     if lokc then
     begin
          jobj := RestResponse.JSONValue as TJSONObject;
               Retorno:=TJson.JsonTOObject<model.entity.retorno.Tretorno>(jObj.toJson);
               Pedido.pedido_ID:=Retorno.retorno_id;
//          JArray := RestResponse.JSONValue as TJSONArray;
//          for i:=0 to Pred(JArray.Count) do
//          begin
//               Retorno:=TJson.JsonTOObject<model.entity.retorno.Tretorno>(JArray.Items[i].toJson);
//               Pedido.pedido_ID:=Retorno.retorno_id;
//          end;
          sMSG:=Format('%s - %s',[SCod(Retorno.retorno_cod),Retorno.retorno_msg]);
          if Retorno.retorno_cod=1 then
          begin
               MessageDlg(sMSG,mtInformation,[mbOK],0);
          end
          else
          begin
               MessageDlg(sMSG,mtWarning,[mbOK],0);
          end;
     end;
end;

procedure Tfrmpedido.SairTela;
begin
     if MessageDlg('Deseja realmente sair da aplica��o?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 1, TMsgDlgBtn.mbNo) = mrYes then
     begin
          Self.Close;
     end;
end;

end.
