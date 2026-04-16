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
    Click Element    xpath=//*[@id="chip_create_mission"]    ${SMALL_RETRY_COUNT}
    
Next button
    Wait Until Element Is Visible    xpath=//*[@id="Groupe_Buttons_Step"]/button[2]    timeout=10s
    Scroll Element Into View    xpath=//*[@id="Groupe_Buttons_Step"]/button[2]
    Sleep    1s
    Execute JavaScript    document.querySelector('button.btn_orange').scrollIntoView({block: 'center'});
    Sleep    500ms
    Execute JavaScript    document.querySelector('button.btn_orange').click();
    Sleep    1s

Empty mission name error message
    Wait Until Page Contains    ${EmptyErrorMsg}    timeout=20s
    Element Text Should Contain    xpath=//*[contains(text(), '${EmptyErrorMsg}')]    ${EmptyErrorMsg}    ${SMALL_RETRY_COUNT}

Empty mission type error message
    Wait Until Page Contains    ${EmptyErrorMsg}    timeout=20s
    Wait Until Element Is Visible    xpath=//li//div[contains(text(), '${EmptyErrorMsg}')]    timeout=20s
    Element Text Should Contain    xpath=//li//div[contains(text(), '${EmptyErrorMsg}')]    ${EmptyErrorMsg}    ${SMALL_RETRY_COUNT}

Empty gender error message
    Wait Until Page Contains    ${EmptyErrorMsg}    timeout=20s
    Wait Until Element Is Visible    xpath=//li//div[contains(text(), '${EmptyErrorMsg}')]    timeout=20s
    Element Text Should Contain    xpath=//li//div[contains(text(), '${EmptyErrorMsg}')]    ${EmptyErrorMsg}    ${SMALL_RETRY_COUNT}

Empty level error message
    Wait Until Page Contains    ${EmptyErrorMsg}    timeout=20s
    Wait Until Element Is Visible    xpath=//li//div[contains(text(), '${EmptyErrorMsg}')]    timeout=20s
    Element Text Should Contain    xpath=//li//div[contains(text(), '${EmptyErrorMsg}')]    ${EmptyErrorMsg}    ${SMALL_RETRY_COUNT}

Empty adress error message
    Wait Until Page Contains    ${EmptyErrorMsg}    timeout=20s
    Wait Until Element Is Visible    xpath=//div[contains(text(), '${EmptyErrorMsg}')]    timeout=20s
    Element Text Should Contain    xpath=//div[contains(text(), '${EmptyErrorMsg}')]    ${EmptyErrorMsg}    ${SMALL_RETRY_COUNT}

One caracter error message name
    Wait Until Page Contains    ${3caracterError}    timeout=20s
    Wait Until Element Is Visible    xpath=//div[contains(text(), '${3caracterError}')]    timeout=20s
    Element Text Should Contain    xpath=//div[contains(text(), '${3caracterError}')]    ${3caracterError}    ${SMALL_RETRY_COUNT}

One caracter error message description
    Wait Until Page Contains    ${3caracterError}    timeout=20s
    Wait Until Element Is Visible    xpath=//li//div[contains(text(), '${3caracterError}')]    timeout=20s
    Element Text Should Contain    xpath=//li//div[contains(text(), '${3caracterError}')]    ${3caracterError}    ${SMALL_RETRY_COUNT}

Maximum agent error message
    Wait Until Page Contains    ${AgentNumberError}    timeout=20s
    Wait Until Element Is Visible    xpath=//div[contains(text(), '${AgentNumberError}')]    timeout=20s
    Element Text Should Contain    xpath=//div[contains(text(), '${AgentNumberError}')]    ${AgentNumberError}    ${SMALL_RETRY_COUNT}

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
    Wait Until Element Is Visible    xpath=//*[@name="agent_number"]    timeout=10s
    Input Text    xpath=//*[@name="agent_number"]    ${AgentNumber}

Mission type input
    [Arguments]    ${MissionType}=Type 1
    Capture Page Screenshot    before_mission_type.png
    
    # Attendre que l'input existe
    Wait Until Page Contains Element    xpath=//input[@id='react-select-2-input']    timeout=10s
    Sleep    2s
    
    # Cliquer sur le container
    Click Element    xpath=//div[@id='select-types']
    Sleep    2s
    
    # Attendre et cliquer sur l'option
    Wait Until Element Is Visible    xpath=//div[@id='react-select-2-option-0']    timeout=5s
    Click Element    xpath=//div[@id='react-select-2-option-0']
    Sleep    1s
    
    Capture Page Screenshot    after_mission_type.png

Select company type from listes
    [Arguments]    ${CompanyType}=Type 1
    Capture Page Screenshot    before_company_type.png
    
    Wait Until Page Contains Element    xpath=//div[@id='select-types']    timeout=10s
    Sleep    2s
    
    # Cliquer sur le container (IMPORTANT)
    Click Element    xpath=(//div[contains(@class,'css-b62m3t-container')])[2]
    Sleep    2s
    
    Wait Until Element Is Visible    xpath=//div[@id='react-select-3-option-0']    timeout=5s
    Click Element    xpath=//div[@id='react-select-3-option-0']
    
    Capture Page Screenshot    after_company_type.png

Gender checkbox
    Capture Page Screenshot    before_gender.png
    ${element_found}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//*[@test-id="homme"]    timeout=5s
    Run Keyword If    ${element_found}    Click Element    xpath=//*[@test-id="homme"]
    Run Keyword Unless    ${element_found}    Log    Gender checkbox not found
    Sleep    500ms

Level checkbox
    Capture Page Screenshot    before_level.png
    ${element_found}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//*[@test-id="labels:level1"]    timeout=5s
    Run Keyword If    ${element_found}    Click Element    xpath=//*[@test-id="labels:level1"]
    Run Keyword Unless    ${element_found}    Log    Level checkbox not found
    Sleep    500ms

Address input
    [Arguments]    ${Address}=chat
    Capture Page Screenshot    before_address.png
    ${element_found}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=(//input[@id='react-select-2-input'])[2]    timeout=5s
    Run Keyword If    ${element_found}    Input Text    xpath=(//input[@id='react-select-2-input'])[2]    ${Address}
    Run Keyword If    ${element_found}    Click Element    xpath=//div[@id='react-select-2-option-0']
    Run Keyword Unless    ${element_found}    Log    Address input not found
    Sleep    500ms

Verify description step
    Wait Until Page Contains Element    xpath=//*[@id="info_ctn"]    timeout=15s
    Scroll Element Into View            xpath=//*[@id="info_ctn"]
    Wait Until Element Is Visible       xpath=//*[@id="info_ctn"]    timeout=10s

Verify schedule step
    Element Should Be Visible    xpath=//*[@id="root"]/div[2]/div/div/div/div/div/div[3]/div/div/div[1]/div[1]/div/li

Scroll to bottom
    Press Key    xpath=//body    En