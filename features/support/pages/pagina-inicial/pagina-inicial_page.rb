class PaginaInicial < SitePrism::Page
  include Capybara::DSL

  element :inserir_donos, :css, "a", :text=>"--- Inserir Dono"

  #element :todos_menus,  "#menu_all_button"
  #element :pesquisa_servicos, :css, "input[id='formcreator_search_input']"
  #element :seleciona_servicos, :css, 'a.plugin_formcreator_formTile_title', :text => "Outros Serviços - ERP", :visible => false

  #element :insere_descricao, '#formcreator_field_695'
  #element :salva_chamado, "input[name='submit_formcreator']"

  def acessa_cadastro_donos()
    #pesquisa_servicos.set('Outros Serviços - ERP')
    #seleciona_servicos.click
    inserir_donos.click

    #salva_chamado.click
    #$numero_chamado = find("[id='message_after_redirect_0'] a")['text']
  end

=begin
  def novo_chamado_notificacao()
    expect(page).to have_css("div#message_after_redirect_0", :text => $numero_chamado)
  end

  def acionar_menu_macarrao()
    todos_menus.click
  end

  def menu_novo_chamado()
    click_link 'Chamados'
  end
=end
end