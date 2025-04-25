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
validate join company with invalid SIRET
    [Tags]    1
    Login with credentials    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Sleep    ${DELAY_IN_SECONDS}
    Access to profile page
    Sleep    ${DELAY_IN_SECONDS}
    Scroll to company information
    Sleep    ${DELAY_IN_SECONDS}
    Joindre une entreprise
    Sleep    ${DELAY_IN_SECONDS}
    SIRET invalid input
    Submit button
    Sleep    ${DELAY_IN_SECONDS}
    Confirm button
    Sleep    ${DELAY_IN_SECONDS}
    Error invalid SIRET
    [Teardown]    Close Browser

validate join company with empty field
    [Tags]    2
    Login with credentials    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Sleep    ${DELAY_IN_SECONDS}
    Access to profile page
    Sleep    ${DELAY_IN_SECONDS}
    Scroll to company information
    Sleep    ${DELAY_IN_SECONDS}
    Joindre une entreprise
    Submit button
    Sleep    ${DELAY_IN_SECONDS}
    Empty field error SIRET
    [Teardown]    Close Browser

validate join company with valid SIRET
    [Tags]    3
    Login with credentials    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Sleep    ${DELAY_IN_SECONDS}
    Access to profile page
    Sleep    ${DELAY_IN_SECONDS}
    Scroll to company information
    Sleep    ${DELAY_IN_SECONDS}
    Joindre une entreprise
    Sleep    ${DELAY_IN_SECONDS}
    SIRET valid input
    Submit button
    Sleep    ${DELAY_IN_SECONDS}
    Confirm button
    Sleep    ${DELAY_IN_SECONDS}
    Success message
    [Teardown]    Close Browser


*** Keywords ***
Access to profile page
    Click Button    xpath://button[@data-test-id="photo_profile"]
    Click Button    xpath://*[@id="drop"]/button[1]

Joindre une entreprise
    Click Element    xpath://*[@id="root"]/div[2]/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[2]

SIRET invalid input
    Input Text    xpath://*[@id="company__input3"]    text=77021502800018

SIRET valid input
    Input Text    xpath://*[@id="company__input3"]    text=12000000500013

Submit button
    Click Button    xpath://*[@id="root"]/div[2]/div/div/div[2]/div/div[1]/div/div[3]/div/form/div[2]/button

Scroll to company information
    Scroll Element Into View    xpath=//*[@id="root"]/div[2]/div/div/div[2]/div/div[1]/div/div[4]/div/div[2]/button

Confirm button
    Click Button    locator=//button[text()='Confirmer']

Error invalid SIRET
    Element Should Contain
    ...    xpath://*[@data-test-id="veuillez saisir un identifiant d'entreprise valide"]
    ...    veuillez saisir un identifiant d'entreprise valide

Empty field error SIRET
    Element Should Contain
    ...    xpath://*[@data-test-id="Ce champ est obligatoire"]
    ...    Ce champ est obligatoire

Success message
    Element Should Contain
    ...    xpath://*[@id="tu as rejoint l'entreprise avec succés"]/div[1]/div[2]
    ...    tu as rejoint l'entreprise avec succés
