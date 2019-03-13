class LogoffPage < SitePrism::Page
  element :botao_logoff, "a[title='Sair']"

  def fazlogoff()
    botao_logoff.click
  end
end