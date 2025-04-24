*** Settings ***
Documentation       Test cases for login functionality.

Library             SeleniumLibrary
Library             OperatingSystem


*** Variables ***
${URL}                          https://platform.daxme.fr/
${BROWSER}                      Chrome
${VALID_EMAIL}                  ${EMPTY}
${VALID_PASSWORD}               ${EMPTY}
${expectedLandingPageUrl}       https://platform.daxme.fr/landingpage
${DELAY_IN_SECONDS}             1


*** Tasks ***
Login with valid credentials
    [Tags]    1
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY_IN_SECONDS}
    Button Cookies
    Button LoginForm
    Input Email    ${VALID_EMAIL}
    Input pasword    ${VALID_PASSWORD}
    Submit Login
    Sleep    ${DELAY_IN_SECONDS}
    ${current_url}=    Get Location
    Log    Current URL after login: ${current_url}
    Should Be Equal    ${current_url}    ${expectedLandingPageUrl}


*** Keywords ***
Button Cookies
    Click Button    id:rcc-decline-button

Button LoginForm
    Click Button    xpath://*[@data-test-id="button-login-navbar"]

Input Email
    [Arguments]    ${email}
    Input Text    id:email    ${email}

Input pasword
    [Arguments]    ${password}
    Input Text    xpath://input[@type='password']    ${password}

Submit Login
    Click Button    xpath://*[@data-test-id='button-login-loginModal']
