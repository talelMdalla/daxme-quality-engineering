*** Settings ***
Documentation       Test cases for register functionality.

Library             SeleniumLibrary
Library             OperatingSystem
Library             XML
Resource            ../../config/EnvDetails.robot
Resource            ../../config/BrowserDetails.robot
Resource            ../../resources/auth/RegisterKeywords.robot

Test Teardown       Close Browser


*** Test Cases ***
Register with empty fields
    [Tags]    regression
    Open Browser Page
    Button RegisterForm
    Click Inscription Button
    Button AgentForm
    Accept general condition button
    Submit Register
    FirstName empty error
    LastName empty error
    Email empty error
    Number empty error
    Birthday empty error
    Number empty error
    Password empty error
    ConfirmPassword empty error

Register with email and number invalid
    [Tags]    1
    Open Browser Page
    Button RegisterForm
    Click Inscription Button
    Button AgentForm
    Accept general condition button
    Email Number invalid Input    testestest    75323861
    Submit Register
    Invalid number and email error

Register with email and number existe
    [Tags]    regression
    Open Browser Page
    Button RegisterForm
    Click Inscription Button
    Button AgentForm
    Accept general condition button
    Input FirstName    hamza
    Input LastName    chebbi
    Input Birthday    06-12-1998
    Input Password    Password123*
    Input ConfirmPassword    Password123*
    Email Number invalid Input    testing.daxme@gmail.com    0564619292
    Submit Register
    Email and Number existe error

Register with valid credentials
    [Tags]    smoke
    Open Browser Page
    Button RegisterForm
    Button AgentForm
    Accept general condition button
    Input FirstName    hamza
    Input LastName    chebbi
    ${email}    Get Random Email
    Input Email    ${email}
    Input Birthday    06-12-1998
    ${phoneNumber}    Get Random Phone Number
    Input Number    ${phoneNumber}
    Input Password    Password123*
    Input ConfirmPassword    Password123*
    Submit Register
    Profile Avatar Should Be Visible
