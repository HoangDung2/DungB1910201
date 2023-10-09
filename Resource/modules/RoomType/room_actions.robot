*** Settings ***
Resource    ../../../Resource/commons/init.resource
*** Keywords ***
Click Choose Box Have Text
    [Arguments]     ${string}
    ${temp}=   Choose Range type  ${string}
    Wait Until Element Is Visible   ${temp}
    Click Element    ${temp}
Click Choose Room With The Number Of People
    [Arguments]     ${number}
    ${temp}=    Choose Number    ${number}
    Wait Until Element Is Visible   ${temp}
    Click Element    ${temp}
