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
    ${id_table}=    AutoLibrary.Get Element Table  ${MSSV}  ${locatorInfotalble}
    Should Be Equal    ${id_table}    ${id}
Verify Info Student Page Shoulde Be Displayed
    Compare Text    ${tilteInfo}    ${messInfo}
    Compare Text    ${tilteInfo_1}  ${messInfo_1}
    Compare Text    ${tilteInfo_2}  ${messInfo_2}
Verify Room Is't Displayed
    ${temp}=    AutoLibrary.Get Element Table  ${day}   ${locatorInfotalble}
    ${length_temp}=   Get Length    ${temp}
    IF    ${length_temp} == 0
        RETURN  True
    END
    Should Be Equal    ${length_temp}    0
Verify Day  Is't Displayed
    ${temp}=    AutoLibrary.Get Element Table  ${room}   ${locatorInfotalble}
    ${length_temp}=   Get Length    ${temp}
    IF    ${length_temp} == 0
        RETURN  True
    END
    Should Be Equal    ${length_temp}    0

Verify Day And Room Is't Displayed
    ${temp}=    AutoLibrary.Get Element Table  ${day}   ${locatorInfotalble}
    ${temp_1}=    AutoLibrary.Get Element Table  ${room}   ${locatorInfotalble}
    ${length_temp}=   Get Length    ${temp}
    ${length_temp_1}=   Get Length    ${temp_1}
    IF    '${length_temp}' == '${length_temp_1}'
        ${ss}=  Set Variable    ${length_temp}
    END
    Should Be Equal    '${ss}'    '0'

Check All Info Sudent With Databse
    [Arguments]  ${MSSV}
    ${info_db}=    Get All Info Student    ${MSSV}
    ${info_ui}=  Get Data Tabel Infostu
    ${temp_info_db}=    Create List
    ${temp_info_ui}=    Create List
    ${length_info_db}=  Get Length    ${info_db}
    ${length_info_ui}=  Get Length    ${info_ui}
    IF    '${length_info_db}' == '${length_info_ui}'
        FOR    ${element}    IN RANGE   0   ${length_info_db}
            ${temp}=    Get From List    ${info_db}    ${element}
            ${temp_2}=  Get From List    ${info_ui}    ${element}
            Should Be Equal As Strings  ${temp}  ${temp_2}
        END
    ELSE
        Log To Console    ${MessData}
    END

Click Nav Link MaterialRepair Then Register
    Click Nav MaterialRepair
    Wait Until Element Is Visible   ${lctMessFail}
    Wait Until Element Is Visible    ${lctTiltelMessFail}
    ${text_lctMessFail}=    Get Text    ${lctMessFail}
    ${text_lctTiltelMessFail}=  Get Text    ${lctTiltelMessFail}
    Should Be Equal As Strings    ${text_lctMessFail}   ${mesMaterialRepair}
    Should Be Equal As Strings    ${text_lctTiltelMessFail}    ${messFail_Homepage}


Click Nav Link Service Then Register
    Click Nav Service
    Wait Until Element Is Visible   ${lctMessFail}
    Wait Until Element Is Visible    ${lctTiltelMessFail}
    ${text_lctMessFail}=    Get Text   ${lctMessFail}
    ${text_lctTiltelMessFail}=  Get Text    ${lctTiltelMessFail}
    Should Be Equal As Strings    ${text_lctMessFail}   ${messService}
    Should Be Equal As Strings    ${text_lctTiltelMessFail}    ${messFail_Homepage}


Click Button 'OK'
    Click Element   xpath=//button[@type="button"][contains(text(),"OK")]