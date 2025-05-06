*** Settings ***
Documentation       Test cases for create mission functionality.

Library             SeleniumLibrary
Resource            ../../resources/createMission/DescriptionKeywords.robot
Resource            ../../resources/createMission//ScheduleKeywords.robot
Resource            ../../resources/Keywords.robot


*** Variables ***
${email}                client-indiv@gmail.com
${passwrod}             Daxme2021&
${DELAY_IN_SECONDS}     2


*** Test Cases ***
Validate description step with emty fields
    [Documentation]    First step "Description"
    [Tags]    regression
    Login with credentials    ${email}    ${passwrod}
    Create mission button
    Scroll to bottom
    Next button
    Empty mission name error message
    Empty mission type error message
    Empty gender error message
    Empty level error message
    Empty adress error message
    Close Browser

Validate with a single character in the name and description fields
    [Documentation]    First step "Description"
    [Tags]    regression
    Login with credentials    ${email}    ${passwrod}
    Create mission button
    Mission name input    a
    Mission description input    a
    Scroll to bottom
    Next button
    one caracter error message name
    one caracter error message description
    Close Browser

validate with an agent number greater than 124
    [Documentation]    First step "Description"
    [Tags]    regression
    Login with credentials    ${email}    ${passwrod}
    Create mission button
    Agent number input    290
    Scroll to bottom
    Next button
    maximun agent error message
    Close Browser

validate description form with valid data
    [Documentation]    First step "Description"
    [Tags]    smoke
    Login with credentials    ${email}    ${passwrod}
    Create mission button
    Mission name input    hamza
    Mission type input
    Select company type from listes
    Gender checkbox
    Level checkbox
    Adress input
    Scroll to bottom
    Next button
    Verify description step

Validate schedule step with emty fields
    [Documentation]    Second step "schedule"
    [Tags]    5
    First step description
    Next button
    Start date empty error message
    End date empty error message
    Days per week empty error message
    Close Browser

validate with an old start date and less than the end date
    [Documentation]    Second step "schedule"
    [Tags]    6
    First step description
    Start date input    12/01/2024
    End date input    25/01/2024
    Next button
    old start date and less than the end date error message
    Close Browser

validate with a start date greater than the end date
    [Documentation]    Second step "schedule"
    [Tags]    7
    First step description
    Start date input    12/01/2025
    End date input    12/01/2024
    Next button
    start date greater than the end date error message
    Close Browser

validate with start time less than end time
    [Documentation]    Second step "schedule"
    [Tags]    8
    First step description
    Start time input    08:00
    End time input    08:00
    Next button
    Sleep    2s    reason=waiting error to popup
    start time less than end time error message
    Close Browser

validate with break time less than 30 min
    [Documentation]    Second step "schedule"
    [Tags]    9
    First step description
    Start date input    25/01/2025
    End date input    25/02/2025
    Start time input    09:00
    End time input    08:00
    Start break time input    12:00
    End break time input    18:00
    Next button
    Sleep    2s    reason=waiting error to popup
    break time less than 30 min error message
    Close Browser

validate with break times not between start and end times
    [Documentation]    Second step "schedule"
    [Tags]    10
    First step description
    Start date input    25/01/2025
    End date input    25/02/2025
    Start time input    09:00
    End time input    18:00
    Start break time input    07:00
    End break time input    08:00
    Next button
    Sleep    2s    reason=waiting error to popup
    break times not between start and end times error message
    Close Browser

validate schedule form with valid data
    [Documentation]    Second step "schedule"
    [Tags]    11
    First step description
    Start date input    25/01/2025
    End date input    25/02/2025
    Set working days
    Start time input    09:00
    End time input    18:00
    Start break time input    13:00
    End break time input    14:00
    Next button
    Sleep    2s
    Verify schedule step
    Close Browser

validate schedule update with invalid schedules
    [Documentation]    third step "Working hours"
    [Tags]    11
    Second step schedule


*** Keywords ***
First step description
    Login with credentials    ${email}    ${passwrod}
    Create mission button
    Mission name input    hamza
    Mission type input
    Select company type from listes
    Gender checkbox
    Level checkbox
    Adress input
    Scroll to bottom
    Next button
    Verify description step

Second step schedule
    First step description
    Start date input    25/01/2025
    End date input    25/02/2025
    Set working days
    Start time input    09:00
    End time input    18:00
    Start break time input    13:00
    End break time input    14:00
    Next button
    Sleep    2s
    Verify schedule step
