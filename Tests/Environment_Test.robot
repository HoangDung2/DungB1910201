*** Settings ***
Variables        ../Drivers/chrome.yml
#Variables        ../Drivers/firefox.yml
Resource        ../Resource/commons/common_keyword_resource.robot
*** Keywords ***
User Open Browser And Go To Website
	Open Chrome Browser And Go To Login Page   ${NAME_PAGE}
Set Enviroment From Settings
    :FOR   ${key}   IN   @{ENVIRONMENT.${ENV}.keys()}
    \    ${value} =    Get From Dictionary     ${ENVIRONMENT.${ENV}}    ${key}
    \    Set Global Variable    ${${key}}    ${value}
Check System Environment And Get URL Of Login Page
    [Documentation]  Check system environment on ${ENV} parameter has exist on settings.yaml or not
    ...    If it exists then returns corresponding URL with the environment,
    ...    otherwise inform that `Environment Does Not Exist`.
    [Arguments]  ${page}
    :FOR   ${key}   IN   @{ENVIRONMENT.keys()}
    \    ${status} =    Run Keyword And Return Status    Should Be Equal   ${key}    ${ENV}
    \    ${url} =    Run Keyword If  ${status}    Get From Dictionary     ${ENVIRONMENT.${ENV}}    ${page}
    \    Exit For Loop If     ${status}
    Run Keyword Unless    ${status}    Fail    ${ENV} Environment Does Not Exist.
    Set Enviroment From Settings
    [Return]   ${url}
Open Browser And Go To Website
    [Documentation]  Check ${BROWSER} value for the system before running.
    ...   and check system environment on ${ENV} parameter (Parameters of PCB_WADM Job on Jenkin).
    ...   and get corresponding URL with the environment.
    [Arguments]    ${page}
    ${chrome_status} =    Run Keyword And Return Status
    ...    Should Be Equal As Strings   ${BROWSER}    Chrome    ignore_case=True
    ${firefox_status} =    Run Keyword And Return Status
    ...    Should Be Equal As Strings   ${BROWSER}    Firefox    ignore_case=True
    ${ie_status} =    Run Keyword And Return Status
    ...    Should Be Equal As Strings   ${BROWSER}    IE    ignore_case=True

    ${url}=    Check System Environment And Get URL Of Login Page    ${page}
    Run Keyword If   ${chrome_status}     Open Chrome Browser And Go To Login Page     ${url}
    ...   ELSE IF    ${firefox_status}    Open Firefox Browser And Go To Login Page    ${url}
    ...   ELSE IF    ${ie_status}         Open IE Browser And Go To Login Page        ${url}
    ...   ELSE       Fail    ERROR! Unidentified browser:  ${BROWSER}
Open Chrome Browser And Go To Login Page
    [Documentation]     Open Chrome Browser and go to login page
    [Arguments]  ${web_url}
    ${system}=    Evaluate    platform.system()    platform
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Run Keyword If  '${system}'=='Linux'    Run Keywords
    ...         Call Method    ${chrome_options}   add_argument    test-type
    ...    AND  Call Method    ${chrome_options}   add_argument    ignore-certificate-errors
    ...    AND  Call Method    ${chrome_options}   add_argument    --disable-extensions
    ...    AND  Call Method    ${chrome_options}   add_argument    --disable-gpu
    ...    AND  Call Method    ${chrome_options}   add_argument    --no-sandbox
    ...    AND  Call Method    ${chrome_options}   add_argument    --headless
    ...    AND  Call Method    ${chrome_options}   add_argument    --window-size\=1920,1080
    ${driver_path}=     Run Keyword If  '${system}'=='Linux'    Set Variable   ${CHROME_DRIVER_PATH_UNIX}
    ...     ELSE    Set Variable    ${EXECDIR}/${CHROME_DRIVER_PATH_WINS}
    ${kwargs}=  BuiltIn.Create Dictionary  executable_path=${driver_path}
    Create Webdriver    Chrome    chrome_options=${chrome_options}    executable_path=${driver_path}
    Run Keyword If  '${system}'=='Windows'  Maximize Browser Window
    Go To   ${web_url}

Open Firefox Browser And Go To Login Page
    [Documentation]     Open Firefox Browser and go to login page
    [Arguments]  ${web_url}
    ${system}=    Evaluate    platform.system()    platform
    ${firefox_options}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys, selenium.webdriver
    Run Keyword If  '${system}'=='Linux'    Run Keywords
    ...   Call Method    ${firefox_options}   add_argument    --headless
    ${driver_path}=     Run Keyword If  '${system}'=='Linux'    Set Variable   ${FIREFOX_DRIVER_PATH_UNIX}
    ...     ELSE    Set Variable    ${FIREFOX_DRIVER_PATH_WINS}
    ${kwargs}=  BuiltIn.Create Dictionary  executable_path=${driver_path}
    ${firefox_option}  Set Variable    ${firefox_options}
    Create Webdriver    Firefox    firefox_binary=${firefox_options}    executable_path=${driver_path}
    Run Keyword If  '${system}'=='Windows'  Maximize Browser Window
    Go To   ${web_url}