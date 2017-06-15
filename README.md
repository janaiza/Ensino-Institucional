# Desafio: Zend Framework 2

Construir as estórias utilizando as tecnologias:
- PHP
- Zend 2
- Doctrine
- jQuery
- MySQL
- Ajax
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

