*** Settings ***
Library     SeleniumLibrary
Resource    ../../Common.robot


*** Variables ***
${Empty_filed_error}                Ce champ est obligatoire
${Success_Msg}                      Entreprise créée avec succès
${success_Quit company error}       vous avez quitté l'entreprise

${InvalidSIRET}                     12000044500013
${validSIRET}                       10000000900017


*** Keywords ***
Access to profile page
    Click Element [Arguments] xpath://button[@data-test-id="photo_profile"] ${SMALL_RETRY_COUNT}
    Click Element [Arguments] xpath://*[@id="drop"]/button[1] ${SMALL_RETRY_COUNT}

Create company button
    Click Element [Arguments] xpath://*[@id="card-title"] ${SMALL_RETRY_COUNT}

Company name input
    Set Text [Arguments] xpath://*[@data-test-id="company_name"] TestCompany ${SMALL_RETRY_COUNT}

Company ID input
    Set Text [Arguments] xpath://*[@data-test-id="company_siret"] ${InvalidSIRET} ${SMALL_RETRY_COUNT}

SIRET valid input
    Set Text [Arguments] xpath://*[@data-test-id="company_siret"] ${validSIRET} ${SMALL_RETRY_COUNT}

Submit button
    Click Element [Arguments] xpath://*[@id="root"]/div[2]/div/div/div[2]/div/div[1]/div/div[3]/div/form/div[7]/div/button ${SMALL_RETRY_COUNT}

Scroll to company information
    Scroll Element Into View    xpath=//*[@id="root"]/div[2]/div/div/div[2]/div/div[1]/div/div[4]/div/div[2]/button

Scroll to submit button
    Scroll To Element [Arguments] xpath=//*[@id="root"]/div[2]/div/div/div[2]/div/div[1]/div/div[4]/div/div[2]/button ${SMALL_RETRY_COUNT}

Confirm button
    Click Element [Arguments] xpath=/html/body/div[3]/div/div[1]/div/div/div[2]/div[2]/div/button ${SMALL_RETRY_COUNT}

Seconde confirm button
    Click Element [Arguments] xpath=/html/body/div[3]/div/div[1]/div/div/div[2]/div[2]/div/button ${SMALL_RETRY_COUNT}

Empty company name error
    Element Text Should Be [Arguments] xpath://*[@id="root"]/div[2]/div/div/div[2]/div/div[1]/div/div[3]/div/form/div[1]/div/div[2] ${Empty_filed_error} ${SMALL_RETRY_COUNT}

Empty company ID error
    Element Text Should Be [Arguments] xpath://*[@id="root"]/div[2]/div/div/div[2]/div/div[1]/div/div[3]/div/form/div[2]/div/div[2] ${Empty_filed_error} ${SMALL_RETRY_COUNT}

Empty company type error
    Element Text Should Be [Arguments] xpath://*[@id="root"]/div[2]/div/div/div[2]/div/div[1]/div/div[3]/div/form/div[3]/div/div ${Empty_filed_error} ${SMALL_RETRY_COUNT}

Success message
    Element Text Should Be [Arguments] xpath:/html/body/div[1]/div[1]/div/div/div[1]/div[2] ${Success_Msg} ${SMALL_RETRY_COUNT}

Select company type from liste
    Select From List By Value    id:company__input    9

Quitter l'entreprise button
    Click Element    xpath=//*[@id="root"]/div[2]/div/div/div[2]/div/div[1]/div/div[3]/div/div[3]/div/button

success quit company error
    Element Text Should Be [Arguments] xpath://*[@id="vous avez quitté l'entreprise"] ${success_Quit company error} ${SMALL_RETRY_COUNT}

Seconde confirm button for quit company
    Click Element    css:.btn__confirm.btn.btn-secondary
