*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${URL}                          https://dev.daxme.fr/
${BROWSER}                      Chrome
${expectedLandingPageUrl}       [https://dev.daxme.fr/landingpage,https://dev.daxme.fr/dashboard]
${DELAY_IN_SECONDS}             1

${LundiXpath}                   xpath=//*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]
${MardiXpath}                   xpath=//*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[2]/div[2]/div[1]/div[2]
${MercrediXpath}                xpath=//*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[3]/div[2]/div[1]/div[2]
${JeudiXpath}                   xpath=//*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[4]/div[2]/div[1]/div[2]
${VendrediXpath}                xpath=//*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[1]/div[2]/div[1]/div[2]
${SamediXpath}                  xpath=//*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[1]/div[2]
${DimancheXpath}                xpath=//*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[3]/div[2]/div[1]/div[2]


*** Keywords ***
PlanningButton
    Click Element    xpath://*[@data-test-id="link-myCalendar-navbar"]

EnterMyAvailabilityButton
    Click Element    xpath://*[@id="root"]/div[2]/div/div/div/div[1]/button

LundiButton
    Click Element    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[1]/div/div/span/span[1]

MardiButton
    Click Element    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[2]/div/div/span/span[1]

MercrediButton
    Click Element    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[3]/div/div/span/span[1]

JeudiButton
    Click Element    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[4]/div/div/span/span[1]

VendrediButton
    Click Element    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[1]/div/div/span/span[1]

SamediButton
    Click Element    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div/div/span/span[1]

DimancheButton
    Click Element    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[3]/div/div/span/span[1]

ValidateButton
    Click Button    xpath://*[@id="root"]/div[2]/div/div[3]/div[2]/button[2]

Empty filed error message
    Wait Until Element Is Visible    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]
    Element Should Contain
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]
    ...    Ce champ est obligatoire

Lundi start time input
    [Arguments]    ${LundiStartTime}
    Input Text
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[1]/div[2]/div[1]/div/div/input
    ...    ${LundiStartTime}

Lundi end time input
    [Arguments]    ${LundiEndTime}
    Input Text
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[1]/div[2]/div[2]/div/div/input
    ...    ${LundiEndTime}

Mardi start time input
    [Arguments]    ${MardiStartTime}
    Input Text
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[2]/div[2]/div[1]/div/div/input
    ...    ${MardiStartTime}

Mardi end time input
    [Arguments]    ${MardiEndTime}
    Input Text
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[2]/div[2]/div[2]/div/div/input
    ...    ${MardiEndTime}

Mercredi start time input
    [Arguments]    ${MercrediStartTime}
    Input Text
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[3]/div[2]/div[1]/div/div/input
    ...    ${MercrediStartTime}

Mercredi end time input
    [Arguments]    ${MercrediEndTime}
    Input Text
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[3]/div[2]/div[2]/div/div/input
    ...    ${MercrediEndTime}

Jeudi start time input
    [Arguments]    ${JeudiStartTime}
    Input Text
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[4]/div[2]/div[1]/div/div/input
    ...    ${JeudiStartTime}

Jeudi end time input
    [Arguments]    ${JeudiEndTime}
    Input Text
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[4]/div[2]/div[2]/div/div/input
    ...    ${JeudiEndTime}

Vendredi start time input
    [Arguments]    ${VendrediStartTime}
    Input Text
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[1]/div[2]/div[1]/div/div/input
    ...    ${VendrediStartTime}

Vendredi end time input
    [Arguments]    ${VendrediEndTime}
    Input Text
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[1]/div[2]/div[2]/div/div/input
    ...    ${VendrediEndTime}

Samedi start time input
    [Arguments]    ${SamediStartTime}
    Input Text
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[1]/div/div/input
    ...    ${SamediStartTime}

Samedi end time input
    [Arguments]    ${SamediEndTime}
    Input Text
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[2]/div/div/input
    ...    ${SamediEndTime}

Dimanche start time input
    [Arguments]    ${DimancheStartTime}
    Input Text
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[3]/div[2]/div[1]/div/div/input
    ...    ${DimancheStartTime}

Dimanche end time input
    [Arguments]    ${DimancheEndTime}
    Input Text
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[3]/div[2]/div[2]/div/div/input
    ...    ${DimancheEndTime}

Lundi Error start time grater than end date
    Wait Until Element Is Visible    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[1]/div[3]
    Element Should Contain
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[1]/div[3]
    ...    L'heure de fin ne peut pas être antérieure à l'heure de début. Veuillez indiquer vos disponibilités au-delà de 23h59 dans le jour suivant.

Mardi Error start time grater than end date
    Wait Until Element Is Visible    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[2]/div[3]
    Element Should Contain
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[2]/div[3]
    ...    L'heure de fin ne peut pas être antérieure à l'heure de début. Veuillez indiquer vos disponibilités au-delà de 23h59 dans le jour suivant.

Mercredi Error start time grater than end date
    Wait Until Element Is Visible    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[3]/div[3]
    Element Should Contain
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[3]/div[3]
    ...    L'heure de fin ne peut pas être antérieure à l'heure de début. Veuillez indiquer vos disponibilités au-delà de 23h59 dans le jour suivant.

Jeudi Error start time grater than end date
    Wait Until Element Is Visible    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[4]/div[3]
    Element Should Contain
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[4]/div[3]
    ...    L'heure de fin ne peut pas être antérieure à l'heure de début. Veuillez indiquer vos disponibilités au-delà de 23h59 dans le jour suivant.

Vendredi Error start time grater than end date
    Wait Until Element Is Visible    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[1]/div[3]
    Element Should Contain
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[1]/div[3]
    ...    L'heure de fin ne peut pas être antérieure à l'heure de début. Veuillez indiquer vos disponibilités au-delà de 23h59 dans le jour suivant.

Samedi Error start time grater than end date
    Wait Until Element Is Visible    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[3]
    Element Should Contain
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[3]
    ...    L'heure de fin ne peut pas être antérieure à l'heure de début. Veuillez indiquer vos disponibilités au-delà de 23h59 dans le jour suivant.

Dimanche Error start time grater than end date
    Wait Until Element Is Visible    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[3]/div[3]
    Element Should Contain
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[3]/div[3]
    ...    L'heure de fin ne peut pas être antérieure à l'heure de début. Veuillez indiquer vos disponibilités au-delà de 23h59 dans le jour suivant.

Add time slots button for monday
    Click Element    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[1]/div[1]/button

Add time slots button for Tuesday
    Click Element    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[2]/div/button

Add time slots button for Wednesday
    Click Element    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[3]/div[1]/button

Add time slots button for Thursday
    Click Element    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[4]/div[1]/button

Add time slots button for Friday
    Click Element    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[1]/div[1]/button

Add time slots button for Saturday
    Click Element    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[1]/button

Add time slots button for Sunday
    Click Element    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[3]/div[1]/button

Seconde Lundi start time
    [Arguments]    ${LundiStartTimeSeconde}
    Input Text
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[1]/div[3]/div[1]/div/div/input
    ...    ${LundiStartTimeSeconde}

Seconde Lundi end time
    [Arguments]    ${LundiEndTimeSeconde}
    Input Text
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[1]/div[3]/div[2]/div/div/input
    ...    ${LundiEndTimeSeconde}

Seconde Mardi start time
    [Arguments]    ${MardiStartTimeSeconde}
    Input Text
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[2]/div[3]/div[1]/div/div/input
    ...    ${MardiStartTimeSeconde}

Seconde Mardi end time
    [Arguments]    ${MardiEndTimeSeconde}
    Input Text
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[2]/div[3]/div[2]/div/div/input
    ...    ${MardiEndTimeSeconde}

Seconde Mercredi start time
    [Arguments]    ${MercrediStartTimeSeconde}
    Input Text
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[3]/div[3]/div[1]/div/div/input
    ...    ${MercrediStartTimeSeconde}

Seconde Mercredi end time
    [Arguments]    ${MercrediEndTimeSeconde}
    Input Text
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[3]/div[3]/div[2]/div/div/input
    ...    ${MercrediEndTimeSeconde}

Seconde Jeudi start time
    [Arguments]    ${JeudiStartTimeSeconde}
    Input Text
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[4]/div[3]/div[1]/div/div/input
    ...    ${JeudiStartTimeSeconde}

Seconde Jeudi end time
    [Arguments]    ${JeudiEndTimeSeconde}
    Input Text
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[4]/div[3]/div[2]/div/div/input
    ...    ${JeudiEndTimeSeconde}

Seconde Vendredi start time
    [Arguments]    ${VendrediStartTimeSeconde}
    Input Text
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[1]/div[3]/div[1]/div/div/input
    ...    ${VendrediStartTimeSeconde}

Seconde Vendredi end time
    [Arguments]    ${VendrediEndTimeSeconde}
    Input Text
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[1]/div[3]/div[2]/div/div/input
    ...    ${VendrediEndTimeSeconde}

Seconde Samedi start time
    [Arguments]    ${SamediStartTimeSeconde}
    Input Text
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[3]/div[1]/div/div/input
    ...    ${SamediStartTimeSeconde}

Seconde Samedi end time
    [Arguments]    ${SamediEndTimeSeconde}
    Input Text
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[3]/div[2]/div/div/input
    ...    ${SamediEndTimeSeconde}

Seconde Dimanche start time
    [Arguments]    ${DimancheStartTimeSeconde}
    Input Text
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[3]/div[3]/div[1]/div/div/input
    ...    ${DimancheStartTimeSeconde}

Seconde Dimanche end time
    [Arguments]    ${DimancheEndTimeSeconde}
    Input Text
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[3]/div[3]/div[2]/div/div/input
    ...    ${DimancheEndTimeSeconde}

Scroll to bottom
    Press Key    xpath=//body    \ue00f

Overlap error message
    Wait Until Element Is Visible    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[1]/div[4]
    Element Should Contain
    ...    xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[1]/div[4]
    ...    Les plages horaires ne doivent pas se chevaucher.

less thant 1h error message
    Wait Until Element Is Visible
    ...    xpath://*[@data-test-id="La durée d'un interval doit être supérieure ou égale à une heure."]
    Element Should Contain
    ...    xpath://*[@data-test-id="La durée d'un interval doit être supérieure ou égale à une heure."]
    ...    La durée d'un interval doit être supérieure ou égale à une heure.

Invalid Time Range Error
    Wait Until Element Is Visible
    ...    xpath://*[@data-test-id="L'heure de fin ne peut pas être antérieure à l'heure de début. Veuillez indiquer vos disponibilités au-delà de 23h59 dans le jour suivant."]
    Element Should Contain
    ...    xpath://*[@data-test-id="L'heure de fin ne peut pas être antérieure à l'heure de début. Veuillez indiquer vos disponibilités au-delà de 23h59 dans le jour suivant."]
    ...    L'heure de fin ne peut pas être antérieure à l'heure de début. Veuillez indiquer vos disponibilités au-delà de 23h59 dans le jour suivant.

Success message
    Wait Until Element Is Visible
    ...    xpath://*[@data-test-id="Planning modifié avec succès"]
    Element Should Contain
    ...    xpath://*[@data-test-id="Planning modifié avec succès"]
    ...    Planning modifié avec succès
