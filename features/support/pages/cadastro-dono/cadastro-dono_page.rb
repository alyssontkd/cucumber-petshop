class CadastroDono < SitePrism::Page
  include Capybara::DSL

  element :nome_dono,  "#nome"
  element :email_dono, "#email"
  element :sexo_dono, :css, "input[name='sexo']"
  element :cidade_dono, "#cidade"
  element :uf_dono, "#estado"
  element :observacoes_dono, "#observacoes"
  element :gravar_dados, "input[type='submit']"

  def preencher_cadastro_dono()
    nome_dono.set('Maria Joaquina de Freitas Amaral e Silva')
    email_dono.set('maria.silva@gmail.com')
    choose('fem')
    cidade_dono.set('Taguatinga Centro')


    within '#estado' do
      find("option[value='DF']").click
    end

    observacoes_dono.set(
        'Detalhes dos serviços contratados
        =================
        Informações
        ---------------------------------
        1) Banho e Tosa perfumada.
        2) Combate a Pulgas e carrapatos')

    gravar_dados.click
  end

end