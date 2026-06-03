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

validate add working days with two time slots in the same day
    [Tags]    7
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
    Seconde Lundi start time    10:00
    Seconde Lundi end time    11:00
    MardiButton
    Add time slots button for Tuesday
    Mardi start time input    08:00
    Mardi end time input    10:00
    Seconde Mardi start time    10:00
    Seconde Mardi end time    11:00
    MercrediButton
    Add time slots button for Wednesday
    Mercredi start time input    08:00
    Mercredi end time input    10:00
    Seconde Mercredi start time    10:00
    Seconde Mercredi end time    11:00
    JeudiButton
    Add time slots button for Thursday
    Jeudi start time input    08:00
    Jeudi end time input    10:00
    Seconde Jeudi start time    10:00
    Seconde Jeudi end time    11:00
    VendrediButton
    Add time slots button for Friday
    Vendredi start time input    08:00
    Vendredi end time input    10:00
    Seconde Vendredi start time    10:00
    Seconde Vendredi end time    11:00
    SamediButton
    Add time slots button for Saturday
    Samedi Start Time Input2    08:00
    Samedi end time input    10:00
    Seconde Samedi start time    10:00
    Seconde Samedi end time    11:00
    DimancheButton
    Add time slots button for Sunday
    Dimanche start time input    08:00
    Dimanche end time input    10:00
    Seconde Dimanche start time    10:00
    Seconde Dimanche end time    11:00
    Scroll to bottom
    Sleep    1
    ValidateButton
    Success message
    [Teardown]    Close Browser