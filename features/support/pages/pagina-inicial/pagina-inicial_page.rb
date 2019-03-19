class PaginaInicial < SitePrism::Page
  include Capybara::DSL

  element :link_inserir_donos, :css, "a", :text=>"--- Inserir Dono"

  def acessar_cadastro_donos()
    link_inserir_donos.click
  end

  def notificacao_novo_dono_inserido_com_sucesso()
    expect(page).to have_content "Pronto !!! A INSERCAO foi efetuada com sucesso !!!"
  end

end