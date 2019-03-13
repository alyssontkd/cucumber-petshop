class UsuarioMenuChamados < SitePrism::Page
  include Capybara::DSL

  def acessa_chamado()
    click_on 'Fechado'
    within('.tab_cadrehov') do
      find("a[href*='id=#{$numero_chamado}']").click
    end
  end
end