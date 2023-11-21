*** Settings ***
Resource    ../../../Resource/commons/init.resource
*** Keywords ***
Input PassWord Wanna Change
    [Arguments]  ${pwd_old}  ${pwd_new}  ${pwd_confirm}
    Wait Until Element Is Visible   ${lct_pwd_old}
    Input Text    ${lct_pwd_old}     ${pwd_old}
    Wait Until Element Is Visible   ${lct_pwd_new}
    Input Text    ${lct_pwd_new}    ${pwd_new}
    Wait Until Element Is Visible   ${lct_pwd_confirm}
    Input Text    ${lct_pwd_confirm}    ${pwd_confirm}

Navigate To The Password Change Page
    Wait Until Element Is Visible  ${lct_pwd_change}
    Click Element    ${lct_pwd_change}

Check Password Have Filled
    [Arguments]  ${pwd_old}  ${pwd_new}  ${pwd_confirm}
    ${get_value_old}=   Get Value  ${lct_pwd_old}
    ${get_value_new}=   Get Value  ${lct_pwd_new}
    ${get_value_confirm}=   Get Value  ${lct_pwd_confirm}
    Should Be Equal As Strings    ${pwd_old}    ${get_value_old}
    Should Be Equal As Strings    ${pwd_new}    ${get_value_new}
    Should Be Equal As Strings    ${pwd_confirm}    ${get_value_confirm}

Submit Confirm
    Wait Until Element Is Visible    ${btSubmit}
    Click Element    ${btSubmit}

Verify Error Message Should Be Displayed
    [Arguments]   ${message}
    Compare Text    ${locatorSuccess}   ${mess_Tiltepwd}
    Compare Text    ${locatorSuccess_1}     ${message}

Verify Successfully Message Should Be Displayed
    [Arguments]   ${message}
    Compare Text    ${locatorSuccess}   ${mess_Tiltepwd_success}
    Compare Text    ${locatorSuccess_1}     ${message}

Vefiry Password Change Page Should Be Displayed
    Element Should Be Visible   ${lct_pwd_old}
    Element Should Be Visible   ${lct_pwd_new}
    Element Should Be Visible   ${lct_pwd_confirm}