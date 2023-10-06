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
    [Arguments]  ${locator}
    Wait Until Element Is Visible    ${locator}
    Click Element   ${locator}
Wait Notification Shoulde Be Displayed
    Sleep  1