*** Settings ***
Resource    ../config/EnvDetails.robot
Resource    ../config/BrowserDetails.robot
Resource    ../config/SeleniumConfigs.robot
Library     SeleniumLibrary
Library     String
Library     OperatingSystem


*** Variables ***
${cookies_btn}      id:rcc-confirm-button


*** Keywords ***
Open Browser Page
    [Documentation]
    ...    Open the browser and navigates to the login page    ...

    Open Browser    ${TEST_ENV_URL}    ${BROWSER}    options=${TEST_BROWSER_OPTIONS}
    Execute Javascript    window.localStorage.setItem('disable-recaptcha-daxme-test', 'true');
    Set Selenium Speed     ${TEST_SELENIUM_SPEED}
    Maximize Browser Window
    Set Selenium Timeout    ${SELENIUM_TIMEOUT}
    Set Log Level    DEBUG
    Click Element [Arguments] ${cookies_btn} ${SMALL_RETRY_COUNT}

Logout From The Application
    [Documentation]
    ...    Logout from the application    ...

    ${randomText}    Generate Random String    8    [LETTERS]
    RETURN    ${randomText}

Get Random Text
    [Documentation]
    ...    Return random text value    ...

    ${randomText}    Generate Random String    8    [LETTERS]
    RETURN    ${randomText}

Get Current Epoch Time
    [Documentation]
    ...    Return current epoch time    ...

    ${randomText}    Get Time    epoch
    RETURN    ${randomText}

Element Should Be Contained In The Page [Arguments] ${locator} ${retryScale}
    [Documentation]
    ...    Verify that the element should be contained in the page    ...

    Wait Until Keyword Succeeds    ${retryScale}    ${RETRY_DELAY}    Wait Until Page Contains Element    ${locator}

Element Should Not Be Contained In The Page [Arguments] ${locator} ${retryScale}
    [Documentation]
    ...    Verify that the element should not be contained in the page    ...

    Wait Until Keyword Succeeds
    ...    ${retryScale}
    ...    ${RETRY_DELAY}
    ...    Wait Until Page Does Not Contain Element
    ...    ${locator}

Element Should Be Visible [Arguments] ${locator} ${retryScale}
    [Documentation]
    ...    Verify that the element should be visible    ...

    Wait Until Keyword Succeeds    ${retryScale}    ${RETRY_DELAY}    Wait Until Element Is Visible    ${locator}

Element Should Not Be Visible [Arguments] ${locator} ${retryScale}
    [Documentation]
    ...    Verify that the element should not be visible    ...

    Wait Until Keyword Succeeds    ${retryScale}    ${RETRY_DELAY}    Wait Until Element Is Not Visible    ${locator}

Click Element [Arguments] ${locator} ${retryScale}
    [Documentation]
    ...    Click on a given button    ...

    Wait Until Keyword Succeeds    ${retryScale}    ${RETRY_DELAY}    Wait Until Element Is Enabled    ${locator}
    Wait Until Keyword Succeeds    ${retryScale}    ${RETRY_DELAY}    Click Element    ${locator}

Click Element By JavaScript Executor [Arguments] ${elementXpathLocator} ${retryScale}
    [Documentation]
    ...    Click an element by xpath using javascript executor    ...

    Wait Until Keyword Succeeds
    ...    ${retryScale}
    ...    ${RETRY_DELAY}
    ...    Wait Until Element Is Enabled
    ...    ${elementXpathLocator}
    ${elementXpathLocator}    Remove String    ${elementXpathLocator}    xpath=
    Execute JavaScript
    ...    document.evaluate("${elementXpathLocator}", document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();

Element Text Should Be [Arguments] ${locator} ${text} ${retryScale}
    [Documentation]
    ...    Validate the text of an element    ...

    Wait Until Keyword Succeeds    ${retryScale}    ${RETRY_DELAY}    Wait Until Element Is Visible    ${locator}
    Wait Until Keyword Succeeds    ${retryScale}    ${RETRY_DELAY}    Element Text Should Be    ${locator}    ${text}

Element Text Should Contain [Arguments] ${locator} ${text} ${retryScale}
    [Documentation]
    ...    Validate the text of an element    ...

    Wait Until Keyword Succeeds    ${retryScale}    ${RETRY_DELAY}    Wait Until Element Is Visible    ${locator}
    Wait Until Keyword Succeeds    ${retryScale}    ${RETRY_DELAY}    Element Should Contain    ${locator}    ${text}

Set Text [Arguments] ${textBoxLocator} ${text} ${retryScale}
    [Documentation]
    ...    Input text into a text box    ...

    Wait Until Keyword Succeeds
    ...    ${retryScale}
    ...    ${RETRY_DELAY}
    ...    Wait Until Element Is Enabled
    ...    ${textBoxLocator}
    Wait Until Keyword Succeeds    ${retryScale}    ${RETRY_DELAY}    Input Text    ${textBoxLocator}    ${text}

Scroll To The Top Of The Page
    [Documentation]
    ...    Scroll to the top of the page

    Execute JavaScript    window.scrollTo(0, 0)

Scroll To The Bottom Of The Page
    [Documentation]
    ...    Scroll to the bottom of the page

    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

Check Page URL    [Arguments]    ${expectedPageUrl}
    ${current_url}    Get Location
    Should Contain    ${expectedPageUrl}    ${current_url}

Button Cookies
    Click Element [Arguments] id:rcc-confirm-button ${SMALL_RETRY_COUNT}
