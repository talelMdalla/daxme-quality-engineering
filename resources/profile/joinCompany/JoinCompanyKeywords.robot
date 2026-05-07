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
    Wait Until Keyword Succeeds    ${SMALL_RETRY_COUNT}    ${RETRY_DELAY}
    ...    Click Element    //button[@type='submit' and contains(@class,'btn_orange')]

Scroll To Company Information
    Execute JavaScript    window.scrollBy(0, 1900)
    Sleep    0.5s

Confirm button
    Click Element [Arguments] xpath=/html/body/div[3]/div/div[1]/div/div/div[2]/div[2]/div/button[2] ${SMALL_RETRY_COUNT}

Error invalid SIRET
    Wait Until Element Is Visible
    ...    xpath=//div[contains(@class,'invalid-feedback')]
    ...    5s

    Element Should Contain
    ...    xpath=//div[contains(@class,'invalid-feedback')]
    ...    ce champ doit contenir 14 caractères

Empty field error SIRET
    Element Text Should Contain [Arguments] xpath://*[@id="root"]/div[2]/div/div/div[2]/div/div[1]/div/div[3]/div/form/div[1]/div/div ${EmptySIRET} ${SMALL_RETRY_COUNT}

Success message
    Element Text Should Contain [Arguments] xpath:/html/body/div[1]/div[1]/div/div/div[1]/div[2] ${JoinSucessMsg} ${SMALL_RETRY_COUNT}
    Element Should Not Be Visible [Arguments] xpath:/html/body/div[1]/div[1]/div/div/div[1]/div[2] ${LARGE_RETRY_COUNT}

Quit company
    Click Element [Arguments] xpath://*[@id="root"]/div[2]/div/div/div[2]/div/div[1]/div/div[3]/div/div[3]/div/button ${SMALL_RETRY_COUNT}

Success message for quit company
    Element Text Should Contain [Arguments] xpath:/html/body/div[1]/div[1]/div/div/div[1]/div[2] ${QuitSucessMsg} ${SMALL_RETRY_COUNT}
