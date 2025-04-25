*** Settings ***
Library     SeleniumLibrary
Resource    ../Common.robot


*** Variables ***
${requiredTextError}        Ce champ est obligatoire
${emailOrPasswordError}     Email ou mot de passe invalide
${InvalidEmailError}        S'il vous plaît entrez un email valide


*** Keywords ***
Button LoginForm
    Click Element [Arguments] xpath://*[@data-test-id="button-login-navbar"] ${SMALL_RETRY_COUNT}

Input Email
    [Arguments]    ${email}
    Set Text [Arguments] id:email ${email} ${SMALL_RETRY_COUNT}

Input Password
    [Arguments]    ${password}
    Set Text [Arguments] xpath://input[@type='password'] ${password} ${SMALL_RETRY_COUNT}

Profile Avatar Should Be Visible
    Element Should Be Visible [Arguments] xpath://*[@data-test-id="photo_profile"] ${SMALL_RETRY_COUNT}

Submit Login
    Click Element [Arguments] xpath://*[@data-test-id='button-login-loginModal'] ${SMALL_RETRY_COUNT}

Emty email error
    Element Text Should Contain [Arguments] xpath://*[@data-test-id="email-error"] ${requiredTextError} ${SMALL_RETRY_COUNT}

Emty password error
    Element Text Should Contain [Arguments] xpath://*[@data-test-id="password-error"] ${requiredTextError} ${SMALL_RETRY_COUNT}

Invalid email or password error
    Element Text Should Contain [Arguments] xpath://*[@data-test-id="login_field_error"] ${emailOrPasswordError} ${SMALL_RETRY_COUNT}

Invalid email error
    Element Text Should Contain [Arguments] xpath://*[@data-test-id="schema:validate_email"] ${InvalidEmailError} ${SMALL_RETRY_COUNT}
