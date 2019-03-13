class AtendeChamadoCadastrado < SitePrism::Page
  include Capybara::DSL


  element :menu_all_button, 'a#menu_all_button'
  element :atender_chamado, 'span.fa.fa-male', text: "Associar a mim mesmo"
  element :acessar_conteudo, 'a.ui-tabs-anchor', text: "Acompanhamentos"
  element :menu_acompanhamento, 'li.followup', text: "Acompanhamento"
  element :inserir_acompanhamento, "textarea[name='content']"
  element :add_acompanhamento,"input[name='add']"
  element :notifica_acompanhamento, 'div.h_content.TicketFollowup'
  element :menu_anexo, 'li.document', text: "Documento"
  element :insere_anexo, "input[name='filename[]']"
  element :add_anexo, "input[value='Adicionar novo arquivo']"
  element :notifica_anexo, 'div#message_after_redirect_0'
  element :menu_tarefa, 'li.task', text: "Tarefa"
  element :inserir_tarefa, "textarea[name='content']"
  element :add_tarefa, "input[name='add']"
  element :conclui_tarefa, 'span.state.state_1'
  element :notifica_tarefa, 'div.h_content.TicketTask'
  element :menu_solucao, 'li.solution', text: "Solução"
  element :localiza_solucao, "iframe[title*='Área de texto formatado.']"
  element :insere_solucao, '#tinymce'
  element :add_solucao, "input[name='update']"
  element :notifica_solucao, 'div.h_content.Solution'
  element :notifica_solucao2,'div.h_item.right.middle'


  def menu_chamados()
    menu_all_button.click
    within('#show_all_menu') do
      click_on "Chamados"
    end
  end

  def atende_chamado()
    page.find(:xpath, "//*[@id='Ticket#{$numero_chamado}']").click
    atender_chamado.click
    acessar_conteudo.click
  end

  def atende_chamado_reprovado()
    page.find(:xpath, "//*[@id='Ticket#{$numero_chamado}']").click
    acessar_conteudo.click
  end

  def insiro_acompanhamento()
    menu_acompanhamento.click
    @texto_acompanhamento = 'testetestetestetestetestetestetestetestetestetestetesteteste'
    inserir_acompanhamento.set(@texto_acompanhamento)
    add_acompanhamento.click
    wait_until_notifica_acompanhamento_visible
    expect(notifica_acompanhamento.text()).to end_with "#{@texto_acompanhamento}"
  end



  def insiro_anexo()
    menu_anexo.click
    @file = File.absolute_path("upload/erro_unisys.jpg")
    insere_anexo.set(@file)
    add_anexo.click
    wait_until_notifica_anexo_visible
    expect(notifica_anexo.text()).to include "Item adicionado com sucesso: "
  end

  def insiro_tarefa()
    menu_tarefa.click
    @tarefa = "tarefa inserida"
    inserir_tarefa.set(@tarefa)
    add_tarefa.click
    conclui_tarefa.click
    expect(notifica_tarefa.text()).to start_with "#{@tarefa}"
  end

  def soluciona_chamado()
    menu_solucao.click
    @Solucao = "Demanda Solucionada"
    within_frame(localiza_solucao) do
      insere_solucao.set(@Solucao)
    end
    add_solucao.click
  end

  def soluciona_chamado_reprovado()
    menu_solucao.click
    @Solucao2 = "Favor validar"
    within_frame(localiza_solucao) do
      insere_solucao.set(@Solucao2)
    end
    add_solucao.click
  end

  def soluciona_notificacao()
    expect(notifica_solucao.text()).to start_with "#{@Solucao}"
  end
  def soluciona_notificacao2()
    expect(notifica_solucao2.text()).to end_with  "#{@Solucao2}"
  end


end

