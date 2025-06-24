*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/Common.robot


*** Variables ***
${All_DAYS_OFF_ERROR_MSG}       La création d'une mission avec seulement des jours de congés est impossible


*** Keywords ***
Next week button
    Click Element [Arguments] xpath=//*[@id="Calendar__Day"]/button[2] ${SMALL_RETRY_COUNT}

Card of day selected
    Click Element [Arguments] xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div[2]/div[2]/div[2]/div[2]/div[16]/div ${SMALL_RETRY_COUNT}

Day off check box
    Click Element [Arguments] xpath=/html/body/div[3]/div[3]/div/div[3]/label/span[1]/span[1]/input ${SMALL_RETRY_COUNT}

Update button
    Click Element [Arguments] xpath=/html/body/div[3]/div[3]/div/div[3]/div/button[2] ${SMALL_RETRY_COUNT}

Setp3 Next button
    Click Element [Arguments] xpath=//*[@id="Groupe_Buttons_Step"]/button[2] ${SMALL_RETRY_COUNT}

Confirm Financial information modal
    Click Element [Arguments] xpath=/html/body/div[3]/div/div[1]/div/div/div[2]/div[3]/button[2] ${SMALL_RETRY_COUNT}

Create mission with all days off error
    Element Text Should Be [Arguments] xpath=/html/body/div[1]/div[1]/div/div/div[1]/div[2] ${All_DAYS_OFF_ERROR_MSG} ${SMALL_RETRY_COUNT}

Select tow days
    Click Element [Arguments] xpath=//*[@id="select-days"]/div ${SMALL_RETRY_COUNT}
    Click Element [Arguments] xpath=//*[@id="react-select-4-option-0"] ${SMALL_RETRY_COUNT}
    Click Element [Arguments] xpath=//*[@id="react-select-4-option-1"] ${SMALL_RETRY_COUNT}

Tuesday start time
    [Arguments]    ${TuesdayStartTime}
    Wait Until Element Is Visible
    ...    xpath=//*[@id="start_time-1-0"]
    ...    timeout=10s

    Set Text [Arguments] xpath=//*[@id="start_time-1-0"] ${TuesdayStartTime} ${SMALL_RETRY_COUNT}

Tuesday end time
    [Arguments]    ${TuesdayendTime}
    Wait Until Element Is Visible
    ...    xpath=//*[@id="end_time-1-0"]
    ...    timeout=10s

    Set Text [Arguments] xpath=//*[@id="end_time-1-0"] ${TuesdayendTime} ${SMALL_RETRY_COUNT}

Verif create mission with one day off
    Element Should Be Visible [Arguments] xpath=//*[@id="Groupe_Buttons_Step"]/button ${SMALL_RETRY_COUNT}
