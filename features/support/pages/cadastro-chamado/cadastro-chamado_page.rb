class CadastroChamado < SitePrism::Page
  include Capybara::DSL

  element :todos_menus,  "#menu_all_button"
  element :pesquisa_servicos, :css, "input[id='formcreator_search_input']"
  element :seleciona_servicos, :css, 'a.plugin_formcreator_formTile_title', :text => "Outros Serviços - ERP", :visible => false
  element :rdo_escolhe_versao, :css, "label[for='formcreator_field_2274_2']", :text=>"Versão 12"
  element :insere_descricao, '#formcreator_field_695'
  element :salva_chamado, "input[name='submit_formcreator']"

  def cadastro_chamado()
    pesquisa_servicos.set('Outros Serviços - ERP')
    seleciona_servicos.click
    rdo_escolhe_versao.click
    insere_descricao.set(
        'Data do serviço
        =================
        Informações
        ---------------------------------
        1) Descreva sua solicitação : Bom dia. Informo que ao tentar acessar o console do antigo sistema de imagem - Unisys,
        o mesmo está retornando com erro de CAC server "IMAGEM 01".
        Como alguns usuários ainda utilizam esse sistema para consulta de documentos,
        gostaria que verificassem o problema. Inclusive já existe uma solicitação Nº 286734 aberta por usuário
        da GESEG relatando que não consegue acessar o sistema pelo client.
        Em anexo a telas de erro. É aviso que também não esta sendo possível acessar o sistema pela intranet antiga.

        2) Anexos : Documento anexado')

    salva_chamado.click
    $numero_chamado = find("[id='message_after_redirect_0'] a")['text']
  end

  def novo_chamado_notificacao()
    expect(page).to have_css("div#message_after_redirect_0", :text => $numero_chamado)
  end

  def acionar_menu_macarrao()
    todos_menus.click
  end

  def menu_novo_chamado()
    click_link 'Chamados'
  end
end