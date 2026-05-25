*** Settings ***
Documentation       Test cases for create mission functionality.

Library             SeleniumLibrary
Resource            ../../resources/planning/WorkingDaysKeywords.robot
Resource            ../../resources/Keywords.robot
Resource            ../../resources/planning/FonctionKeywords.robot


*** Variables ***
${email}                plano1@yopmail.com
${passwrod}             Daxme2021&
${DELAY_IN_SECONDS}     1


*** Test Cases ***
validate add working days with two time slots in the same day with overlap
    [Tags]    4
    Login with credentials    ${email}    ${passwrod}
    Sleep    time_=${DELAY_IN_SECONDS}
    PlanningButton
    Sleep    time_=${DELAY_IN_SECONDS}
    EnterMyAvailabilityButton
    Sleep    time_=${DELAY_IN_SECONDS}
    LundiButton
    Add time slots button for monday
    Lundi start time input    08:00
    Lundi end time input    10:00
    Seconde Lundi start time    08:00
    Seconde Lundi end time    11:00
    Sleep    1
    Overlap error message
    [Teardown]    Close Browser