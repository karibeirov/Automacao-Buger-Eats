*** Settings ***
Library        SeleniumLibrary
Resource       buger_eats.resource

*** Keywords ***
Dado que estou na home page da Buger Eats
    [Documentation]    Abrir o navegador
    Open Browser    https://buger-eats.vercel.app/    chrome
    Maximize Browser Window
    Validacao Pagina inicial

Teardown Web Environment
    [Documentation]    Closes all browsers
    Capture Page Screenshot    EMBED
    Close All Browsers