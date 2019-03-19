#language:pt

  Funcionalidade: Casdastrar chamado no GLPI

    Como um usuário comum
    Quero abrir um chamado
    Para receber o serviço solicitado

    Contexto: Acessar o GLPI e logar no sistema

      @cadastrar-dono
      Cenário: Cadastrar novo dono de pet

        Dado que eu abra a tela principal do sistema e abra o cadastro de donos
        Quando eu registro um novo chamado para reportar um incidente no ERP
        Então devo receber uma notificacão de que o chamado foi aberto
