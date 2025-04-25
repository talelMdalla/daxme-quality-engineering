*** Settings ***
Documentation       Test cases for register functionality.

Library             SeleniumLibrary
Library             OperatingSystem
Library             XML



*** Variables ***
${URL}                  https://dev.daxme.fr/
${BROWSER}              Chrome
${DELAY_IN_SECONDS}     1
${expectedPageUrl}      https://dev.daxme.fr/verif-code


*** Test Cases ***
Register with empty fields
    [Tags]    1
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY_IN_SECONDS}
    Button Cookies
    Button RegisterForm
    Sleep    ${DELAY_IN_SECONDS}
    Button AgentForm
    Accept general condition button
    Submit Register
    Sleep    ${DELAY_IN_SECONDS}
    FirstName empty error
    LastName empty error
    Email empty error
    Number empty error
    Birthday empty error
    Number empty error
    Password empty error
    ConfirmPassword empty error
    Sleep    ${DELAY_IN_SECONDS}
    [Teardown]    Close Browser

Register with email and number invalid
    [Tags]    2
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY_IN_SECONDS}
    Button Cookies
    Button RegisterForm
    Sleep    ${DELAY_IN_SECONDS}
    Button AgentForm
    Accept general condition button
    Email Number invalid Input    testestest    75323861
    Submit Register
    Invalid number and password error
    Sleep    ${DELAY_IN_SECONDS}
    [Teardown]    Close Browser

Register with email and number existe
    [Tags]    3
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY_IN_SECONDS}
    Button Cookies
    Button RegisterForm
    Sleep    ${DELAY_IN_SECONDS}
    Button AgentForm
    Accept general condition button
    sleep    time_=10s    reason=wainting for recaptcha
    # Confirm recaptcha
    Input FirstName    hamza
    Input LastName    chebbi
    Input Birthday    06-12-1998
    Input Password    Password123*
    Input ConfirmPassword    Password123*
    Email Number invalid Input    testing.daxme@gmail.com    0678900999
    Submit Register
    Sleep    ${DELAY_IN_SECONDS}
    Email and Number existe error
    Sleep    ${DELAY_IN_SECONDS}
    [Teardown]    Close Browser

Register with valid credentials
    [Tags]    4
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY_IN_SECONDS}
    Button Cookies
    Button RegisterForm
    Sleep    ${DELAY_IN_SECONDS}
    Button AgentForm
    Accept general condition button
    sleep    time_=30s    reason=wainting for recaptcha
    Input FirstName    hamza
    Input LastName    chebbi
    Input Email    testes@tes.te
    Input Birthday    06-12-1998
    Input Number    0678900799
    Input Password    Password123*
    Input ConfirmPassword    Password123*
    Submit Register
    sleep    time_=5s
    ${current_url}=    Get Location
    Log    Current URL after login: ${current_url}
    Should Be Equal    ${current_url}    ${expectedPageUrl}
    sleep    time_=5s
    [Teardown]    Close Browser



*** Keywords ***
Button Cookies
    Click Button    id:rcc-confirm-button

Button RegisterForm
    Click Button    xpath://*[@data-test-id="button-signup-navbar"]

Button AgentForm
    Click Element    xpath://*[@data-test-id="card-agent-modal"]

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
    [Arguments]    ${Birthday}
    Input Text    xpath://*[@id="date"]    ${Birthday}

Input Number
    [Arguments]    ${Number}
    Input Text    xpath://input[@type="tel"]    ${Number}

Input Password
    [Arguments]    ${Password}
    Input Text    xpath://*[@name="password1"]    ${Password}

Input ConfirmPassword
    [Arguments]    ${ConfirmPassword}
    Input Text    xpath://*[@name="password2"]    ${ConfirmPassword}

Submit Register
    Click Button    xpath://*[@data-test-id="button-singupAgent-modal"]

Accept general condition button
    Click Button    xpath://input[@type="checkbox"]

Confirm recaptcha
    Click Button    id=recaptcha-anchor

Email Number invalid Input
    [Arguments]    ${Email}    ${Number}
    Input Text    xpath://*[@id="mail"]    ${Email}
    Input Text    xpath://input[@type="tel"]    ${Number}

FirstName empty error
    Element Should Contain    xpath://*[@data-test-id="error_first_name"]    Ce champ est obligatoire

LastName empty error
    Element Should Contain    xpath://*[@data-test-id="error_last_name"]    Ce champ est obligatoire

Email empty error
    Element Should Contain    xpath://*[@data-test-id="error_email"]    Ce champ est obligatoire

Birthday empty error
    Element Should Contain    xpath://*[@data-test-id="error_date_of_birth"]    Ce champ est obligatoire

Number empty error
    Element Should Contain    xpath://*[@data-test-id="error_phone_number"]    Ce champ est obligatoire

Password empty error
    Element Should Contain    xpath://*[@data-test-id="error_password_1"]    Ce champ est obligatoire

ConfirmPassword empty error
    Element Should Contain    xpath://*[@data-test-id="error_password2"]    Ce champ est obligatoire

Invalid number and password error
    Element Should Contain    xpath://*[@data-test-id="error_phone_number"]    Veuillez saisir un numéro valide
    Element Should Contain    xpath://*[@data-test-id="error_email"]    S'il vous plaît entrez un email valide

Email and Number existe error
    Element Should Contain    xpath://*[@data-test-id="erroremail"]    Adresse mail deja utilisée
    Element Should Contain    xpath://*[@data-test-id="errorphone"]    Numéro de téléphone deja utilisé
