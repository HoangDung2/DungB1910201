*** Settings ***
Resource    ../../../Resource/commons/init.resource
*** Keywords ***
Navigate To The Info Student Page By Click Nav Link Info Student
    Wait Until Element Is Visible    ${locatorInfo}
    Click Element    ${locatorInfo}
    Sleep    2s
Check ID Username The Same MSSV in Sudent Page
    [Arguments]     ${id}
    ${id_table}=    AutoLibrary.Get Element Table  ${MSSV}  ${locatorInfotalble}
    Should Be Equal    ${id_table}    ${id}
Verify Info Student Page Should Be Displayed
    Compare Text    ${tilteInfo}    ${messInfo}
    Compare Text    ${tilteInfo_1}  ${messInfo_1}
    Compare Text    ${tilteInfo_2}  ${messInfo_2}

Verify Room Is't Displayed
    ${temp}=    AutoLibrary.Get Element Table  ${day}   ${locatorInfotalble}
    ${length_temp}=   Get Length    ${temp}
    Should Be Equal    ${length_temp}    0

Verify Day  Is't Displayed
    ${temp}=    AutoLibrary.Get Element Table  ${room}   ${locatorInfotalble}
    ${length_temp}=   Get Length    ${temp}
    Should Be Equal    ${length_temp}    0

Verify Day And Room Is't Displayed
    ${temp}=    AutoLibrary.Get Element Table  ${day}   ${locatorInfotalble}
    ${temp_1}=    AutoLibrary.Get Element Table  ${room}   ${locatorInfotalble}
    ${length_temp}=   Get Length    ${temp}
    ${length_temp_1}=   Get Length    ${temp_1}
    IF  '${length_temp}' == '${length_temp_1}'
        ${ss}=  Set Variable    ${length_temp}
        Should Be Equal    '${ss}'    '0'
    END

Verify Row And Room Is't Displayed If Have Connect DB Delete
    [Arguments]  ${MSSV}
    ${text_day}=    AutoLibrary.Get Element Table  ${day}   ${locatorInfotalble}
    ${text_room}=    AutoLibrary.Get Element Table  ${room}   ${locatorInfotalble}
    ${list}=  Get Row And Room In Infostudent   ${MSSV}
    IF  not ${list}
        RETURN  Next Step
    ELSE
        Should Be Equal As Strings    ${list}[0]    ${text_day}
        Should Be Equal As Strings    ${list}[1]    ${text_room}
        Delete Register Room Student And Reload Page    ${MSSV}
    END

Verify Row And Room Have Displayed
    [Arguments]  ${MSSV}
    ${text_day}=    AutoLibrary.Get Element Table  ${day}   ${locatorInfotalble}
    ${text_room}=    AutoLibrary.Get Element Table  ${room}   ${locatorInfotalble}
#    ${status}=  Get Text    ${locartor_statusRoom}
    IF  '${text_day}'==''
        Pass Execution  Student Have't Register A Room
#    ELSE IF     '${status}'=='Chưa thanh toán'
#        Pass Execution    Student Have't Payment For Room
    ELSE
        ${list}=  Get Row And Room In Infostudent   ${MSSV}
        Should Be Equal As Strings    ${list}[0]    ${text_day}
        Should Be Equal As Strings    ${list}[1]    ${text_room}
    END

Validate Student Has Previously Registered For The Room
    [Arguments]  ${MSSV}
    Verify Row And Room Have Displayed  ${MSSV}


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

#------------------Admin----------
Navigate To The Info Admin Page
    Wait Until Element Is Visible   ${lct_info_user_admin}
    Click Element    ${lct_info_user_admin}
    Wait Until Element Is Visible   ${locator_nav_info}
    Click Element    ${locator_nav_info}

Verify Info Admin Page Should Be Displayed
    Compare Text    ${title_admin}      ${messTitle_Admin}
    Element Should Be Visible    ${logo_admin}

Check All Info Admin With Databse
    [Documentation]  Return List tu 0-7
    ...              0: SĐT , 1: Địa chỉ, 2: Giới tính, 3 ID
    ...              4: Ngày sinh
    [Arguments]    ${id}
    ${data_db}=  Get All Info Admin  ${id}
    ${i}=    Set Variable    0
    ${list}=  create list
    FOR    ${element}    IN    @{list_info_admin}
           IF    '${element}' == 'Ngày sinh'
                ${locator}=     Dymanic Xpath   ${element}    ${lct_table_info_admin}
                ${text}=  Get value    ${locator}
                ${covert}=  Convert Time Data   ${text}
                Should Be Equal As Strings  ${data_db}[${i}]   ${covert}
                ${i}=    Evaluate   ${i} + 1
           ELSE
                ${locator}=     Dymanic Xpath   ${element}    ${lct_table_info_admin}
                ${text}=  Get value    ${locator}
                Should Be Equal As Strings   ${data_db}[${i}]   ${text}
                ${i}=    Evaluate   ${i} + 1
           END
    END
   ${email_name}=   Get Name And Email Admin    ${id}
   Compare Text  ${locator_name_admin}  ${email_name}[0]
   Compare Text  ${locator_mail_admin}  ${email_name}[1]
