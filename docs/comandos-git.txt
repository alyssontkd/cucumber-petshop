#GIT

## Estados

* Modificado (modified);
* Preparado (staged/index)
* Consolidado (comitted);

## Ajuda

##### Geral
	git help
	
##### Comando específico
	git help add
	git help commit
	git help <qualquer_comando_git>
	

## Configuração

### Geral

As configurações do GIT são armazenadas no arquivo **.gitconfig** localizado dentro do diretório do usuário do Sistema Operacional (Ex.: Windows: C:\Users\Documents and Settings\Leonardo ou *nix /home/leonardo).

As configurações realizadas através dos comandos abaixo serão incluídas no arquivo citado acima.

##### Setar usuário
	git config --global user.name "Leonardo Comelli"

##### Setar email
	git config --global user.email leonardo@software-ltda.com.br
	
##### Setar editor
	git config --global core.editor vim
	
##### Setar ferramenta de merge
	git config --global merge.tool vimdiff

##### Setar arquivos a serem ignorados
	git config --global core.excludesfile ~/.gitignore

##### Listar configurações
	git config --list

### Ignorar Arquivos

Os nomes de arquivos/diretórios ou extensões de arquivos listados no arquivo **.gitignore** não serão adicionados em um repositório. Existem dois arquivos .gitignore, são eles:

* Geral: Normalmente armazenado no diretório do usuário do Sistema Operacional. O arquivo que possui a lista dos arquivos/diretórios a serem ignorados por **todos os repositórios** deverá ser declarado conforme citado acima. O arquivo não precisa ter o nome de **.gitignore**.

* Por repositório: Deve ser armazenado no diretório do repositório e deve conter a lista dos arquivos/diretórios que devem ser ignorados apenas para o repositório específico.

## Repositório Local

### Criar novo repositório

	git init

### Verificar estado dos arquivos/diretórios

	git status

### Adicionar arquivo/diretório (staged area)

##### Adicionar um arquivo em específico

	git add meu_arquivo.txt

##### Adicionar um diretório em específico

	git add meu_diretorio

##### Adicionar todos os arquivos/diretórios
	
	git add .	
	
##### Adicionar um arquivo que esta listado no .gitignore (geral ou do repositório)
	
	git add -f arquivo_no_gitignore.txt
	
### Comitar arquivo/diretório

##### Comitar um arquivo
	
	git commit meu_arquivo.txt

##### Comitar vários arquivos

	git commit meu_arquivo.txt meu_outro_arquivo.txt
	
##### Comitar informando mensagem

	git commit meuarquivo.txt -m "minha mensagem de commit"

### Remover arquivo/diretório

##### Remover arquivo

	git rm meu_arquivo.txt

##### Remover diretório

	git rm -r diretorio

### Visualizar hitórico

##### Exibir histórico
	
	git log
	
##### Exibir histórico com diff das duas últimas alterações

	git log -p -2
	
##### Exibir resumo do histórico (hash completa, autor, data, comentário e qtde de alterações (+/-))

	git log --stat
	
##### Exibir informações resumidas em uma linha (hash completa e comentário)

	git log --pretty=oneline
	
##### Exibir histórico com formatação específica (hash abreviada, autor, data e comentário)

	git log --pretty=format:"%h - %an, %ar : %s"
	
* %h: Abreviação do hash;
* %an: Nome do autor;
* %ar: Data;
* %s: Comentário.

Verifique as demais opções de formatação no [Git Book](http://git-scm.com/book/en/Git-Basics-Viewing-the-Commit-History)

##### Exibir histório de um arquivo específico

	git log -- <caminho_do_arquivo>

##### Exibir histórico de um arquivo específico que contêm uma determinada palavra

	git log --summary -S<palavra> [<caminho_do_arquivo>]

##### Exibir histórico modificação de um arquivo

	git log --diff-filter=M -- <caminho_do_arquivo>

* O <D> pode ser substituido por: Adicionado (A), Copiado (C), Apagado (D), Modificado (M), Renomeado (R), entre outros.

##### Exibir histório de um determinado autor

	git log --author=usuario

##### Exibir revisão e autor da última modificação de uma bloco de linhas

	git blame -L 12,22 meu_arquivo.txt 

### Desfazendo operações

##### Desfazendo alteração local (working directory)
Este comando deve ser utilizando enquanto o arquivo não foi adicionado na **staged area**. 

	git checkout -- meu_arquivo.txt

##### Desfazendo alteração local (staging area)
Este comando deve ser utilizando quando o arquivo já foi adicionado na **staged area**.

	git reset HEAD meu_arquivo.txt

Se o resultado abaixo for exibido, o comando reset *não* alterou o diretório de trabalho. 

	Unstaged changes after reset:
	M	meu_arquivo.txt

A alteração do diretório pode ser realizada através do comando abaixo:
	
	git checkout meu_arquivo.txt

## Repositório Remoto

### Exibir os repositórios remotos

	git remote
	
	git remote -v

### Vincular repositório local com um repositório remoto

	git remote add origin git@github.com:leocomelli/curso-git.git
	
### Exibir informações dos repositórios remotos

	git remote show origin
	
### Renomear um repositório remoto 

	git remote rename origin curso-git
	
### Desvincular um repositório remoto
	
	git remote rm curso-git

### Enviar arquivos/diretórios para o repositório remoto

O primeiro **push** de um repositório deve conter o nome do repositório remoto e o branch.

	git push -u origin master
	
Os demais **pushes** não precisam dessa informação

	git push
	

### Atualizar repositório local de acordo com o repositório remoto

##### Atualizar os arquivos no branch atual

	git pull
	
##### Buscar as alterações, mas não aplica-las no branch atual

	git fecth
	
### Clonar um repositório remoto já existente

	git clone git@github.com:leocomelli/curso-git.git
	
### Tags

##### Criando uma tag leve

	git tag vs-1.1

##### Criando uma tag anotada

	git tag -a vs-1.1 -m "Minha versão 1.1"

##### Criando uma tag assinada
Para criar uma tag assinada é necessário uma chave privada (GNU Privacy Guard - GPG).

	git tag -s vs-1.1 -m "Minha tag assinada 1.1"

##### Criando tag a partir de um commit (hash)

	git tag -a vs-1.2 9fceb02
	
##### Criando tags no repositório remoto

	git push origin vs-1.2
	
##### Criando todas as tags locais no repositório remoto

	git push origin --tags
	
### Branches

O **master** é o branch principal do GIT.

O **HEAD** é um ponteiro *especial* que indica qual é o branch atual. Por padrão, o **HEAD** aponta para o branch principal, o **master**.

##### Criando um novo branch

	git branch bug-123
	
##### Trocando para um branch existente

	git checkout bug-123
	
Neste caso, o ponteiro principal **HEAD** esta apontando para o branch chamado bug-123.

##### Criar um novo branch e trocar 

	git checkout -b bug-456
	
##### Voltar para o branch principal (master)

	git checkout master
	
##### Resolver merge entre os branches

	git merge bug-123
	
Para realizar o *merge*, é necessário estar no branch que deverá receber as alterações. O *merge* pode automático ou manual. O merge automático será feito em arquivos textos que não sofreram alterações nas mesmas linhas, já o merge manual será feito em arquivos textos que sofreram alterações nas mesmas linhas.

A mensagem indicando um *merge* manual será:

	Automerging meu_arquivo.txt
	CONFLICT (content): Merge conflict in meu_arquivo.txt
	Automatic merge failed; fix conflicts and then commit the result.


##### Apagando um branch

	git branch -d bug-123

##### Listar branches 

###### Listar branches

	git branch

###### Listar branches com informações dos últimos commits

	git branch -v

###### Listar branches que já foram fundidos (merged) com o **master**

	git branch --merged

###### Listar branches que não foram fundidos (merged) com o **master**

	git branch --no-merged

##### Criando branches no repositório remoto

###### Criando um branch remoto com o mesmo nome

	git push origin bug-123

###### Criando um branch remoto com nome diferente

	git push origin bug-123:new-branch

##### Baixar um branch remoto para edição

	git checkout -b bug-123 origin/bug-123


##### Apagar branch remoto

	git push origin:bug-123

### Rebasing

Fazendo o **rebase** entre um o branch bug-123 e o master.

	git checkout experiment
	
	git rebase master
	

Mais informações e explicações sobre o [Rebasing](http://git-scm.com/book/en/Git-Branching-Rebasing)

###Stash

Para alternar entre um branch e outro é necessário fazer o commit das alterações atuais para depois trocar para um outro branch. Se existir a necessidade de realizar a troca sem fazer o commit é possível criar um **stash**. O Stash como se fosse um branch temporário que contem apenas as alterações ainda não commitadas.

##### Criar um stash
	
	git stash
	
##### Listar stashes

	git stash list

##### Voltar para o último stash

	git stash apply

##### Voltar para um stash específico
	
	git stash apply stash@{2}
	
Onde **2** é o indíce do stash desejado.

##### Criar um branch a partir de um stash

	git stash branch meu_branch

### Reescrevendo o histórico

##### Alterando mensagens de commit

	git commit --amend -m "Minha nova mensagem"

##### Alterar últimos commits
Alterando os três últimos commits

	git rebase -i HEAD~3

O editor de texto será aberto com as linhas representando os três últimos commits.

	pick f7f3f6d changed my name a bit
	pick 310154e updated README formatting and added blame
	pick a5f4a0d added catfile

Altere para edit os commits que deseja realizar alterações.

	edit f7f3f6d changed my name a bit
	pick 310154e updated README formatting and added blame
	pick a5f4a0d added catfile

Feche o editor de texto.

Digite o comando para alterar a mensagem do commit que foi marcado como *edit*.

	git commit –amend -m “Nova mensagem”

Aplique a alteração

	git rebase --continue

**Atenção:** É possível alterar a ordem dos commits ou remover um commit apenas
mudando as linhas ou removendo.


##### Juntando vários commits
Seguir os mesmos passos acima, porém marcar os commtis que devem ser juntados com **squash*
	
##### Remover todo histórico de um arquivo

	git filter-branch --tree-filter 'rm -f passwords.txt' HEAD
	
###  Atualizar a referencia do repositório local ao repositório remoto quando se renomeia o repositório Remoto
```
git remote set-url <nome_referencia> <novo_nome_remoto> <antigo_nome_remoto>

Ex: git remote set-url origin https://github.com/alyssontkd/proxy-reverso-docker.git https://github.com/alyssontkd/proxy-reverso.git

```

###  Listar apenas os arquivos unmerged (não sofreram merge) antes de fazer um push ou commit
```
git diff --name-status --diff-filter=U
```

###  Desabilitar a verificação SSL (Exemplo do Erro: SSL certificate problem: unable to get local issuer certificate)
```
git config --global http.sslVerify false
```

###  Comando para fazer o git ignorar mudança de permissao como alteração no arquivo.
```
git config core.fileMode false
```

###  Recupera o status de todos os arquivos de acordo com o hash do commit passado como parametro. (Desfaz uma ação de merge automatico quando encontra um conflito)
```
git reset --hard <hash>
Ex: git reset --hard 5df97995cf4a1c1e08dd31a4243e449a8c5e21d4
```

###  Desfaz um commit e ainda gera um Log do que foi revertido
```
git revert --strategy resolve <hash>
Ex: git revert --strategy resolve 5df97995cf4a1c1e08dd31a4243e449a8c5e21d4
```

###  Buscando por um código no seu histórico de commits
```
git grep 'nomeDoCodigo()' $(git rev-list --all)
```

###  Encontrando em qual commit um código foi adicionado / removido
```
git log -StextoDoCodigo
```

###  Apagar Branch Remota
```
git push <nome do origin> > --delete <nome do branch>
Ex: git push ssh_origin --delete dev-andre

```

###  Apagar Branch Local
```
git branch -D <nome do branch>
Ex:  git branch -D seguranca
```

###  Criar uma branch de Segurança
```
git checkout -b <BRANCH-NAME>
Ex: git checkout -b seguranca
```

###  Forçar um "git push" para sobrescrever os arquivos remotos
```
git push -f <remote> <branch>
Ex: git push -f origin master
```

###  Forçar um "git checkout" para sobrescrever os arquivos locais
```
git checkout -f <remote> <branch>
git checkout -f master
```

###  Para forçar Sobrescrever arquivos nao controlados pelo git
```
git fetch --all
git reset --hard origin/<BRANCH-NAME>

Ex: git reset --hard origin/master
```

###  Atualizar todas as informaçoes locais
```
git fetch [origem]

Ex: git fetch ssh_origin ou git fetch origin
```
###  Remover arquivos cacheados que foram ignorados, mas continuam versionados
```
git rm vendor/* -r --cached
git add .
git commit -m 'Ajustando cache dos arquivos'
```

###  Adicionar uma nova origem ao repositorio com autenticaçao SSH
```
git remote add <nome_da_origin> <caminho_repositorio_ssh>

Ex: git remote add ssh_origin git@github.com:alyssontkd/galo.git
```

###  Renomear uma origem existente
```
git remote rename <origem_inicial> <origem_renomeada>

Ex: git remote rename origin2 ssh_origin
```

###  Remover uma origem local
```
git remote rm <nome_origem>

Ex: git remote rm destination
```

###  Apresenta o erro "error: pathspec 'seguranca' did not match any file(s) known to git." ao tentar mudar de branch
```
git remote update
git fetch 
git checkout --track origin/<BRANCH-NAME>

Ex: git checkout --track origin/dev-alysson
```

###  Renomear destino do Repositorio
```
git remote set-url origin new_url

Ex: git remote set-url origin https://github.com/alyssontkd/prova.git
Ex: git remote set-url origin https://github.com/alyssontkd/vendor_zf2.git
Ex: git remote set-url ssh_origin git@github.com:alyssontkd/vendor_zf2.git
```

###  Forçar o PULL a sobrescrever os arquivos locais com as alterações da branch remota.
```
git fetch --all
git reset --hard origin/<BRANCH-NAME>
git pull origin <BRANCH-NAME>
```
```
Exemplo:
git reset --hard origin/master
git pull origin master
```

## Criando TAGs no GIT
### Criar uma TAG anotada. 
```
git tag -a v2.1.0 -m "xyz feature is released in this tag."
```

### Para criar uma TAG chamada v1.3 no commit atual execute:
```
git tag v1.3
```

### Para criar uma TAG chamada v1.4 no commit 4b8ef995de6d77 execute:
```
git tag v1.4 4b8ef995de6d77
```

### Para submete-la para o servidor execute:
```
git push --tags origin master
```

### Para deletar uma TAG execute:
```
git tag -d v1.2.3
git push origin :refs/tags/v1.2.3
```

### Para voce mover para o commit da TAG execute:
```
git checkout v1.5.6
```

### Bisect
O bisect (pesquisa binária) é útil para encontrar um commit que esta gerando um bug ou uma inconsistência entre uma sequência de commits.

##### Iniciar pequinsa binária

	git bisect start
	
##### Marcar o commit atual como ruim

	git bisect bad

##### Marcar o commit de uma tag que esta sem o bug/inconsistência

	git bisect good vs-1.1

##### Marcar o commit como bom
O GIT irá navegar entre os commits para ajudar a indentificar o commit que esta com o problema. Se o commit atual não estiver quebrado, então é necessário marca-lo como **bom**.

	git bisect good

##### Marcar o commit como ruim
Se o commit estiver com o problema, então ele deverá ser marcado como **ruim**.

 	git bisect bad
 
##### Finalizar a pesquisa binária
Depois de encontrar o commit com problema, para retornar para o *HEAD* utilize:
	
	git bisect reset
 	

# Contribuições

Sinta-se a vontade para realizar adicionar mais informações ou realizar correções. Fique a vontade, Faça Fork!



<!-- 
###  Criar Tags no Código para disponibilizar para Homologação e Produção
Roteiro de publicação de release

1) Certifique-se de que funcionalidade está ok em desenvolvimento no seu branch
2) Faça o merge da branch com a master
3) Certifique-se de que está trabalhando no branch correto e que os commits estão na versão correta:
$ git branch
* nome-do-branch
  master
$ git log

4) Mude para o branch master e faça o merge
$ git checkout master
$ git pull origin master
$ git merge nome-do-branch
É possível que ocorram conflitos. Um conflito é quando um arquivo é alterado em duas branches e o git não consegue fazer o merge automático. Nesse caso, você deve resolver o conflito na mão.

Para o changelog, adotar o padrão:
fix: correção de bug
novo: nova funcionalidade

5) Edite o arquivo CHANGELOG

6) Adicione o texto do release ao CHANGELOG
$ vim CHANGELOG
// faça o commit
$ git add CHANGELOG
$ git commit -m 'adicionando changelog da versão v1.x.x'
$ git push

7) Criar tag no código

// certifique-se de estar trabalhando no branch correto e faça o merge com o master, caso isso ainda não tenha sido feito
$ git branch
  correcoes
* master

// liste as tags que já existem
$ git tag
v1.3.0
v1.3.1
v1.3.2
v1.3.3

// crie a tag
$ git tag -a v1.3.1 -m 'informações sobre o release v1.3.1'

// envie a tag para o repositório central (ex: github, gitlab). Caso contrário a tag será apenas local
$ git push origin v1.3.1

/// ou envie todas as tags
$ git push --follow-tags
Em caso de dúvida, consultar http://192.168.14.67/wiki/Comandos_gerais_de_GIT/#tags

6) Subir para homologação

// verifique qual é a tag atual
$ git describe --tags
v1.3.0

// atualize o repositório
$ git pull

// baixe a tag nova criando uma branch para ela
# git checkout v1.3.1 -b v1.3.1

$ git describe --tags
v1.3.0
7) Verificar publicação

8) Preparar email de release

Caso haja necessidade, elaborar um email de release.

9) Subir para produção

# cd /var/www/novosalic.cultura.gov.br 

// verifique qual é a tag atual
# git describe --tags
v1.3.0

// atualize as referências do repositório sem alterar os arquivos
# git fetch

// verifique se a nova tag apareceu
# git tag
v1.3.0
v1.3.1

// baixe a tag nova criando uma branch para ela
# git checkout v1.3.1 -b v1.3.1
10) Enviar email

-->
