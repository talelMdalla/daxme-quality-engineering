*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/Common.robot


*** Variables ***
${expectedPageUrl}          https://dev.daxme.fr/verif-code
${requiredTextError}        Ce champ est obligatoire
${InvalideNumberError}      Veuillez saisir un numéro valide
${InvalideEmailError}       S'il vous plaît entrez un email valide
${EmailExistError}          Adresse mail déja utilisée
${NumberExistError}         Numéro de téléphone déja utilisé


*** Keywords ***
Button RegisterForm
    Click Button    xpath://*[@data-test-id="button-signup-navbar"]
    Sleep    5s
    Capture Page Screenshot

Button AgentForm
    Click Element    xpath://*[@data-test-id="card-individu-modal"]

Input FirstName
    [Arguments]    ${FirstName}
    Input Text    xpath://*[@id="FirstName"]    ${FirstName}

Input LastName
    [Arguments]    ${LastName}
    Input Text    xpath://*[@id="lastName"]    ${LastName}

Input Email
    [Arguments]    ${Email}
    Input Text    xpath://*[@id="mail"]    ${Email}

Input Birthday
    [Arguments]    ${day}    ${month}    ${year}
    # Remplir le jour
    Click Element    xpath=//span[@aria-label="Day"]
    Press Keys       xpath=//span[@aria-label="Day"]    ${day}
    Sleep    0.2s    
    Click Element    xpath=//span[@aria-label="Month"]
    Press Keys       xpath=//span[@aria-label="Month"]    ${month}
    Sleep    0.2s
    # Remplir l'année
    Click Element    xpath=//span[@aria-label="Year"]
    Press Keys       xpath=//span[@aria-label="Year"]    ${year}
    Sleep    0.2s

Input Number
    [Arguments]    ${Number}
    Input Text    xpath://input[@type="tel"]    ${Number}
    Press Keys    xpath://input[@type="tel"]    TAB

Input Password
    [Arguments]    ${Password}
    Input Text    xpath://*[@name="password1"]    ${Password}

Input ConfirmPassword
    [Arguments]    ${ConfirmPassword}
    Input Text    xpath://*[@name="password2"]    ${ConfirmPassword}

Submit Register
    Click Button    xpath://*[@data-test-id="button-singupAgent-modal"]

Accept general condition button
    Click Element   xpath://input[@type="checkbox"]   ${SMALL_RETRY_COUNT}

Confirm recaptcha
    Click Button    id=recaptcha-anchor

Email Number invalid Input
    [Arguments]    ${Email}    ${Number}
    Input Text    xpath://*[@id="mail"]    ${Email}
    Input Text    xpath://input[@type="tel"]    ${Number}
    
FirstName empty error
    Element Text Should Contain  xpath://*[@data-test-id="error_first_name"]  ${requiredTextError}  ${SMALL_RETRY_COUNT}

LastName empty error
    Element Text Should Contain   xpath://*[@data-test-id="error_last_name"]  ${requiredTextError}  ${SMALL_RETRY_COUNT}

Email empty error
    Element Text Should Contain   xpath://*[@data-test-id="error_email"]  ${requiredTextError}  ${SMALL_RETRY_COUNT}

Birthday empty error
    Element Text Should Contain   xpath://*[@data-test-id="error_date_of_birth"]  ${requiredTextError}  ${SMALL_RETRY_COUNT}

Number empty error
    Element Text Should Contain   xpath://*[@data-test-id="error_phone_number"]   ${requiredTextError}  ${SMALL_RETRY_COUNT}

Password empty error
    Element Text Should Contain   xpath://*[@data-test-id="error_password_1"]  ${requiredTextError}  ${SMALL_RETRY_COUNT}

ConfirmPassword empty error
    Element Text Should Contain   xpath://*[@data-test-id="error_password2"]  ${requiredTextError}  ${SMALL_RETRY_COUNT}

Invalid number and email error
    Element Text Should Contain   xpath://*[@data-test-id="errorphone"]  ${InvalideNumberError}  ${SMALL_RETRY_COUNT}
    Element Text Should Contain   xpath://*[@data-test-id="error_email"]  ${InvalideEmailError}  ${SMALL_RETRY_COUNT}

Email and Number existe error
    Element Text Should Contain   xpath://*[@data-test-id="erroremail"]  ${EmailExistError}  ${SMALL_RETRY_COUNT}
    Element Text Should Contain   xpath://*[@data-test-id="errorphone"]  ${NumberExistError}  ${SMALL_RETRY_COUNT}

Invalid email error only
    Element Text Should Contain   xpath://*[@data-test-id="error_email"]  ${InvalideEmailError}  ${SMALL_RETRY_COUNT}

Invalid number error only
    Element Text Should Contain      xpath=//*[@data-test-id="errorphone"]    ${InvalideNumberError}  ${SMALL_RETRY_COUNT}