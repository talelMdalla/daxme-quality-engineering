*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${URL}                          https://dev.daxme.fr/
${BROWSER}                      Chrome
${expectedLandingPageUrl}       [https://dev.daxme.fr/landingpage,https://dev.daxme.fr/dashboard]
${DELAY_IN_SECONDS}             1


*** Keywords ***
Button Cookies
    Click Button    id:rcc-confirm-button

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

Login with credentials
    [Documentation]    Logs in with valid credentials
    [Arguments]    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY_IN_SECONDS}
    Button Cookies
    Button LoginForm
    Input Email    ${VALID_EMAIL}
    Sleep    ${DELAY_IN_SECONDS}
    Input pasword    ${VALID_PASSWORD}
    Sleep    ${DELAY_IN_SECONDS}
    Submit Login
    Sleep    ${DELAY_IN_SECONDS}
    ${current_url}=    Get Location
    Should Contain    ${expectedLandingPageUrl}    ${current_url}

Profile button
    Click Button    xpath://*[@id="navBar"]/div[2]/div[2]/div[3]/div[5]/li/a/button/span[1]
