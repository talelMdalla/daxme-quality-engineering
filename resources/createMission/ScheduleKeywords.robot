*** Settings ***
Library     SeleniumLibrary
Resource    ../Common.robot


*** Variables ***
${EmptyErrorMsg}                                                        Ce champ est obligatoire
${Days_per_week_empty_error}                                            Doit avoir au moins 1
${start_time_less_than_end_time_error}                                  La durée d'un interval doit être supérieure ou égale à une heure.
${Start_break_time_must_be_between_start_time_and_end_time_error}       L'heure de début de la pause doit être entre l'heure de début et l'heure de fin
${start_break_time_must_between_start_time_and_end_time}                L'heure de début de la pause doit être entre l'heure de début et l'heure de fin
${start_date_and_less_than_end_date_error}                              la date de debut doit être une date valide

*** Keywords ***
Start date empty error message
    Wait Until Page Contains Element
    ...    xpath=(//*[contains(text(),'${EmptyErrorMsg}')])[1]
    ...    timeout=20s

End date empty error message
    Wait Until Page Contains Element
    ...    xpath=(//*[contains(text(),'${EmptyErrorMsg}')])[2]
    ...    timeout=20s

Days per week empty error message
    Wait Until Page Contains Element
    ...    xpath=//div[contains(@data-test-id,'${Days_per_week_empty_error}')]
    ...    timeout=20s

Start date input
    [Arguments]    ${startDate}
    Click Element    xpath=(//div[@role="group"])[1]
    Press Keys    None    ${startDate}

End date input
    [Arguments]    ${endDate}
    Click Element    xpath=(//div[@role="group"])[2]
    Press Keys    None    ${endDate}

Monday Start time input
    [Arguments]    ${startTime}
    Wait Until Element Is Visible
    ...    xpath=//*[@id="start_time-0-0"]
    ...    timeout=10s
    Set Text [Arguments] xpath=//*[@id="start_time-0-0"] ${startTime} ${SMALL_RETRY_COUNT}

Monday end time input
    [Arguments]    ${endTime}
    Wait Until Element Is Visible
    ...    xpath=//*[@id="end_time-0-0"]
    ...    timeout=10s

    Set Text [Arguments] xpath=//*[@id="end_time-0-0"] ${endTime} ${SMALL_RETRY_COUNT}

Start break time input
    [Arguments]    ${startBreakTime}
    Wait Until Element Is Visible
    ...    xpath=//*[@id="start_break_time-0-0"]
    ...    timeout=10s
    Set Text [Arguments] xpath=//*[@id="start_break_time-0-0"] ${startBreakTime} ${SMALL_RETRY_COUNT}

End break time input
    [Arguments]    ${endBreakTime}
    Wait Until Element Is Visible
    ...    xpath=//*[@id="end_break_time-0-0"]
    ...    timeout=10s
    Set Text [Arguments] xpath=//*[@id="end_break_time-0-0"] ${endBreakTime} ${SMALL_RETRY_COUNT}

Set working days
    Click Element    xpath=//*[@id="select-days"]/div
    Click Element    xpath=//div[@id='react-select-4-option-0']

old start date and less than the end date error message
    Wait Until Element Is Visible
    ...    xpath=//*[contains(normalize-space(.), '${start_date_and_less_than_end_date_error}')]
    ...    timeout=10s
    
start date greater than the end date error message
    Wait Until Element Is Visible
    ...    xpath=//*[@id="end_date-helper-text"]/div
    ...    timeout=10s
    Element Should Contain
    ...    xpath=//*[@id="end_date-helper-text"]/div
    ...    la date de fin doit être une date valide postérieure à la date de début

start time less than end time error message
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[4]/div[1]/div/div[2]/div[2]/div[2]
    ...    timeout=10s
    Element Text Should Contain [Arguments] xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[4]/div[1]/div/div[2]/div[2]/div[2] ${start_time_less_than_end_time_error} ${SMALL_RETRY_COUNT}

Start break time must be between start time and end time error message
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[3]/div[1]/div/div[3]/div[1]/div[2]
    ...    timeout=10s
    Element Text Should Contain [Arguments] xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[3]/div[1]/div/div[3]/div[1]/div[2] ${Start_break_time_must_be_between_start_time_and_end_time_error} ${SMALL_RETRY_COUNT}

break times not between start and end times error message
    Element Text Should Contain [Arguments] xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[3]/div[1]/div/div[3]/div[1]/div[2] ${start_break_time_must_between_start_time_and_end_time} ${SMALL_RETRY_COUNT}

select days filed
    Click Element [Arguments] xpath=//*[@id="select-days"]/div ${SMALL_RETRY_COUNT}
    Click Element [Arguments] xpath=//div[@id='react-select-4-option-0'] ${SMALL_RETRY_COUNT}
    Click Element [Arguments] xpath=//div[@id='react-select-4-option-1'] ${SMALL_RETRY_COUNT}

Click on days per week
    Click Element [Arguments]  xpath=//*[@id="select-days"]/div ${SMALL_RETRY_COUNT}

Add break time button
    Click Element [Arguments] xpath=/html/body/div[1]/div[2]/div/div/div/div/div/div[3]/div/div/div[3]/div[1]/div/button ${SMALL_RETRY_COUNT}

Add interval button
    Click Element [Arguments] xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[3]/div[1]/div/div[1]/button/span[1] ${SMALL_RETRY_COUNT}

Seconde Start time
    [Arguments]    ${SecondeStartTime}
    Wait Until Element Is Visible
    ...    xpath=//*[@id="start_time-0-1"]
    ...    timeout=10s

    Set Text [Arguments] xpath=//*[@id="start_time-0-1"] ${SecondeStartTime} ${SMALL_RETRY_COUNT}

Seconde End time
    [Arguments]    ${SecondeEndTime}
    Wait Until Element Is Visible
    ...    xpath=//*[@id="end_time-0-1"]
    ...    timeout=10s

    Set Text [Arguments] xpath=//*[@id="end_time-0-1"] ${SecondeEndTime} ${SMALL_RETRY_COUNT}

Delete day
    Click Element [Arguments] xpath=//*[@id="select-days"]/div/div[1]/div[2]/div[2]/svg ${SMALL_RETRY_COUNT}

# specific keywords for specific test case "validate with two time slots in the same day"

select Monday
    Click Element [Arguments] xpath=//*[@id="select-days"]/div ${SMALL_RETRY_COUNT}
    Click Element [Arguments] xpath=//div[@id='react-select-4-option-0'] ${SMALL_RETRY_COUNT}

Seconde Start time1
    [Arguments]    ${SecondeStartTime}
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[4]/div[1]/div/div[4]/div[1]/div/div/input
    ...    timeout=10s

    Set Text [Arguments] xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[4]/div[1]/div/div[4]/div[1]/div/div/input ${SecondeStartTime} ${SMALL_RETRY_COUNT}

Seconde End time1
    [Arguments]    ${SecondeEndTime}
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[4]/div[1]/div/div[4]/div[2]/div/div/input
    ...    timeout=10s

    Set Text [Arguments] xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[4]/div[1]/div/div[4]/div[2]/div/div/input ${SecondeEndTime} ${SMALL_RETRY_COUNT}

Monday Start time input1
    [Arguments]    ${startTime}
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[3]/div[1]/div/div[2]/div[1]/div/div/input
    ...    timeout=10s
    Set Text [Arguments] xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[3]/div[1]/div/div[2]/div[1]/div/div/input ${startTime} ${SMALL_RETRY_COUNT}

Monday end time input1
    [Arguments]    ${endTime}
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[3]/div[1]/div/div[2]/div[2]/div/div/input
    ...    timeout=10s

    Set Text [Arguments] xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[3]/div[1]/div/div[2]/div[2]/div/div/input ${endTime} ${SMALL_RETRY_COUNT}

Start break time input1
    [Arguments]    ${startBreakTime}
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[3]/div[1]/div/div[3]/div[1]/div/div/input
    ...    timeout=10s
    Set Text [Arguments] xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[3]/div[1]/div/div[3]/div[1]/div/div/input ${startBreakTime} ${SMALL_RETRY_COUNT}

End break time input1
    [Arguments]    ${endBreakTime}
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[3]/div[1]/div/div[3]/div[2]/div/div/input
    ...    timeout=10s
    Set Text [Arguments] xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[3]/div[1]/div/div[3]/div[2]/div/div/input ${endBreakTime} ${SMALL_RETRY_COUNT}
