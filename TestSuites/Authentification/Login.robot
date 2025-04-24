*** Settings ***
Documentation       Test cases for login functionality.

Library             SeleniumLibrary
Library             OperatingSystem


*** Variables ***
${URL}                          https://dev.daxme.fr/
${BROWSER}                      Chrome
${VALID_EMAIL}                  testing.daxme@gmail.com
${VALID_PASSWORD}               Hamza123&
${INVALID_EMAIL}                testing.daxme@gmail.com
${INVALID_PASSWORD}             Hamza123*
${expectedLandingPageUrl}       [https://dev.daxme.fr/landingpage,https://dev.daxme.fr/dashboard]
${DELAY_IN_SECONDS}             3
${EMAIL_INVALID}                hamza.com


*** Test Cases ***
Login with valid credentials
    [Tags]    1
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY_IN_SECONDS}
    Button Cookies
    Button LoginForm
    Input Email    ${VALID_EMAIL}
    Sleep    ${DELAY_IN_SECONDS}
    Input Password    ${VALID_PASSWORD}
    Sleep    ${DELAY_IN_SECONDS}
    Submit Login
    Sleep    ${DELAY_IN_SECONDS}
    ${current_url}=    Get Location
    Should Contain    ${expectedLandingPageUrl}    ${current_url}
    [Teardown]    Close Browser

Login with empty fields
    [Tags]    2
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY_IN_SECONDS}
    Button Cookies
    Button LoginForm
    Submit Login
    Emty email error
    Emty password error
    Sleep    ${DELAY_IN_SECONDS}
    [Teardown]    Close Browser

Login with email or password invalid
    [Tags]    3
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY_IN_SECONDS}
    Button Cookies
    Button LoginForm
    Input Email    ${INVALID_EMAIL}
    Sleep    ${DELAY_IN_SECONDS}
    Input Password    ${INVALID_PASSWORD}
    Sleep    ${DELAY_IN_SECONDS}
    Submit Login
    Sleep    ${DELAY_IN_SECONDS}
    Invalid email or password error
    [Teardown]    Close Browser

Login with email invalid
    [Tags]    3
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY_IN_SECONDS}
    Button Cookies
    Button LoginForm
    Input Email    ${EMAIL_INVALID}
    Sleep    ${DELAY_IN_SECONDS}
    Input Password    ${INVALID_PASSWORD}
    Sleep    ${DELAY_IN_SECONDS}
    Invalid email error
    [Teardown]    Close Browser


*** Keywords ***
Button Cookies
    Click Button    id:rcc-confirm-button

Button LoginForm
    Click Button    xpath://*[@data-test-id="button-login-navbar"]

Input Email
    [Arguments]    ${email}
    Input Text    id:email    ${email}

Input Password
    [Arguments]    ${password}
    Input Text    xpath://input[@type='password']    ${password}

Submit Login
    Click Button    xpath://*[@data-test-id='button-login-loginModal']

Emty email error
    Element Should Contain    xpath://*[@data-test-id="schema:required"]    Ce champ est obligatoire

Emty password error
    Element Should Contain    xpath://*[@data-test-id="schema:required"]    Ce champ est obligatoire

Invalid email or password error
    Element Should Contain    xpath://*[@data-test-id="login_field_error"]    Email ou mot de passe invalide

Invalid email error
    Element Should Contain
    ...    xpath://*[@data-test-id="schema:validate_email"]
    ...    S'il vous plaît entrez un email valide
