*** Settings ***
Resource    ../locators/LoginPageLocators.robot
Resource    CommonPo.robot


*** Keywords ***
Login To The Application [Arguments] ${email} ${password}
    [Documentation]
    ...    Login using valid email and password    ...

    Open Browser To Login Page
    Submit Login Information [Arguments] ${email} ${password}
    image Should Be Visible On The Navigation Bar

image Should Be Visible On The Navigation Bar
    [Documentation]
    ...    User should see the profile avatar on the navigation bar    ...

    Element Should Be Visible [Arguments] ${profileAvatar} ${SMALL_RETRY_COUNT}

User Should See An Alert With The Error Message [Arguments] ${errorMessage}
    [Documentation]
    ...    User should see an alert with the error message on the browser    ...

    Alert Should Be Present    ${errorMessage}

Submit Login Information [Arguments] ${email} ${password}
    [Documentation]
    ...    Login using the email and password    ...

    Click Element [Arguments] ${connexionBtn} ${SMALL_RETRY_COUNT}
    Set Text [Arguments] ${emailTextBox} ${email} ${SMALL_RETRY_COUNT}
    Set Text [Arguments] ${passwordTextBox} ${password} ${SMALL_RETRY_COUNT}
    Click Element [Arguments] ${loginButton} ${SMALL_RETRY_COUNT}

Open Browser And Login To The Application
    [Documentation]
    ...    Open browser and login using valid email and password    ...

    Open Browser To Login Page
    Login To The Application [Arguments] ${INDIV_CLIENT_EMAIL} ${PASSWORD}
