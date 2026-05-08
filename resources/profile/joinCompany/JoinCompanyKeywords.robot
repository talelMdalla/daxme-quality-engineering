*** Settings ***
Library     SeleniumLibrary
Resource    ../../../config/SeleniumConfigs.robot
Resource    ../../../resources/Common.robot
Resource    ../../../config/CredentialsDetails.robot


*** Variables ***
${SIRETinvalide}    ce champ doit contenir 14 caractères
${EmptySIRET}       Ce champ est obligatoire
${ValidSIRET}       tu as rejoint l'entreprise avec succés
${QuitSucessMsg}    Vous avez quitté l'entreprise
${JoinSucessMsg}    Vous avez rejoint l'entreprise avec succés


*** Keywords ***
Access to profile page
    Click Element   xpath://button[@data-test-id="photo_profile"]   ${SMALL_RETRY_COUNT}
    Click Element   xpath://*[@id="drop"]/button[1]   ${SMALL_RETRY_COUNT}

Joindre une entreprise
    ${LOCATOR}=    Set Variable    xpath=//span[normalize-space(.)="Joindre une entreprise existante"]/ancestor::div[contains(@class,"card-ctn")]
    Wait Until Element Is Visible    ${LOCATOR}    10s
    Scroll Element Into View    ${LOCATOR}
    Click Element    ${LOCATOR}

SIRET invalid input
    Input Text    xpath=//*[@id="company__input3"]    77021502
    Press Keys    xpath=//*[@id="company__input3"]    TAB

SIRET valid input
    Set Text    xpath=//*[@id="company__input3"]    ${TEST_SIRET}    ${SMALL_RETRY_COUNT}

Submit button
    Wait Until Element Is Visible
    ...    xpath=//button[normalize-space(.)="Soumettre" and not(@disabled)]
    ...    10s
    Click Element
    ...    xpath=//button[normalize-space(.)="Soumettre" and not(@disabled)]
    
Scroll To Company Information
    Execute JavaScript    window.scrollBy(0, 1900)
    Sleep    0.5s

Confirm button
    Wait Until Element Is Visible    xpath=//div[@role='dialog']//button[@class='btn_orange' and normalize-space()='Confirmer']    10s
    Click Element                    xpath=//div[@role='dialog']//button[@class='btn_orange' and normalize-space()='Confirmer']

Error invalid SIRET
    Wait Until Element Is Visible
    ...    xpath=//div[contains(@class,'invalid-feedback')]
    ...    5s

    Element Should Contain
    ...    xpath=//div[contains(@class,'invalid-feedback')]
    ...    ce champ doit contenir 14 caractères

Empty field error SIRET
    Wait Until Element Is Visible    xpath=//div[@data-test-id="Ce champ est obligatoire"]    10s
    Element Text Should Be    xpath=//div[@data-test-id="Ce champ est obligatoire"]   ${EmptySIRET}  ${SMALL_RETRY_COUNT}

Success message
    Element Text Should Contain   xpath=//div[@role='alert' and contains(@class,'Toastify__toast--success')]  ${JoinSucessMsg}   ${SMALL_RETRY_COUNT}

Quit company
    Wait Until Element Is Visible    xpath=//button[contains(@class,'btn_orange') and contains(.,'Quitter')]    10s
    Scroll Element Into View         xpath=//button[contains(@class,'btn_orange') and contains(.,'Quitter')]
    Click Element                    xpath=//button[contains(@class,'btn_orange') and contains(.,'Quitter')]

Success message for quit company
     Element Text Should Contain   xpath=//div[@role='alert' and contains(@class,'Toastify__toast--success')]  ${QuitSucessMsg}   ${SMALL_RETRY_COUNT}
