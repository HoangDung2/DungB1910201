*** Settings ***
Resource    ../../../Resource/commons/init.resource
Resource    login_locators.robot
*** Keywords ***
Input Username
    [Arguments]   ${username}
    Wait Until Element Is Visible   ${locatorUsername}
    Input Text    ${locatorUsername}    ${username}
Input Password
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${locatorPassword}
    Input Text    ${locatorPassword}    ${password}
Click Button Submit
    Wait Until Element Is Visible    ${btnSumit}
    Click Element   ${btnSumit}