*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${REGISTER}                //a[contains(.,'Cadastre-se para fazer entregas')]
${PAGE_TITLE}              Buger Eats
${HEAD_NAME}               //h1[contains(.,'Seja um parceiro entregador pela Buger Eats')]
${INITIAL_PAGE_TEXT}       //p[contains(.,'Em vez de oportunidades tradicionais de entrega de refeições em horários pouco flexíveis, seja seu próprio chefe.')]
${REGITER_PAGE_TITLE}      //h1[contains(.,'Cadastre-se para  fazer entregas')]
${STREET}                  Rua Paineira
${NEIGHBORHOOD}                  Parque Santa Rita de Cássia
${CITY}                  Cotia/SP

*** Keywords ***
Validacao Pagina inicial
    Title Should Be                    ${PAGE_TITLE}
    Wait Until Element Is Visible      ${HEAD_NAME}
    Wait Until Element Is Visible      ${HEAD_NAME}
    Wait Until Element Is Visible      ${INITIAL_PAGE_TEXT}

Quando registrar os dados pessoais do entregador
    Click Element    ${REGISTER}
    Wait Until Element Is Visible    //input[@placeholder='Nome completo']
    Click Element                    //input[@placeholder='Nome completo']        
    Input Text                       //input[@placeholder='Nome completo']          Kamila Vittor
    Click Element                    //input[@placeholder='CPF somente números']    
    Input Text                       //input[@placeholder='CPF somente números']    37163328877
    Click Element                    //input[@placeholder='E-mail']        
    Input Text                       //input[@placeholder='E-mail']                 kamila.ribeiro89@hotmail.com
    Click Element                    //input[@placeholder='Whatsapp'] 
    Input Text                       //input[@placeholder='Whatsapp']               962347146 
    
E registrar o endereco do entregador
    Click Element                         //input[@placeholder='CEP']
    Input Text                            //input[@placeholder='CEP']            06700665
    Click Element                         //input[@value='Buscar CEP']
    Wait Until Element Is Visible         //input[@value='${STREET}']
    Click Element                         //input[@placeholder='Número']
    Input Text                            //input[@placeholder='Número']         84   
    Click Element                         //input[@placeholder='Complemento'] 
    Input Text                            //input[@placeholder='Complemento']    Casa 1
    Scroll Element Into View              //h2[contains(.,'Método de entrega')]
    Wait Until Element Is Visible         //input[@value='${NEIGHBORHOOD}']
    Sleep    3
    Wait Until Element Is Visible         //input[contains(@value,'${CITY}')]

E selecionar o metodo de entrega 
    Click Element    //img[@alt='Moto']

E realizar o upload da CNH
    Scroll Element Into View     //button[contains(.,'Cadastre-se para fazer entregas')]
    Choose File                  //input[contains(@type,'file')]     C:\\Users\\kamila.vittor\\Pictures\\CNH.png

E concluir o cadastro
    Click Element                    //button[contains(.,'Cadastre-se para fazer entregas')]
    Sleep    3

Então o cadastro é realizado
    Wait Until Element Is Visible    //button[contains(.,'Fechar')]
    Click Element                    //button[contains(.,'Fechar')]
