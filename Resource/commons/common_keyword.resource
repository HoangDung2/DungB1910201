*** Settings ***
Resource    ../../Resource/commons/init.resource
*** Keywords ***
Student Login Into Dormitory System
    [Arguments]     ${username}     ${password}
    Verify That from Fill In Username And password Are Displayed
    User input Username And Password    ${username}     ${password}
    Click Button Submit     ${btnSumit}
