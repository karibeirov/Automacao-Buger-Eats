*** Settings ***
Resource        ../resources/buger_eats.resource
Resource        ../resources/setup.resource

Test Teardown    Teardown Web Environment

*** Test Cases ***
Cenário de Teste 01 - Cadastro do Entregador
    Dado que estou na home page da Buger Eats
    Quando registrar os dados pessoais do entregador
    E registrar o endereco do entregador
    E selecionar o metodo de entrega 
    E realizar o upload da CNH
    E concluir o cadastro
    Então o cadastro é realizado