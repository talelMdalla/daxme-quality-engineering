*** Settings ***
Documentation       Test cases for create mission functionality.

Library             Collections
Library             SeleniumLibrary
Resource            ../../Assets/keywords.robot
Resource            ../../Assets/PlannningKeywords/WorkingDaysKeywords.robot


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

@{days}                         Lundi    Mardi    Mercredi    Jeudi    Vendredi    Samedi    Dimanche
@{xpaths}                       xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[1]/div[3]
...                             xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[2]/div[3]
...                             xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[3]/div[3]
...                             xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[4]/div[3]
...                             xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[1]/div[3]
...                             xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[3]
...                             xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[3]/div[3]

@{xpathsErrorMsg30min}          xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[1]/div[2]/div[2]/div[2]
...                             xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[2]/div[2]/div[2]/div[2]
...                             xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[3]/div[2]/div[2]/div[2]
...                             xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[1]/div[4]/div[2]/div[2]/div[2]
...                             xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[1]/div[2]/div[2]/div[2]
...                             xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[2]/div[2]
...                             xpath://*[@id="root"]/div[2]/div/div[3]/div[1]/div[2]/div[3]/div[2]/div[2]/div[2]


*** Keywords ***
Verify Empty Field Errors For All Fields
    ${fields} =    Create List
    ...    ${LundiXpath}
    ...    ${MardiXpath}
    ...    ${MercrediXpath}
    ...    ${JeudiXpath}
    ...    ${VendrediXpath}
    ...    ${SamediXpath}
    ...    ${DimancheXpath}
    FOR    ${field}    IN    @{fields}
        Wait Until Element Is Visible    ${field}
        Element Text Should Be    ${field}    Ce champ est obligatoire
    END

Validate Errors for start time grater than end time
    ${days_length} =    Get Length    ${days}
    FOR    ${index}    IN RANGE    0    ${days_length}
        ${day} =    Get From List    ${days}    ${index}
        ${xpath} =    Get From List    ${xpaths}    ${index}
        Log    Validating error for ${day}
        Wait Until Element Is Visible    ${xpath}
        Element Should Contain
        ...    ${xpath}
        ...    L'heure de fin ne peut pas être antérieure à l'heure de début. Veuillez indiquer vos disponibilités au-delà de 23h59 dans le jour suivant.
    END

Validate Errors under 30min
    ${days_length} =    Get Length    ${days}
    FOR    ${index}    IN RANGE    0    ${days_length}
        ${day} =    Get From List    ${days}    ${index}
        ${xpath} =    Get From List    ${xpathsErrorMsg30min}    ${index}
        Log    Validating error for ${day}
        Wait Until Element Is Visible    ${xpath}
        Element Should Contain
        ...    ${xpath}
        ...    La durée d'un interval doit être supérieure ou égale à une heure.
    END
