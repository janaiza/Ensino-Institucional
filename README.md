# Estórias:

1. [EU001 - Consultar Curso](#eu001)
2. [EU002 - Cadastrar Curso](#eu002)
3. [EU003 - Alterar Curso](#eu003)


<a name="eu001"></a>
# EU001 - Consultar Curso 

1. Ao acessar a funcionalidade, o sistema deverá exibir a tela com os seguintes campos e Botões:
##### Filtros de Pesquisa:
----
```sh
- Nome (Alfanumérico - 100)
- Sigla (Alfanumérico - 10)
- Cadastrar Curso (Botão)
- Pesquisar (Botão)
```

##### Colunas da grid de resultado:
----
```sh
- Nome
- Sigla
- Ações (Ícones: Alterar / Excluir)
```

2. Ao acionar o botão "Consultar" o sistema deverá validar se pelo menos um dos filtros de registro foi informado:
- Caso não, o sistema deverá apresentar a mensagem "Obrigatório informar pelo menos um dos filtros de consulta".
- Caso sim, o sistema deverá retornar da base de dados os registros de acordo com os filtros informados e atualizar a grid de resultado. Caso não retornar nenhum registro, o sistema deverá apresentar na grid de resultado a mensagem "Nenhum resgistro encontrado.".

3. Ao acionar o botão "Cadastrar Curso", o sistema redireciona para a Estória [EU002 - Cadastrar Curso](#eu002).

4. Ao acionar o ícone "Alterar", o sistema redireciona para a Estória [EU003 - Alterar Curso](#eu003).

5. Ao acionar o ícone "Excluir", o sistema redireciona para a Estória "EU004 - Excluir Curso".

----
# EU002 - Cadastrar Curso<a name="eu002"></a>

1. Ao acessar a funcionalidade, o sistema deverá exibir a tela com os seguintes campos/Botões:
----
```sh
- Nome (Alfanumérico - 100)
- Sigla (Alfanumérico - 10)
- Cancelar (Botão)
- Salvar (Botão)
```
2. Ao acionar o botão "Salvar":
- O sistema deverá validar os campos obrigatórios, caso não validado o sistema deverá exibir a mensagem "Campos obrigatórios não informados.".
- O sistema deverá validar se já existe um curso com o mesmo Nome cadastrado na base de dados (desconsiderando o curso em questão). Caso exista, o sistema deverá exibir a mensagem "Já existe o curso <nome_do_curso> cadastrado.". Onde <nome_do_curso> deverá ser substituído pelo nome do curso.
- O sistema deverá validar se já existe um curso com a mesma Sigla cadastrada na base de dados (desconsiderando o curso/sigla em questão). Caso exista, o sistema deverá exibir a mensagem "Já existe a sigla <nome_da_sigla> cadastrada para o curso <nome_do_curso>.". Onde <nome_da_sigla> deverá ser substituído pelo nome da sigla e <nome_do_curso> deverá ser substituído pelo nome do curso.
- O sistema identifica que todas as validações foram validadas, salva as informações na base de dados, exibe a mensagem "Registro cadastrado com sucesso" e redireciona para a estória "EU001 - Consultar Curso".

3. Ao acionar o botão cancelar o sistema deverá redirecionar para a estória "EU001 - Consultar Curso".

----
# EU003 - Alterar Curso<a name="eu003"></a>

1. Ao acessar a funcionalidade, o sistema deverá exibir a tela com os seguintes campos (preenchidos)/Botões:
```sh
- Nome (Alfanumérico - 100)
- Sigla (Alfanumérico - 10)
- Cancelar (Botão)
- Salvar (Botão)
```

2. Ao acionar o botão "Salvar":
- O sistema deverá validar os campos obrigatórios, caso não validado o sistema deverá exibir a mensagem "Campos obrigatórios não informados.".
- O sistema deverá validar se já existe um curso com o mesmo Nome cadastrado na base de dados (desconsiderando o curso em questão). Caso exista, o sistema deverá exibir a mensagem "Já existe o curso <nome_do_curso> cadastrado.". Onde <nome_do_curso> deverá ser substituído pelo nome do curso.
- O sistema deverá validar se já existe um curso com a mesma Sigla cadastrada na base de dados (desconsiderando o curso/sigla em questão). Caso exista, o sistema deverá exibir a mensagem "Já existe a sigla <nome_da_sigla> cadastrada para o curso <nome_do_curso>.". Onde <nome_da_sigla> deverá ser substituído pelo nome da sigla e <nome_do_curso> deverá ser substituído pelo nome do curso.
- O sistema identifica que todas as validações foram validadas, altera as informações na base de dados e exibe a mensagem "Registro alterado com sucesso" e redireciona para a estória "EU001 - Consultar Curso".

3. Ao acionar o botão cancelar o sistema deverá redirecionar para a estória "EU001 - Consultar Curso".
