# Desafio: Zend Framework 2

Construir as estórias utilizando as tecnologias:
- PHP
- Zend 2
- Doctrine
- jQuery
- MySQL
- Ajax
----

<a name="estorias"></a>
## Estórias de Usuário:

1. [EU001 - Consultar Curso](#eu001)
2. [EU002 - Cadastrar Curso](#eu002)
3. [EU003 - Alterar Curso](#eu003)
4. [EU004 - Excluir Curso](#eu004)
----

## Prêmio
  - A definir
----

## Instalação:
Baixe e instale o [Docker for Windows](https://download.docker.com/win/stable/InstallDocker.msi) <br/>
Acesse o diretório do projeto e execute o comando para subir o ambiente:
```docker
docker-compose up -d
```
Após o término do comando, instale as dependências do Zend 2<br/>
Para instalar, execute:
```docker
docker exec -it php composer install
```
Para parar o ambiente, execute:
```docker
docker-compose down
```

## Endereço:
**App:** http://localhost:8080 <br/>
**phpMyAdmin:** http://localhost:8081

## Banco:
**usuario:** root <br/>
**senha:** root <br/>
**database:** desafio-zf <br/>

----

<a name="eu001"></a>
## EU001 - Consultar Curso 

1. Ao acessar a funcionalidade, o sistema deverá exibir a tela com os seguintes campos e Botões:
##### Filtros de Pesquisa:

```sh
- Nome (Alfanumérico - 100)
- Sigla (Alfanumérico - 10)
- Cadastrar Curso (Botão)
- Pesquisar (Botão)
```

##### Colunas da grid de resultado:

```sh
- Nome
- Sigla
- Ações (Ícones: Alterar / Excluir)
```

2. Ao acionar o botão "Consultar" o sistema deverá validar se pelo menos um dos filtros de registro foi informado:
- Caso não, o sistema deverá apresentar a mensagem "Obrigatório informar pelo menos um dos filtros de consulta".
- Caso sim, o sistema deverá retornar da base de dados os registros de acordo com os filtros informados e atualizar a grid de resultado. Caso não retornar nenhum registro, o sistema deverá apresentar na grid de resultado a mensagem "Nenhum registro encontrado.".

3. Ao acionar o botão "Cadastrar Curso", o sistema redireciona para a Estória [EU002 - Cadastrar Curso](#eu002).

4. Ao acionar o ícone "Alterar", o sistema redireciona para a Estória [EU003 - Alterar Curso](#eu003).

5. Ao acionar o ícone "Excluir", o sistema redireciona para a Estória [EU004 - Excluir Curso](#eu004).

_[Estórias](#estorias)_

----
<a name="eu002"></a>
## EU002 - Cadastrar Curso

1. Ao acessar a funcionalidade, o sistema deverá exibir a tela com os seguintes campos/Botões:

```sh
- Nome (Alfanumérico - 100)
- Sigla (Alfanumérico - 10)
- Cancelar (Botão)
- Salvar (Botão)
```
2. Ao acionar o botão "Salvar":
- O sistema deverá validar os campos obrigatórios, caso não validado o sistema deverá exibir a mensagem "Campos obrigatórios não informados.".
- O sistema deverá validar se já existe um curso com o mesmo Nome cadastrado na base de dados (desconsiderando o curso em questão). Caso exista, o sistema deverá exibir a mensagem "Já existe o curso _<nome_do_curso>_ cadastrado.". Onde _<nome_do_curso>_ deverá ser substituído pelo nome do curso.
- O sistema deverá validar se já existe um curso com a mesma Sigla cadastrada na base de dados (desconsiderando o curso/sigla em questão). Caso exista, o sistema deverá exibir a mensagem "Já existe a sigla _<nome_da_sigla>_ cadastrada para o curso _<nome_do_curso>_.". Onde _<nome_da_sigla>_ deverá ser substituído pelo nome da sigla e _<nome_do_curso>_ deverá ser substituído pelo nome do curso.
- O sistema identifica que todas as validações foram validadas, salva as informações na base de dados, exibe a mensagem "Registro cadastrado com sucesso" e redireciona para a estória [EU001 - Consultar Curso](#eu001).

3. Ao acionar o botão cancelar o sistema deverá redirecionar para a estória [EU001 - Consultar Curso](#eu001).

_[Estórias](#estorias)_

----
<a name="eu003"></a>
## EU003 - Alterar Curso

1. Ao acessar a funcionalidade, o sistema deverá exibir a tela com os seguintes campos (preenchidos)/Botões:
```sh
- Nome (Alfanumérico - 100)
- Sigla (Alfanumérico - 10)
- Cancelar (Botão)
- Salvar (Botão)
```

2. Ao acionar o botão "Salvar":
- O sistema deverá validar os campos obrigatórios, caso não validado o sistema deverá exibir a mensagem "Campos obrigatórios não informados.".
- O sistema deverá validar se já existe um curso com o mesmo Nome cadastrado na base de dados (desconsiderando o curso em questão). Caso exista, o sistema deverá exibir a mensagem "Já existe o curso _<nome_do_curso>_ cadastrado.". Onde _<nome_do_curso>_ deverá ser substituído pelo nome do curso.
- O sistema deverá validar se já existe um curso com a mesma Sigla cadastrada na base de dados (desconsiderando o curso/sigla em questão). Caso exista, o sistema deverá exibir a mensagem "Já existe a sigla _<nome_da_sigla>_ cadastrada para o curso _<nome_do_curso>_.". Onde _<nome_da_sigla>_ deverá ser substituído pelo nome da sigla e _<nome_do_curso>_ deverá ser substituído pelo nome do curso.
- O sistema identifica que todas as validações foram validadas, altera as informações na base de dados e exibe a mensagem "Registro alterado com sucesso" e redireciona para a estória [EU001 - Consultar Curso](#eu001).

3. Ao acionar o botão cancelar o sistema deverá redirecionar para a estória [EU001 - Consultar Curso](#eu001).

_[Estórias](#estorias)_

----
<a name="eu004"></a>
## EU004 - Excluir Curso 

1. Essa funcionalidade se inicia quando o usuário acionar o ícone "Excluir" na grid de resultado. O sistema exibir uma mensagem de confirmação: "Deseja realmente excluir o resgistro?":
- O usuário não confirma a exlusão do registro, o sistema fecha a mensagem de confirmação e não executa a ação de exclusão.
- O usuário confirma a exclusão do registro, o sistema verifica na base de dados se o curso em questão possui turma de alunos vinculadas: 
- - Caso sim, o sistema exibe a mensagem "Não é possível excluir o registro, pois já existem turmas cadastradas.".
- - Caso não, o sistema exclui o registro da base de dados, atualiza a grid de resultados e exibe a mensagem "Registro excluído com sucesso".

_[Estórias](#estorias)_

