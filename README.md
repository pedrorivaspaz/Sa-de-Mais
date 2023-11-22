# Saúde Mais API

API feita e documentada visando a relação entre médicos e pacientes

Projeto feito em rails com fins acadêmicos para a FIAP

## Dependências

Docker instalado no host.

## Como configurar o projeto

- Verifica as dependências
- Instala variáveis de ambiente
- Build do container

```
$ ./configure.sh
```

#### Recomendações para IDE

##### **VSCode**

## Após instalar o docker

```
$ docker-compose build
```


## Como iniciar o docker

```
$ service docker start
```

## Como subir o projeto

```
$ docker-compose up
```

## Como executar os testes

```
$ docker-compose run --rm rspec
```

## Tecnologias

- Rails
- Docker