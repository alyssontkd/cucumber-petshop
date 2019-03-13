class LoginPage < SitePrism::Page
  #include Capybara::DSL
  element :login_name, '#login_name'
  element :login_password, '#login_password'
  element :botao_login, "input[name='submit']"
  element :lista_forma_para_login, "select[id='dropdown_auth1']"

  def faz_login_usuario()
    case AMBIENTE
    when 'homologacao'
      login_name.set(CUSTOM['usuario_hom'])
      login_password.set(CUSTOM['usuario_senha_hom'])
      lista_forma_para_login.select('Banco de dados interno do GLPI')
    when 'docker'
      login_name.set(CUSTOM['usuario_1'])
      login_password.set(CUSTOM['user_senha_1'])
      lista_forma_para_login.select('Banco de dados interno do GLPI')
    when 'teste'
      ""
    else
      "Error: não foi possível localizar o ambiente de valor: (#{AMBIENTE})"
    end
    botao_login.click
  end

  def faz_login_atendente()
    case AMBIENTE
    when 'homologacao'
      login_name.set(CUSTOM['atendente_hom'])
      login_password.set(CUSTOM['atendente_senha_hom'])
      lista_forma_para_login.select('local')
    when 'docker'
      login_name.set(CUSTOM['atendente_1'])
      login_password.set(CUSTOM['atenden_senha_1'])
      lista_forma_para_login.select('Banco de dados interno do GLPI')
    when 'teste'
      ""
    else
      "Error: não foi possível localizar o ambiente de valor: (#{AMBIENTE})"
    end
    botao_login.click
  end

end
