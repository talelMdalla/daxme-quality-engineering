*** Settings ***
Library     SeleniumLibrary
Resource    ../../../config/SeleniumConfigs.robot
Resource    ../../../resources/Common.robot
Resource    ../../../config/CredentialsDetails.robot


*** Variables ***
${SIRETinvalide}    veuillez saisir un identifiant d'entreprise valide
${EmptySIRET}       Ce champ est obligatoire
${ValidSIRET}       tu as rejoint l'entreprise avec succés
${QuitSucessMsg}    Vous avez quitté l'entreprise
${JoinSucessMsg}    Vous avez rejoint l'entreprise avec succés


*** Keywords ***
Access to profile page
    Click Element [Arguments] xpath://button[@data-test-id="photo_profile"] ${SMALL_RETRY_COUNT}
    Click Element [Arguments] xpath://*[@id="drop"]/button[1] ${SMALL_RETRY_COUNT}

Joindre une entreprise
    Click Element [Arguments] xpath://*[@id="root"]/div[2]/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[3] ${SMALL_RETRY_COUNT}

SIRET invalid input
    Set Text [Arguments] xpath://*[@id="company__input3"] 77021502800018 ${SMALL_RETRY_COUNT}

SIRET valid input
    Set Text [Arguments] xpath://*[@id="company__input3"] ${TEST_SIRET} ${SMALL_RETRY_COUNT}

Submit button
    Click Element [Arguments] xpath://*[@id="root"]/div[2]/div/div/div[2]/div/div[1]/div/div[3]/div/form/div[2]/button ${SMALL_RETRY_COUNT}

Scroll to company information
    Scroll To Element [Arguments] xpath://*[@id="root"]/div[2]/div/div/div[2]/div/div[1]/div/div[4] ${SMALL_RETRY_COUNT}

Confirm button
    Click Element [Arguments] xpath=/html/body/div[3]/div/div[1]/div/div/div[2]/div[2]/div/button[2] ${SMALL_RETRY_COUNT}

Error invalid SIRET
    Element Text Should Contain [Arguments] xpath://*[@id="root"]/div[2]/div/div/div[2]/div/div[1]/div/div[3]/div/form/div[1]/div/div ${SIRETinvalide} ${SMALL_RETRY_COUNT}

Empty field error SIRET
    Element Text Should Contain [Arguments] xpath://*[@id="root"]/div[2]/div/div/div[2]/div/div[1]/div/div[3]/div/form/div[1]/div/div ${EmptySIRET} ${SMALL_RETRY_COUNT}

Success message
    Element Text Should Contain [Arguments] xpath:/html/body/div[1]/div[1]/div/div/div[1]/div[2] ${JoinSucessMsg} ${SMALL_RETRY_COUNT}
    Element Should Not Be Visible [Arguments] xpath:/html/body/div[1]/div[1]/div/div/div[1]/div[2] ${LARGE_RETRY_COUNT}

Quit company
    Click Element [Arguments] xpath://*[@id="root"]/div[2]/div/div/div[2]/div/div[1]/div/div[3]/div/div[3]/div/button ${SMALL_RETRY_COUNT}

Success message for quit company
    Element Text Should Contain [Arguments] xpath:/html/body/div[1]/div[1]/div/div/div[1]/div[2] ${QuitSucessMsg} ${SMALL_RETRY_COUNT}
