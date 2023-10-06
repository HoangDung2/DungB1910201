*** Settings ***
Resource    login_actions.robot
Resource    ../../../Resource/commons/init.resource
*** Keywords ***
User input Username And Password
    [Arguments]   ${username}    ${password}
    Input Username    ${username}
    login_actions.Input Password    ${password}
Verify Username and Password Is Invaid
    [Arguments]     ${username}     ${password}
    Verify That from Fill In Username And Password Are Displayed
    ${text_user}=   Get Value    ${locatorUsername}
    ${text_password}=   Get Value    ${locatorPassword}
    Should Contain    ${text_user}    ${username}
    Should Contain    ${text_password}    ${password}
Verify That from Fill In Username And Password Are Displayed
    Wait Until Element Is Visible    ${locatorUsername}
    Wait Until Element Is Visible    ${locatorPassword}
Verify Failed Login Message
    [Arguments]     ${locator}      ${mess}
    Wait Until Element Is Visible    ${locator}
    ${text}=    Get Text    ${locator}
    Should Contain   ${text}  ${mess}
Capture and Save Screenshot
    Capture Page Screenshot
Verify Home Page Shoulde Be Displayed
    Verify Menu Home Icon
    Verify Dashboard Home Page
    Verify Slogan And Logo Home Page