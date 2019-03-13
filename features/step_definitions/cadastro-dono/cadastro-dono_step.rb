include RSpec::Matchers

Dado("que eu abra a tela de abertura de chamado") do
  @login = LoginPage.new
  @login.faz_login_usuario
end

Quando("eu registro um novo chamado para reportar um incidente no ERP") do
  @novochamado = CadastroChamado.new
  @novochamado.acionar_menu_macarrao
  @novochamado.menu_novo_chamado
end

Então("devo receber uma notificacão de que o chamado foi aberto") do
  @novochamado.novo_chamado_notificacao
end