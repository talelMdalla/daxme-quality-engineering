*** Settings ***
Documentation       Test cases for login functionality.

Library             SeleniumLibrary
Library             OperatingSystem
Resource            ../../resources/auth/LoginKeywords.robot


*** Variables ***
${VALID_EMAIL}          testing.daxme@gmail.com
${VALID_PASSWORD}       Boutcho123&
${INVALID_EMAIL}        testing.daxme@gmail.com
${INVALID_PASSWORD}     Hamza123*
${EMAIL_INVALID}        hamza.com


*** Test Cases ***
Login with valid credentials
    [Tags]    smoke
    Open Browser    ${TEST_ENV_URL}    ${BROWSER}
    Maximize Browser Window
    Button Cookies
    Button LoginForm
    Input Email    ${VALID_EMAIL}
    Input Password    ${VALID_PASSWORD}
    Submit Login
    Profile Avatar Should Be Visible
    [Teardown]    Close Browser

Login with empty fields
    [Tags]    regression
    Open Browser    ${TEST_ENV_URL}    ${BROWSER}
    Maximize Browser Window
    Button Cookies
    Button LoginForm
    Submit Login
    Emty email error
    Emty password error
    [Teardown]    Close Browser

Login with email or password invalid
    [Tags]    regression
    Open Browser    ${TEST_ENV_URL}    ${BROWSER}
    Maximize Browser Window
    Button Cookies
    Button LoginForm
    Input Email    ${INVALID_EMAIL}
    Input Password    ${INVALID_PASSWORD}
    Submit Login
    Invalid email or password error
    [Teardown]    Close Browser

Login with email invalid
    [Tags]    regression
    Open Browser    ${TEST_ENV_URL}    ${BROWSER}
    Maximize Browser Window
    Button Cookies
    Button LoginForm
    Input Email    ${EMAIL_INVALID}
    Input Password    ${INVALID_PASSWORD}
    Invalid email error
    [Teardown]    Close Browser
