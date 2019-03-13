class UsuarioAprovaChamado < SitePrism::Page
  include Capybara::DSL

  element :acessar_conteudo, 'a.ui-tabs-anchor', text: "Acompanhamentos"
  element :insere_texto_aprova, :css,"form[name='form'] table[class='tab_cadre_fixe'] textarea[name='content']", :visible => false
  element :aprova_solucao, "input[name='add_close']"


  def usuario_aprova_chamado()
    acessar_conteudo.click
    @aprovaSolucao = "O prolema foi solucionado."
    page.execute_script("$('#satisfaction_data').val('5')")
    insere_texto_aprova.set(@aprovaSolucao)
    aprova_solucao.click
  end

  def aprova_notificação()
    expect(page).to have_css("p", :text => @aprovaSolucao)
  end
end