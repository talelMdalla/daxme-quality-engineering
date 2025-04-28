*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${VALID_EMAIL}          testing.daxme@gmail.com
${INVALID_EMAIL}        testing
${EmailNotExist}        azure@gmail.com
${DELAY_IN_SECONDS}     3
${EMAIL_INVALID}        hamza.com


*** Keywords ***
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
