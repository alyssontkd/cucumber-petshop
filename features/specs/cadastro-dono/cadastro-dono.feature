#language:pt

  Funcionalidade: Cadastrar um Dono de Animalzinho em Nosso PetShop

    Como um usuário do sistema de PetShop
    Quero cadastrar um dono de Animalzinho
    Para registrar os serviços e produtos adquiridos em seu nome

    Contexto: Acessar a tela principal do sistema de Petshop

      @cadastrar-dono
      Cenário: Cadastrar o dono de animalzinho no sistema

        Dado que eu abra a tela principal do sistema e abra o cadastro de donos
        Quando eu insiro todos os dados do dono do animalzinho
        Então devo receber uma notificacão de que o dono foi inserido com sucesso
