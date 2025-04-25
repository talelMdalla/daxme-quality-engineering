*** Settings ***
Documentation       Test cases for register functionality.

Library             SeleniumLibrary
Library             XML
Resource            ../../../../resources/profile/ProfileKeywords.robot
Resource            ../../../../resources/Keywords.robot


*** Variables ***
${URL}                  https://dev.daxme.fr/
${BROWSER}              Chrome
${DELAY_IN_SECONDS}     2
${VALID_EMAIL}          boutcho@outlook.com
${VALID_PASSWORD}       Hamza123&


*** Test Cases ***
validate create company with empty field
    [Tags]    1
    Login with credentials    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Sleep    ${DELAY_IN_SECONDS}
    Access to profile page
    Sleep    ${DELAY_IN_SECONDS}
    Scroll to company information
    Sleep    ${DELAY_IN_SECONDS}
    Create company button
    Sleep    ${DELAY_IN_SECONDS}
    Scroll to submit button
    Submit button
    Sleep    ${DELAY_IN_SECONDS}
    Empty company name error
    Empty company ID error
    Empty company type error
    [Teardown]    Close Browser

validate create company with invalid SIRET
    [Tags]    2
    Login with credentials    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Sleep    ${DELAY_IN_SECONDS}
    Access to profile page
    Sleep    ${DELAY_IN_SECONDS}
    Scroll to company information
    Sleep    ${DELAY_IN_SECONDS}
    Create company button
    Sleep    ${DELAY_IN_SECONDS}
    Company name input
    Company ID input
    Select company type from liste
    Scroll to submit button
    Sleep    ${DELAY_IN_SECONDS}
    Confirm button
    Seconde confirm button
    [Teardown]    Close Browser

validate create company with valid SIRET
    [Tags]    3
    Login with credentials    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Sleep    ${DELAY_IN_SECONDS}
    Access to profile page
    Sleep    ${DELAY_IN_SECONDS}
    Scroll to company information
    Sleep    ${DELAY_IN_SECONDS}
    Create company button
    Sleep    ${DELAY_IN_SECONDS}

    Submit button
    Sleep    ${DELAY_IN_SECONDS}
    Confirm button
    Sleep    ${DELAY_IN_SECONDS}
    Success message
    [Teardown]    Close Browser

Quit company
    [Tags]    4
    Login with credentials    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Sleep    ${DELAY_IN_SECONDS}
    Access to profile page
    Sleep    ${DELAY_IN_SECONDS}
    Scroll to company information
    Quitter l'entreprise button
    Sleep    ${DELAY_IN_SECONDS}
    Seconde confirm button for quit company
    Sleep    ${DELAY_IN_SECONDS}
    success quit company error
    Sleep    ${DELAY_IN_SECONDS}
    [Teardown]    Close Browser


*** Keywords ***
Access to profile page
    Click Button    xpath://button[@data-test-id="photo_profile"]
    Click Button    xpath://*[@id="drop"]/button[1]

Create company button
    Click Element    xpath://*[@id="card-title"]

Company name input
    Input Text    xpath://*[@data-test-id="company_name"]    text=HamzaCompany

Company ID input
    Input Text    xpath://*[@data-test-id="company_siret"]    text=56465600400017

SIRET valid input
    Input Text    xpath://*[@id="company__input3"]    text=12000000500013

Submit button
    Click Element    xpath://*[@id="root"]/div[2]/div/div/div[2]/div/div[1]/div/div[3]/div/form/div[7]/div/button

Scroll to company information
    Scroll Element Into View    xpath=//*[@id="root"]/div[2]/div/div/div[2]/div/div[1]/div/div[4]/div/div[2]/button

Scroll to submit button
    Scroll Element Into View
    ...    xpath=//*[@id="root"]/div[2]/div/div/div[2]/div/div[1]/div/div[4]/div/div[2]/button

Confirm button
    Click Button    xpath=//*[@id="root"]/div[2]/div/div/div[2]/div/div[1]/div/div[3]/div/form/div[7]/div/button

Seconde confirm button
    Click Button    xpath=/html/body/div[3]/div/div[1]/div/div/div[2]/div[2]/div/button

Empty company name error
    Element Should Contain
    ...    xpath://*[@id="root"]/div[2]/div/div/div[2]/div/div[1]/div/div[3]/div/form/div[1]/div/div[2]
    ...    Ce champ est obligatoire

Empty company ID error
    Element Should Contain
    ...    xpath://*[@id="root"]/div[2]/div/div/div[2]/div/div[1]/div/div[3]/div/form/div[2]/div/div[2]
    ...    Ce champ est obligatoire

Empty company type error
    Element Should Contain
    ...    xpath://*[@id="root"]/div[2]/div/div/div[2]/div/div[1]/div/div[3]/div/form/div[3]/div/div
    ...    Ce champ est obligatoire

Success message
    Element Should Contain
    ...    xpath://*[@id="tu as rejoint l'entreprise avec succés"]/div[1]/div[2]
    ...    tu as rejoint l'entreprise avec succés

Select company type from liste
    Select From List By Value    id:company__input    9

Quitter l'entreprise button
    Click Element    xpath=//*[@id="root"]/div[2]/div/div/div[2]/div/div[1]/div/div[3]/div/div[3]/div/button

success quit company error
    Element Should Contain
    ...    xpath://*[@id="vous avez quitté l'entreprise"]
    ...    vous avez quitté l'entreprise

Seconde confirm button for quit company
    Click Element    css:.btn__confirm.btn.btn-secondary
