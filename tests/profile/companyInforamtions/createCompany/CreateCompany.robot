*** Settings ***
Documentation       Test cases for register functionality.

Library             SeleniumLibrary
Library             XML
Resource            ../../../../resources/profile/ProfileKeywords.robot
Resource            ../../../../resources/Keywords.robot
Resource            ../../../../resources/profile/createCompnay/CreateCompanyKeywords.robot

Test Teardown       Close Browser


*** Variables ***
${VALID_EMAIL}          createcompany@gmail.com
${VALID_PASSWORD}       Boutcho123&

${VALID_EMAIL1}         boutcho@outlook.com
${VALID_PASSWORD1}      Hamza123&


*** Test Cases ***
validate create company with empty field
    [Tags]    regression
    Login with credentials    ${VALID_EMAIL1}    ${VALID_PASSWORD1}
    Access to profile page
    Scroll to company information
    Create company button
    Scroll to submit button
    Submit button
    Empty company name error
    Empty company ID error
    Empty company type error

validate create company with invalid SIRET
    [Tags]    regression
    Login with credentials    ${VALID_EMAIL1}    ${VALID_PASSWORD1}
    Access to profile page
    Scroll to company information
    Create company button
    Company name input
    Company ID input
    Select company type from liste
    Scroll to submit button
    Submit button
    Seconde confirm button

validate create company with valid SIRET
    [Tags]    smoke
    Login with credentials    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Access to profile page
    Scroll To The Bottom Of The Page
    Create company button
    Company name input
    SIRET valid input
    Select company type from liste
    Scroll to submit button
    Submit button
    # Seconde confirm button
    # Success message
