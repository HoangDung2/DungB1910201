*** Settings ***
Resource    ../../../Resource/commons/init.resource
*** Keywords ***
Verify Notification Response Meterial Should Be Displayed
    Compare Text    ${locatorTitleMess}      Thành công
    Element Should Be Visible   ${locatorTitleMess_1}
    Element Should Be Visible   ${submit_messfail}

Verify The Response Material Page Should Be Displayed
    Compare Text    ${tilt_bill}    Danh sách loại phòng

Click 'Xác nhận' Then Cofirm Reponse To Student
    [Arguments]     ${MSSV}
    ${locator}=     Dymanic Xpath  ${MSSV}  ${lct_confirm}
    Wait Until Element Is Visible   ${locator}
    ${elements}=    Get WebElements  ${locator}
    IF  not $elements
        Pass Execution     No Response From Student
    ELSE
        Click Element    ${elements[0]}
    END
    Sleep    1s

Input The Date Of Repair
    [Arguments]  ${date}
    Wait Until Element Is Visible    ${lct_input_date_res}
    IF    '${date}' == 'Today'
        ${temp_time}=  Get Current Date
        ${future_datetime}=   Convert Mmddyyyy    ${temp_time}
        Input Text    ${lct_input_date_res}    ${future_datetime}
    ELSE
         IF    '${date}' == 'Yesterday'
             ${temp_time}=  Get Current Date
             ${future_datetime} =    Subtract Time From Date    ${temp_time}   1 days
             ${temp_time}=   Convert Mmddyyyy    ${future_datetime}
             Input Text    ${lct_input_date_res}    ${temp_time}
         ELSE
              ${current_datetime} =    Get Current Date
              ${future_datetime} =    Add Time To Date    ${current_datetime}   ${date} days
              ${temp_time}=   Convert Mmddyyyy    ${future_datetime}
              Input Text    ${lct_input_date_res}    ${temp_time}
         END
    END


    
    

Send By Click 'Gửi'
    Wait Until Element Is Visible    ${lct_send}
    Click Element   ${lct_send}
    Sleep    10s

Verify Error Notification Response Meterial Should Be Displayed
    [Arguments]  ${mess}
    Compare Text    ${locatorTitleMess}      Lỗi
    Compare Text    ${locatorTitleMess_1}      ${mess}