*** Settings ***
Resource    ../../../Resource/commons/init.resource
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
    [Arguments]  ${locator}
    Wait Until Element Is Visible    ${locator}
    Click Element   ${locator}
