*** Settings ***
Resource    ../../../Resource/commons/init.resource
*** Keywords ***
Navigate To The Info Student Page By Click Nav Link Roomtype
    Click Nav RoomType

Input Name Row Any Have In RoomType Page
    [Arguments]  ${name_roomType}
    ${locator_namerow}=     Dymanic Xpath  ${name_roomType}  ${locatorType}
    Set Global Variable    ${locator_namerow}
    RETURN  ${locator_namerow}

Click In RoomType Student Have Choose
      [Arguments]  ${name_roomType}
      ${locator}=    Input Name Row Any Have In RoomType Page    ${name_roomType}
      Wait Until Element Is Visible  ${locator}
      Click Element    ${locator}

Select The Room According To The Previous Condition Steps
    Wait Until Element Is Visible   ${locatorStatusAccept}
    ${elements}=    Get WebElements     ${locatorStatusAccept}
    Click Element    ${elements[0]}


Register Room Any In List Eligible
    [Documentation]     Input MSSV Then Get Gender Register Room
    [Arguments]  ${MSSV}
    Scroll To Bottom
    ${gender_sv}=   Get All Info Student    ${MSSV}
    ${locator}=     Dymanic Xpath  ${gender_sv}[6]  ${locatorRoom}
    ${elements}=    Get WebElements  ${locator}
    IF  not $elements
        Pass Execution     ${room_full}
    ELSE
        Click Element    ${elements[0]}
    END


Check Register Room In RoomType Different From Gender
    [Documentation]     Input MSSV Then Get Gender Register Room
    [Arguments]  ${MSSV}
    ${scrollHeight}=    Execute JavaScript    return Math.max(document.body.scrollHeight, document.documentElement.scrollHeight, document.body.offsetHeight, document.documentElement.offsetHeight, document.body.clientHeight, document.documentElement.clientHeight)
    ${scrollPosition}=    Evaluate    (1/3) * ${scrollHeight}
    Execute JavaScript    window.scrollTo(0, ${scrollPosition})
    Sleep    2s
    Capture and Save Screenshot
    ${gender_sv}=   Get All Info Student    ${MSSV}
    ${diff_gender}=   Set Variable  ${gender_sv}[6]
    IF    '${diff_gender}' == 'Nữ'
         ${diff_gender}=  Set Variable   Nam
    ELSE
        ${diff_gender}=  Set Variable    Nữ
    END
    ${locator}=     Dymanic Xpath  ${diff_gender}   ${locatorRoom}
    ${elements}=    Get WebElements  ${locator}
    IF  not $elements
        Pass Execution    ${room_full}
    ELSE
        Click Element    ${elements[0]}
    END

Nofication Student Want To Register Should Be Displayed
    Compare Text    ${locatorTitleMess}     ${messTitleMess}
    Compare Text    ${locatorTitleMess_1}     ${messTitleMess_1}
    Wait Until Element Is Visible   ${submit_register}
    Click Element    ${submit_register}
    Sleep    10

Verify Register successfully
    Wait Until Element Is Visible   ${locatorSuccess}
    Wait Until Element Is Visible    ${locatorSuccess_1}
    Compare Text    ${locatorSuccess}     ${messSuccess}
    Compare Text    ${locatorSuccess_1}     ${messSuccess_1}
    Click Element    ${confirm_Succes}

Validate InfoStudent Page The Same Database
    [Arguments]  ${MSSV}
    ${text_day}=    AutoLibrary.Get Element Table  ${day}   ${locatorInfotalble}
    ${text_room}=    AutoLibrary.Get Element Table  ${room}   ${locatorInfotalble}
    ${list}=  Get Row And Room In Infostudent   ${MSSV}
    Should Be Equal As Strings    ${list}[0]    ${text_day}
    Should Be Equal As Strings    ${list}[1]    ${text_room}

Verify Error Message Is Displayed
    Compare Text    ${locatorTitleMess_1}     ${mess_Fail_1}
    Click Element    ${submit_messfail}

Click In RoomType Have Status Being Repaired
    ${return_status}=   Run Keyword And Return Status    Element Should Be Visible    ${locatorStatusRepair}
    IF    '${return_status}'== 'True'
            Compare Text  ${locatorStatusRepair}  ${messStatusRepair}
            Click Element   ${locatorStatusRepair}
    ELSE
            Pass Execution    No Room Under Repair
    END


Verify Error Message Are Being Repaired Is Displayed
    Compare Text     ${locatorTitleMess}     Phòng đang sửa chữa
    Compare Text     ${locatorTitleMess_1}   Vui lòng chọn loại phòng khác !
    Click Element    ${submit_messfail}

Veryfi Error Message Student Have Register Room
    Compare Text     ${locatorTitleMess}     Phòng đang sửa chữa
    Compare Text     ${locatorTitleMess_1}   Vui lòng chọn loại phòng khác !
    Click Element    ${submit_messfail}

Veryfi Error Message Have Previous Register Room
    Compare Text     ${locatorTitleMess}     Phòng đang sửa chữa
    Compare Text     ${locatorTitleMess_1}   Sinh viên này đã đăng ký học kỳ này rồi
    Click Element    ${submit_messfail}

Veryfi Error Message Have't Register Time
    Compare Text     ${locatorTitleMess}     Đã hết hạn đăng ký
    Compare Text     ${locatorTitleMess_1}   Vui lòng quay lại sau
    Click Element    ${submit_messfail}

Veryfi Error Message Have Over Time
    Compare Text     ${locatorTitleMess}     Đã hết hạn đăng ký
    Compare Text     ${locatorTitleMess_1}   Vui lòng quay lại sau
    Click Element    ${submit_messfail}

Veryfi Error Message Student Have Check-In Period Overlaps With Stay Period
    Compare Text     ${locatorTitleMess}     Phòng đang sửa chữa
    Compare Text     ${locatorTitleMess_1}   Sinh viên này đã đăng ký học kỳ này rồi
    Click Element    ${submit_messfail}

Verify Over Time Resgister Room
    ${get_text}=    Get Text    ${lct_time_regis}
    IF    '${get_text}' == '${mess_time_regis}'
        Pass Execution    Test Case Fail
    ELSE
         RETURN     Next Step
    END

Read The Response Email From The Admin
    Read Email