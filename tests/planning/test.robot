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
validate add working days with start time grater than end time
    [Tags]    2
    Login with credentials    ${email}    ${passwrod}
    Sleep    time_=${DELAY_IN_SECONDS}
    PlanningButton
    Sleep    time_=${DELAY_IN_SECONDS}
    EnterMyAvailabilityButton
    Sleep    time_=${DELAY_IN_SECONDS}
    LundiButton
    MardiButton
    MercrediButton
    JeudiButton
    VendrediButton
    SamediButton
    DimancheButton
    Lundi start time input    08:00
    Lundi end time input    06:00
    Mardi start time input    08:00
    Mardi end time input    06:00
    Mercredi start time input    08:00
    Mercredi end time input    06:00
    Jeudi start time input    08:00
    Jeudi end time input    06:00
    Vendredi start time input    08:00
    Vendredi end time input    06:00
    Samedi start time input    08:00
    Samedi end time input    06:00
    Dimanche start time input    08:00
    Dimanche end time input    06:00
    Sleep    time_=${DELAY_IN_SECONDS}
    Validate Errors for start time grater than end time
    [Teardown]    Close Browser