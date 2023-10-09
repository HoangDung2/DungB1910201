*** Settings ***
Resource    ../../../Resource/commons/init.resource
Resource    info_locators.robot
*** Keywords ***
Navigate To The Info Student Page By Click Nav Link Info Student
    Wait Until Element Is Visible    ${locatorInfo}
    Click Element    ${locatorInfo}
    Sleep    2s
Check ID Username The Same MSSV in Sudent Page
    [Arguments]     ${id}
    ${id_table}=    AutoLibrary.Get Element Table    ${MSSV}  ${locatorInfotalble}
    Should Be Equal    ${id_table}    ${id}
Verify Info Student Page Shoulde Be Displayed
    Compare Text    ${tilteInfo}    ${messInfo}
    Compare Text    ${tilteInfo_1}  ${messInfo_1}
    Compare Text    ${tilteInfo_2}  ${messInfo_2}