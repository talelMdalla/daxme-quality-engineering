*** Settings ***
Documentation       Test cases for forgot password functionality.

Library             SeleniumLibrary


*** Variables ***
${URL}                  https://dev.daxme.fr/
${BROWSER}              Chrome
${VALID_EMAIL}          testing.daxme@gmail.com
${INVALID_EMAIL}        testing
${EmailNotExist}        azure@gmail.com
${DELAY_IN_SECONDS}     3
${EMAIL_INVALID}        hamza.com


*** Test Cases ***
Validate reset password with empty email field
    [Tags]    1
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY_IN_SECONDS}
    Button Cookies
    Button LoginForm
    Forgot password button
    Submit
    Sleep    ${DELAY_IN_SECONDS}
    Emty email error
    [Teardown]    Close Browser

Validate reset password with invalid email
    [Tags]    2
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY_IN_SECONDS}
    Button Cookies
    Button LoginForm
    Forgot password button
    Input Email    ${INVALID_EMAIL}
    Submit
    Sleep    ${DELAY_IN_SECONDS}
    Invalid email error
    [Teardown]    Close Browser

Validate reset password with email not existing
    [Tags]    3
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY_IN_SECONDS}
    Button Cookies
    Button LoginForm
    Forgot password button
    Input Email    ${EmailNotExist}
    Submit
    Sleep    ${DELAY_IN_SECONDS}
    Email not exist error
    [Teardown]    Close Browser

Validate reset password with valid email
    [Tags]    4
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY_IN_SECONDS}
    Button Cookies
    Button LoginForm
    Forgot password button
    Input Email    ${VALID_EMAIL}
    Submit
    Sleep    ${DELAY_IN_SECONDS}
    Success message
    [Teardown]    Close Browser


*** Keywords ***
Button Cookies
    Click Button    id:rcc-confirm-button

Button LoginForm
    Click Button    xpath://*[@data-test-id="button-login-navbar"]

Forgot password button
    Click Element    xpath://*[@id="forgotPassword"]

Input Email
    [Arguments]    ${email}
    Input Text    id:Email    ${email}

Submit
    Click Button    xpath://*[@data-test-id="btn_verification_email"]

Emty email error
    Element Should Contain    xpath://*[@data-test-id="schema:required"]    Ce champ est obligatoire

Invalid email error
    Element Should Contain
    ...    xpath://*[@data-test-id="schema:validate_email"]
    ...    S'il vous plaît entrez un email valide

Email not exist error
    Element Should Contain    xpath://*[@data-test-id="email n'existe pas"]    email n'existe pas

Success message
    Element Should Contain
    ...    xpath://*[@data-test-id="sucess_send_reset"]
    ...    e-mail de réinitialisation du mot de passe envoyé
