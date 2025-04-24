*** Settings ***
Library     SeleniumLibrary


*** Keywords ***
Start date empty error message
    Wait Until Element Is Visible
    ...    xpath=//*[@id="start_date-helper-text"]/div
    ...    timeout=10s
    Element Should Contain
    ...    xpath=//*[@id="start_date-helper-text"]/div
    ...    Ce champ est obligatoire

End date empty error message
    Wait Until Element Is Visible
    ...    xpath=//*[@id="end_date-helper-text"]/div
    ...    timeout=10s
    Element Should Contain
    ...    xpath=//*[@id="end_date-helper-text"]/div
    ...    Ce champ est obligatoire

Start time empty error message
    Wait Until Element Is Visible
    ...    xpath=//*[@id="start_time-helper-text"]/div
    ...    timeout=10s
    Element Should Contain
    ...    xpath=//*[@id="start_time-helper-text"]/div
    ...    Ce champ est obligatoire

End time empty error message
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[3]/div[3]/li[2]/div/p/div
    ...    timeout=10s
    Element Should Contain
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[3]/div[3]/li[2]/div/p/div
    ...    Ce champ est obligatoire

Days per week empty error message
    Wait Until Element Is Visible
    ...    xpath=//*[@data-test-id="must have at least 1 items"]
    ...    timeout=10s
    Element Should Contain
    ...    xpath=//*[@data-test-id="must have at least 1 items"]
    ...    must have at least 1 items

Start date input
    [Arguments]    ${startDate}
    Wait Until Element Is Visible    xpath=//*[@id="start_date"]    timeout=10s
    Input Text    xpath=//*[@id="start_date"]    ${startDate}

End date input
    [Arguments]    ${endDate}
    Wait Until Element Is Visible    xpath=//*[@id="end_date"]    timeout=10s
    Input Text    xpath=//*[@id="end_date"]    ${endDate}

Start time input
    [Arguments]    ${startTime}
    Wait Until Element Is Visible    xpath=//*[@id="start_time"]    timeout=10s
    Input Text    xpath=//*[@id="start_time"]    ${startTime}

End time input
    [Arguments]    ${endTime}
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[3]/div[3]/li[2]/div/div/input
    ...    timeout=10s
    Input Text
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[3]/div[3]/li[2]/div/div/input
    ...    ${endTime}

Start break time input
    [Arguments]    ${startBreakTime}
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[4]/div[1]/li[2]/div/div/input
    ...    timeout=10s
    Input Text
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[4]/div[1]/li[2]/div/div/input
    ...    ${startBreakTime}

End break time input
    [Arguments]    ${endBreakTime}
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[4]/div[3]/li[2]/div/div/input
    ...    timeout=10s
    Input Text
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[4]/div[3]/li[2]/div/div/input
    ...    ${endBreakTime}

Set working days
    Click Element    xpath=//*[@id="select-days"]/div
    Click Element    xpath=//div[@id='react-select-3-option-0']

old start date and less than the end date error message
    Wait Until Element Is Visible
    ...    xpath=//*[@id="start_date-helper-text"]/div
    ...    timeout=10s
    Element Should Contain
    ...    xpath=//*[@id="start_date-helper-text"]/div
    ...    la date de debut doit être une date valide inferiéur à la date de fin et    à partir de la date d'aujourdhui

start date greater than the end date error message
    Wait Until Element Is Visible
    ...    xpath=//*[@id="end_date-helper-text"]/div
    ...    timeout=10s
    Element Should Contain
    ...    xpath=//*[@id="end_date-helper-text"]/div
    ...    la date de fin doit être une date valide postérieure à la date de début

start time less than end time error message
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[3]/div[3]/li[2]/div/p/div
    ...    timeout=10s
    Element Should Contain
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[3]/div[3]/li[2]/div/p/div
    ...    L'heure de fin doit être un format d'heure valide (--:--) la durée doit être supérieure à 1 heure

break time less than 30 min error message
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[4]/div[3]/li[2]/div/p/div
    ...    timeout=10s
    Element Should Contain
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[4]/div[3]/li[2]/div/p/div
    ...    L'heure de fin de pause doit être 30 minutes après l'heure de début de la pause et inférieure à l'heure de fin.

break times not between start and end times error message
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[4]/div[1]/li[2]/div/p/div
    ...    timeout=10s
    Element Should Contain
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[4]/div[1]/li[2]/div/p/div
    ...    L'heure de début de la pause doit être entre l'heure de début et l'heure de fin
