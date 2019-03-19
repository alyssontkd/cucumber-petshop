include RSpec::Matchers

Dado("que eu abra a tela principal do sistema e abra o cadastro de donos") do
  @pagina_inicial = PaginaInicial.new
  @pagina_inicial.acessa_cadastro_donos
end

Quando("eu registro um novo chamado para reportar um incidente no ERP") do
  @novochamado = CadastroDono.new
  @novochamado.acionar_menu_macarrao
  @novochamado.menu_novo_chamado
end

Então("devo receber uma notificacão de que o chamado foi aberto") do
  @novochamado.novo_chamado_notificacao
end