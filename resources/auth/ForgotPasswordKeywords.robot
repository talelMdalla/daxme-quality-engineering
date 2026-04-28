*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/Common.robot
Resource    ../../config/CredentialsDetails.robot


*** Variables ***
${VALID_EMAIL}              ${TEST_EMAIL_AUTH}
${INVALID_EMAIL}            testing
${EmailNotExist}            azure@gmail.com
${EMAIL_INVALID}            hamza.com
${Success_message}          e-mail de réinitialisation du mot de passe envoyé
${EmailNotEsixtError}       email n'existe pas
${InvalidEmailError}        S'il vous plaît entrez un email valide
${EmptyEmailError}          Ce champ est obligatoire


*** Keywords ***
Button LoginForm
    Common.Click Element    xpath://a[@href="/login" and contains(text(), "Connexion")]

Forgot password button
    Common.Click Element    xpath://*[@id="forgotPassword"]    ${SMALL_RETRY_COUNT}

Input Email
    [Arguments]    ${email}
    Input Text    id:Email    ${email}

Submit
    Common.Click Element    xpath://*[@data-test-id="btn_verification_email"]    ${SMALL_RETRY_COUNT}

Epmty email error
    Element Text Should Be    xpath://*[@data-test-id="reset-password-email"]    ${EmptyEmailError}    ${SMALL_RETRY_COUNT}

Invalid email error
    Element Text Should Contain    xpath://*[@data-test-id="reset-password-email"]    ${InvalidEmailError}    ${SMALL_RETRY_COUNT}

Email not exist error
    Element Text Should Contain    xpath://*[@data-test-id="reset-password-email"]    ${EmailNotEsixtError}    ${SMALL_RETRY_COUNT}

Success message
    Element Text Should Contain    xpath://*[@data-test-id="sucess_send_reset"]    ${Success_message}    ${SMALL_RETRY_COUNT}