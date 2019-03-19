include RSpec::Matchers

Dado("que eu abra a tela principal do sistema e abra o cadastro de donos") do
  @pagina_inicial = PaginaInicial.new
  @pagina_inicial.acessar_cadastro_donos
end

Quando("eu insiro todos os dados do dono do animalzinho") do
  @novodono = CadastroDono.new
  @novodono.preencher_cadastro_dono
end

Então("devo receber uma notificacão de que o dono foi inserido com sucesso") do
  @pagina_inicial.notificacao_novo_dono_inserido_com_sucesso
end