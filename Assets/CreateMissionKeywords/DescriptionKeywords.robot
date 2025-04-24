*** Settings ***
Library     SeleniumLibrary


*** Keywords ***
Create mission button
    Wait Until Element Is Visible    xpath=//*[@id="chip_create_mission"]    timeout=10s
    Click Element    xpath=//*[@id="chip_create_mission"]

Next button
    Click Element    xpath=//*[@id="Groupe_Buttons_Step"]/button[2]

Empty mission name error message
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[1]/div[1]/div/div    timeout=10s
    Element Should Contain
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[1]/div[1]/div/div
    ...    Ce champ est obligatoire

Empty mission type error message
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[1]/div[2]/div[1]/li[3]/div
    ...    timeout=10s
    Element Should Contain
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[1]/div[2]/div[1]/li[3]/div
    ...    Ce champ est obligatoire

Empty gender error message
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[1]/div[3]/div/li[2]/div
    ...    timeout=10s
    Element Should Contain
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[1]/div[4]/div/li[2]/div
    ...    Ce champ est obligatoire

Empty level error message
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[1]/div[5]/div/li[2]/div
    ...    timeout=10s
    Element Should Contain
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[1]/div[5]/div/li[2]/div
    ...    Ce champ est obligatoire

Empty adress error message
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[2]/div[2]/li[2]/div/div[2]
    ...    timeout=10s
    Element Should Contain
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[2]/div[2]/li[2]/div/div[2]
    ...    Ce champ est obligatoire

one caracter error message name
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[1]/div[1]/div/div
    ...    timeout=10s
    Element Should Contain
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[1]/div[1]/div/div
    ...    Ce champ doit contenir au moins 3 caractères

one caracter error message description
    Wait Until Element Is Visible
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[2]/div[1]/li/div
    ...    timeout=10s
    Element Should Contain
    ...    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[2]/div[1]/li/div
    ...    Ce champ doit contenir au moins 3 caractères

maximun agent error message
    Wait Until Element Is Visible
    ...    xpath=//*[@data-test-id="doit être un nombre positif inférieur à 124"]
    ...    timeout=10s
    Element Should Contain
    ...    xpath=//*[@data-test-id="doit être un nombre positif inférieur à 124"]
    ...    doit être un nombre positif inférieur à 124

Mission name input
    [Arguments]    ${MissionName}
    Wait Until Element Is Visible    xpath=//*[@id="mission_name_input"]    timeout=10s
    Input Text    xpath=//*[@id="mission_name_input"]    ${MissionName}

Mission description input
    [Arguments]    ${description}
    Wait Until Element Is Visible    xpath=//*[@id="desc_txt__update__agent"]    timeout=10s
    Input Text    xpath=//*[@id="desc_txt__update__agent"]    ${description}

Agent number input
    [Arguments]    ${AgentNumber}
    Wait Until Element Is Visible    xpath=//*[@id="agent_number_input"]    timeout=10s
    Input Text    xpath=//*[@id="agent_number_input"]    ${AgentNumber}

Mission type input
    Click Element    xpath=//*[@id="select-types"]/div
    Click Element    xpath=//div[@id='react-select-2-option-0']

Select company type from liste
    Click Element    xpath=//*[@id="react-select-3-placeholder"]
    Click Element    xpath=//*[@id="react-select-3-input-option-1"]

Gender checkbox
    Click Element    xpath=//*[@test-id="homme"]

Level checkbox
    Click Element    xpath=//*[@test-id="Level 1"]

Adress input
    Input Text    xpath=(//input[@id='react-select-2-input'])[2]    chat
    Wait Until Element Is Visible    xpath=//div[@id='react-select-2-option-0']    timeout=10s
    Click Element    xpath=//div[@id='react-select-2-option-0']
    sleep    2s

Verify description step
    Element Should Be Visible    xpath=//*[@id="start_date"]

Verify schedule step
    Element Should Be Visible    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[1]/div[1]/div/li

Scroll to bottom
    Press Key    xpath=//body    \ue00f
