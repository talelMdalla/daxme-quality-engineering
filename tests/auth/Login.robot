*** Settings ***
Documentation       Test cases for login functionality.

Library             SeleniumLibrary
Library             OperatingSystem
Resource            ../../resources/auth/LoginKeywords.robot

Test Teardown       Close Browser


*** Variables ***
${VALID_EMAIL}          testing1.daxme@gmail.com
${VALID_PASSWORD}       Boutcho123&
${INVALID_EMAIL}        testing1.daxme@gmail.com
${INVALID_PASSWORD}     Hamza123*
${EMAIL_INVALID}        hamza.com


*** Test Cases ***
Login with valid credentials
    [Tags]    smoke
    Open Browser Page
    Button LoginForm
    Input Email    ${VALID_EMAIL}
    Input Password    ${VALID_PASSWORD}
    Submit Login
    Profile Avatar Should Be Visible

Login with empty fields
    [Tags]    regression
    Open Browser Page
    Button LoginForm
    Submit Login
    Emty email error
    Emty password error

Login with email or password invalid
    [Tags]    regression
    Open Browser Page
    Button LoginForm
    Input Email    ${INVALID_EMAIL}
    Input Password    ${INVALID_PASSWORD}
    Submit Login
    Invalid email or password error

Login with email invalid
    [Tags]    regression
    Open Browser Page
    Button LoginForm
    Input Email    ${EMAIL_INVALID}
    Input Password    ${INVALID_PASSWORD}
    Invalid email error
