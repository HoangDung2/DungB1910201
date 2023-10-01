*** Settings ***
Resource    login_actions.robot
*** Keywords ***
User input Username And Password
    [Arguments]   ${username}    ${password}
    Input Username    ${username}
    login_actions.Input Password    ${password}
Verify Username and Password Is Invaid
    [Arguments]     ${username}     ${password}
    Verify That from Fill In Username And password Are Displayed
    Should Contain    ${locatorUsername}    ${username}
    Should Contain    ${locatorPassword}    ${password}
Verify That from Fill In Username And password Are Displayed
    Wait Until Element Is Visible    ${locatorUsername}
    Wait Until Element Is Visible    ${locatorPassword}
Submit Button
    Click Button Submit
Verify Failed Login Message
    Wait Until Element Is Visible    ${contentMessFail}
    Should Contain    ${contentMessFail}    ${infoMessFail}
Capture and Save Screenshot
    Capture Page Screenshot
