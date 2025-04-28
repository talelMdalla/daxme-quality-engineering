*** Settings ***
Documentation       Test cases for forgot password functionality.

Library             SeleniumLibrary
Resource            ../../resources/Common.robot
Resource            ../../resources/auth/ForgotPasswordKeywords.robot

Test Teardown       Close Browser


*** Test Cases ***
Validate reset password with empty email field
    [Tags]    regression
    Open Browser Page
    Button LoginForm
    Forgot password button
    Submit
    Emty email error

Validate reset password with invalid email
    [Tags]    regression
    Open Browser Page
    Button LoginForm
    Forgot password button
    Input Email    ${INVALID_EMAIL}
    Submit
    Invalid email error

Validate reset password with email not existing
    [Tags]    regression
    Open Browser Page
    Button LoginForm
    Forgot password button
    Input Email    ${EmailNotExist}
    Submit
    Email not exist error

Validate reset password with valid email
    [Tags]    smoke
    Open Browser Page
    Button LoginForm
    Forgot password button
    Input Email    ${VALID_EMAIL}
    Submit
    Success message
