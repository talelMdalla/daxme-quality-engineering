*** Settings ***
Library     SeleniumLibrary
Resource    ../Common.robot


*** Variables ***
${requiredTextError}        Ce champ est obligatoire
${emailOrPasswordError}     Email ou mot de passe invalide
${InvalidEmailError}        S'il vous plaît entrez un email valide


*** Keywords ***
Button LoginForm
    Click Element    xpath://a[@href="/app/login" and contains(text(), "Connexion")]
    Sleep    5s
    Capture Page Screenshot
Input Email
    [Arguments]    ${email}
    Input Text    id:email    ${email}

Input Password
    [Arguments]    ${password}
    Input Text    xpath://input[@type='password']    ${password}

Submit Login
    Click Element    xpath://*[@data-test-id='button-login-loginModal'] 

Empty email error
    Element Should Contain    xpath://*[@data-test-id="email-error"]    ${requiredTextError}

Empty password error
    Element Should Contain    xpath://*[@data-test-id="password-error"]    ${requiredTextError}

Invalid email or password error
    Wait Until Element Is Visible    xpath://*[@data-test-id="login_field_error"]    10s
    Element Should Contain    xpath://*[@data-test-id="login_field_error"]    ${emailOrPasswordError}

Invalid email error
    Element Should Contain    xpath://*[@data-test-id="email-error"]    ${InvalidEmailError}