*** Settings ***
Library     SeleniumLibrary
Resource    ../Common.robot


*** Variables ***
${EmptyErrorMsg}        Ce champ est obligatoire
${3caracterError}       Ce champ doit contenir au moins 3 caractères
${AgentNumberError}     doit être un nombre positif inférieur à 124


*** Keywords ***
Create mission button
    Wait Until Element Is Visible    xpath=//*[@id="chip_create_mission"]    timeout=10s
    Click Element [Arguments] xpath=//*[@id="chip_create_mission"] ${SMALL_RETRY_COUNT}

Next button
    Click Element [Arguments] xpath=/html/body/div[1]/div[2]/div/div/div/div/div/div[4]/div/div/div/button[2] ${SMALL_RETRY_COUNT}

Empty mission name error message
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[1]/div[1]/div/div    timeout=10s
    Element Text Should Contain [Arguments] xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[1]/div[1]/div/div ${EmptyErrorMsg} ${SMALL_RETRY_COUNT}

Empty mission type error message
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[1]/div[2]/div[1]/li[3]/div
    ...    timeout=10s
    Element Text Should Contain [Arguments] xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[1]/div[2]/div[1]/li[3]/div ${EmptyErrorMsg} ${SMALL_RETRY_COUNT}

Empty gender error message
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[1]/div[3]/div/li[2]/div
    ...    timeout=10s
    Element Text Should Contain [Arguments] xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[1]/div[4]/div/li[2]/div ${EmptyErrorMsg} ${SMALL_RETRY_COUNT}

Empty level error message
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[1]/div[5]/div/li[2]/div
    ...    timeout=10s
    Element Text Should Contain [Arguments] xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[1]/div[5]/div/li[2]/div ${EmptyErrorMsg} ${SMALL_RETRY_COUNT}

Empty adress error message
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[2]/div[2]/li[2]/div/div[2]
    ...    timeout=10s
    Element Text Should Contain [Arguments] xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[2]/div[2]/li[2]/div/div[2] ${EmptyErrorMsg} ${SMALL_RETRY_COUNT}

one caracter error message name
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[1]/div[1]/div/div
    ...    timeout=10s
    Element Text Should Contain [Arguments] xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[1]/div[1]/div/div ${3caracterError} ${SMALL_RETRY_COUNT}

one caracter error message description
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[2]/div[1]/li/div
    ...    timeout=10s
    Element Text Should Contain [Arguments] xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[2]/div[1]/li/div ${3caracterError} ${SMALL_RETRY_COUNT}

maximun agent error message
    Element Text Should Contain [Arguments] xpath=/html/body/div[1]/div[2]/div/div/div/div/div/div[3]/div/div/div[1]/div[3]/div[2]/div ${AgentNumberError} ${SMALL_RETRY_COUNT}

Mission name input
    [Arguments]    ${MissionName}
    Wait Until Element Is Visible    xpath=//*[@id="mission_name_input"]    timeout=10s
    Set Text [Arguments] xpath=//*[@id="mission_name_input"] ${MissionName} ${SMALL_RETRY_COUNT}

Mission description input
    [Arguments]    ${description}
    Wait Until Element Is Visible    xpath=//*[@id="desc_txt__update__agent"]    timeout=10s
    Set Text [Arguments] xpath=//*[@id="desc_txt__update__agent"] ${description} ${SMALL_RETRY_COUNT}

Agent number input
    [Arguments]    ${AgentNumber}
    Set Text [Arguments] xpath=//*[@name="agent_number"] ${AgentNumber} ${SMALL_RETRY_COUNT}

Mission type input
    Click Element [Arguments] xpath=//*[@id="select-types"]/div ${MEDIUM_RETRY_COUNT}
    Click Element [Arguments] xpath=//*[@id="react-select-2-option-0"] ${MEDIUM_RETRY_COUNT}

Select company type from listes
    Click Element [Arguments] xpath=/html/body/div[1]/div[2]/div/div/div/div/div/div[3]/div/div/div[1]/div[3]/div[1]/li[2]/div ${SMALL_RETRY_COUNT}
    Click Element [Arguments] xpath=//div[@id='react-select-3-option-0'] ${SMALL_RETRY_COUNT}

Gender checkbox
    Click Element [Arguments] xpath=//*[@test-id="homme"] ${SMALL_RETRY_COUNT}

Level checkbox
    Click Element [Arguments] xpath=//*[@test-id="labels:level1"] ${SMALL_RETRY_COUNT}

Adress input
    Set Text [Arguments] xpath=(//input[@id='react-select-2-input'])[2] chat ${SMALL_RETRY_COUNT}
    Click Element [Arguments] xpath=//div[@id='react-select-2-option-0'] ${MEDIUM_RETRY_COUNT}

Verify description step
    Element Should Be Visible [Arguments] xpath=//*[@id="start_date"] ${SMALL_RETRY_COUNT}

Verify schedule step
    Element Should Be Visible    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[1]/div[1]/div/li

Scroll to bottom
    Press Key    xpath=//body    \ue00f
