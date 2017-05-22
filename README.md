# EU001 - Consultar Curso

1. Ao acessar a funcionalidade, o sistema deverá exibir a tela com os seguintes campos e Botões:
##### Filtros de Pesquisa:
----
```sh
- Nome (Alfanumérico - 100)
- Sigla (Alfanumérico - 10)
- Pesquisar (Botão)
- Cadastrar Curso (Botão)
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

3. Ao acinar o botão "Cadastrar Curso", o sistema redireciona para a Estória "EU002 - Cadastrar Curso".

4. Ao acinar o ícone "Alterar", o sistema redireciona para a Estória "EU003 - Alterar Curso".

5. Ao acinar o ícone "Excluir", o sistema redireciona para a Estória "EU004 - Excluir Curso".
