class UsuarioReprovaChamado < SitePrism::Page
  include Capybara::DSL

  element :acessar_conteudo, 'a.ui-tabs-anchor', text: "Acompanhamentos"
  element :insere_texto_reprova, :css,"form[name='form'] table[class='tab_cadre_fixe'] textarea[name='content']", :visible => false
  element :pesquisa_satisfacao, "select[id='satisfaction_data']"
  element :reprova_solucao, "input[name='add_reopen']"
  element :notificacao_preprova, 'div.item_content'


  def reprova_chamado()
    acessar_conteudo.click
    @reprovaSolucao = "O erro persiste."
    insere_texto_reprova.set(@reprovaSolucao)
    reprova_solucao.click
  end

  def reprova_notificacao()
    expect(page).to have_css("p", :text => @reprovaSolucao)
  end
end

