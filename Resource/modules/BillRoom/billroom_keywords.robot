*** Settings ***
#Library    SeleniumLibrary
Resource    ../../../Resource/commons/init.resource
*** Keywords ***
Check The Data Every Month
    Scroll To Bottom
    Wait Until Element Is Visible    ${lct_ipt_time}
    FOR    ${element_list}    IN    @{list_month}
        Input Text    ${lct_ipt_time}    ${element_list}
        Click Element   ${lct_next}
        Sleep    3s
        Capture and Save Screenshot
        ${return_status}=   Run Keyword And Return Status    Element Should Be Visible    ${lct_mess_fail_bill}
        IF    '${return_status}' == 'True'
            Log Many    Next Step
        ELSE
            ${Get_Money}=   create dictionary
            ${Debt}=    Create Dictionary
            ${Dictionary}=  create dictionary
            ${list}=  create list
            ${elements_row}=    Get WebElements    ${lct_data_row}
            Scroll To Bottom
            FOR    ${element_row}    IN    @{elements_row}
                ${get_text}=    Get Text    ${element_row}
                ${split_name_room}=   Split String    ${get_text}    ${SPACE}
                Set To Dictionary    ${Dictionary}   ${split_name_room}[1]   0
                Set To Dictionary    ${Get_Money}   ${split_name_room}[1]   0
                Append To List    ${list}   ${split_name_room}[1]
            END
            ${locator_pag}=    Get WebElements   ${lct_pag}
            FOR    ${element_pag}    IN    @{locator_pag}
                Wait Until Element Is Visible  ${element_pag}
                Click Element    ${element_pag}
                FOR    ${element_name_row}    IN    @{list}
                   Scroll To Top
                   ${locator_money}=   Dymanic Xpath   ${element_name_row}  ${lct_money}
                   ${locator_status}=   Dymanic Xpath   ${element_name_row}  ${lct_status}
                   ${get_all_locator_money}=    Get WebElements   ${locator_money}
                   ${get_all_lct_status}=   Get WebElements  ${locator_status}
                   ${return_status}=   Run Keyword And Return Status    Element Should Be Visible    ${locator_money}
                   IF    '${return_status}' == 'True'
                       FOR    ${element}    IN    @{get_all_locator_money}
                            ${get_text_money}=  Get Text    ${element}
                            ${value_money}=     Split String   ${get_text_money}   đ
                            ${conver_value}=  Convert Value Integer     ${value_money}[0]
                            ${value_dic}=  Get From Dictionary    ${Dictionary}    ${element_name_row}
                            ${convert_value_dic}=  Convert Value Integer  ${value_dic}
                            ${convert_value_dic} =  Evaluate    ${convert_value_dic} + ${conver_value}
                            Set To Dictionary    ${Dictionary}   ${element_name_row}   ${convert_value_dic}
                       END
                       FOR    ${element_status}    IN    @{get_all_lct_status}
                            ${get_text_money}=  Get Text    ${element_status}
                            ${value_money}=     Split String   ${get_text_money}   đ
                            ${conver_value}=  Convert Value Integer     ${value_money}[0]
                            ${value_dic}=  Get From Dictionary    ${Get_Money}    ${element_name_row}
                            ${convert_value_dic}=  Convert Value Integer  ${value_dic}
                            ${convert_value_dic} =  Evaluate    ${convert_value_dic} + ${conver_value}
                            Set To Dictionary    ${Get_Money}   ${element_name_row}   ${convert_value_dic}
                       END
                   ELSE
                        Log    Next Step
                   END

                END
            END
            Scroll To Bottom
            FOR    ${element_list_row}    IN    @{list}
            # tổng tiền tháng
            ${locator_sum}=   Dymanic Xpath   ${element_list_row}  ${lct_sum_money}
            ${get_text_sum}=    Get Text   ${locator_sum}
            ${split_left_sum}=     Split String   ${get_text_sum}   :${SPACE}
            ${split_right_sum}=    Split String   ${split_left_sum}[1]   đ
            ${conver_value_sum}=  Convert Value Integer     ${split_right_sum}[0]
            ${Sum_money}=   Get From Dictionary    ${Dictionary}    ${element_list_row}
            Should Be Equal As Integers    ${Sum_money}    ${conver_value_sum}
            # tổng tiền nợ
            ${locator_proceeds}=   Dymanic Xpath   ${element_list_row}  ${lct_debt}
            ${get_text_proceeds}=    Get Text   ${locator_proceeds}
            ${split_left_proceeds}=     Split String   ${get_text_proceeds}   :${SPACE}
            ${split_right_proceeds}=    Split String   ${split_left_proceeds}[1]   đ
            ${conver_value_proceeds}=  Convert Value Integer     ${split_right_proceeds}[0]
            ${Proceeds}=    Get From Dictionary    ${Get_Money}    ${element_list_row}
            Should Be Equal As Integers    ${Proceeds}    ${conver_value_proceeds}
             # tiền thu được
            ${locator_debt}=   Dymanic Xpath   ${element_list_row}  ${lct_prceeds}
            ${get_text_debt}=    Get Text   ${locator_debt}
            ${split_left_debt}=     Split String   ${get_text_debt}   :${SPACE}
            ${split_right_debt}=    Split String   ${split_left_debt}[1]   đ
            ${conver_value_debt}=  Convert Value Integer     ${split_right_debt}[0]
            ${Subtract}=    Evaluate    ${Sum_money}-${Proceeds}
            Should Be Equal As Integers    ${Subtract}    ${conver_value_debt}
            Reload Page
            Wait Page Should Be Displayed
            END
        END
    END

Check The Data According To Month
    [Arguments]  ${moth_req}
    Scroll To Bottom
    Wait Until Element Is Visible   ${lct_ipt_time}
    Input Text    ${lct_ipt_time}    ${moth_req}
    Click Element   ${lct_next}
    Sleep    3s
    Capture and Save Screenshot
    ${return_status}=   Run Keyword And Return Status    Element Should Be Visible    ${lct_mess_fail_bill}
    IF  '${return_status}' == 'True'
            Log Many    Next Step
        ELSE
            ${Get_Money}=   create dictionary
            ${Debt}=    Create Dictionary
            ${Dictionary}=  create dictionary
            ${list}=  create list
            ${elements_row}=    Get WebElements    ${lct_data_row}
            Scroll To Bottom
            FOR    ${element_row}    IN    @{elements_row}
                ${get_text}=    Get Text    ${element_row}
                ${split_name_room}=   Split String    ${get_text}    ${SPACE}
                Set To Dictionary    ${Dictionary}   ${split_name_room}[1]   0
                Set To Dictionary    ${Get_Money}   ${split_name_room}[1]   0
                Append To List    ${list}   ${split_name_room}[1]
            END
            ${locator_pag}=    Get WebElements   ${lct_pag}
            FOR    ${element_pag}    IN    @{locator_pag}
                Wait Until Element Is Visible  ${element_pag}
                Click Element    ${element_pag}
                FOR    ${element_name_row}    IN    @{list}
                   Scroll To Top
                   ${locator_money}=   Dymanic Xpath   ${element_name_row}  ${lct_money}
                   ${locator_status}=   Dymanic Xpath   ${element_name_row}  ${lct_status}
                   ${get_all_locator_money}=    Get WebElements   ${locator_money}
                   ${get_all_lct_status}=   Get WebElements  ${locator_status}
                   ${return_status}=   Run Keyword And Return Status    Element Should Be Visible    ${locator_money}
                   IF    '${return_status}' == 'True'
                       FOR    ${element}    IN    @{get_all_locator_money}
                            ${get_text_money}=  Get Text    ${element}
                            ${value_money}=     Split String   ${get_text_money}   đ
                            ${conver_value}=  Convert Value Integer     ${value_money}[0]
                            ${value_dic}=  Get From Dictionary    ${Dictionary}    ${element_name_row}
                            ${convert_value_dic}=  Convert Value Integer  ${value_dic}
                            ${convert_value_dic} =  Evaluate    ${convert_value_dic} + ${conver_value}
                            Set To Dictionary    ${Dictionary}   ${element_name_row}   ${convert_value_dic}
                       END
                       FOR    ${element_status}    IN    @{get_all_lct_status}
                            ${get_text_money}=  Get Text    ${element_status}
                            ${value_money}=     Split String   ${get_text_money}   đ
                            ${conver_value}=  Convert Value Integer     ${value_money}[0]
                            ${value_dic}=  Get From Dictionary    ${Get_Money}    ${element_name_row}
                            ${convert_value_dic}=  Convert Value Integer  ${value_dic}
                            ${convert_value_dic} =  Evaluate    ${convert_value_dic} + ${conver_value}
                            Set To Dictionary    ${Get_Money}   ${element_name_row}   ${convert_value_dic}
                       END
                   ELSE
                        Log    Next Step
                   END

                END
            END
            Scroll To Bottom
            FOR    ${element_list_row}    IN    @{list}
            # tổng tiền tháng
            ${locator_sum}=   Dymanic Xpath   ${element_list_row}  ${lct_sum_money}
            ${get_text_sum}=    Get Text   ${locator_sum}
            ${split_left_sum}=     Split String   ${get_text_sum}   :${SPACE}
            ${split_right_sum}=    Split String   ${split_left_sum}[1]   đ
            ${conver_value_sum}=  Convert Value Integer     ${split_right_sum}[0]
            ${Sum_money}=   Get From Dictionary    ${Dictionary}    ${element_list_row}
            Should Be Equal As Integers    ${Sum_money}    ${conver_value_sum}
            # tổng tiền nợ
            ${locator_proceeds}=   Dymanic Xpath   ${element_list_row}  ${lct_debt}
            ${get_text_proceeds}=    Get Text   ${locator_proceeds}
            ${split_left_proceeds}=     Split String   ${get_text_proceeds}   :${SPACE}
            ${split_right_proceeds}=    Split String   ${split_left_proceeds}[1]   đ
            ${conver_value_proceeds}=  Convert Value Integer     ${split_right_proceeds}[0]
            ${Proceeds}=    Get From Dictionary    ${Get_Money}    ${element_list_row}
            Should Be Equal As Integers    ${Proceeds}    ${conver_value_proceeds}
             # tiền thu được
            ${locator_debt}=   Dymanic Xpath   ${element_list_row}  ${lct_prceeds}
            ${get_text_debt}=    Get Text   ${locator_debt}
            ${split_left_debt}=     Split String   ${get_text_debt}   :${SPACE}
            ${split_right_debt}=    Split String   ${split_left_debt}[1]   đ
            ${conver_value_debt}=  Convert Value Integer     ${split_right_debt}[0]
            ${Subtract}=    Evaluate    ${Sum_money}-${Proceeds}
            Should Be Equal As Integers    ${Subtract}    ${conver_value_debt}
            END
     END





Input RoomType And Room Update
    [Arguments]   ${typeroom}     ${room}
    ${locator}=     Dymanic Xpath More   ${typeroom}   ${room}   ${lct_roomtype_room}
    RETURN  ${locator}

Verify RoomType And Room Exist In List Room
    [Arguments]     ${typeroom}     ${room}
    ${check_lct}=   Input RoomType And Room Update  ${typeroom}     ${room}
    ${locator_pag}=    Get WebElements   ${lct_pag}
    ${flag}=  Evaluate  0
    FOR   ${element_pag}    IN    @{locator_pag}
         IF    '${flag}' == '0'
             Log    Next Step
         ELSE
              RETURN   Next Step
         END
          Wait Until Element Is Visible  ${element_pag}
          Click Element    ${element_pag}
          ${return_status}=   Run Keyword And Return Status    Element Should Be Visible    ${check_lct}
          Sleep    3s
          IF    '${return_status}' == 'True'
              ${new_data}=    Get Sum Money According To RoomType Bill    ${typeroom}     ${room}
              Click Element    ${check_lct}
              Sleep    2s
              ${flag}=  Evaluate  1
              RETURN    ${new_data}
          ELSE
              Log   Next Page
          END
         Sleep    5s
    END

Update Data Bill Room By Click Text 'Chỉnh Sửa'
    [Arguments]  ${data_water}  ${data_electric}
    Verrify Table Bill Should Be Displayed
    ${get_value_water}=  Get Value   ${lct_water}
    ${get_value_electric}=  Get Value   ${lct_electric}
    IF    ${get_value_water} <= ${data_water}
        ${conver_int}=  Convert Value Integer   ${get_value_water}
        ${get_value_wa}=    Set Variable   ${conver_int+10}
        Input Text   ${lct_water}   ${get_value_wa}
    ELSE
       Input Text   ${lct_water}     ${data_water}
    END
    IF    ${get_value_electric} <= ${data_electric}
        ${conver_int}=  Convert Value Integer   ${get_value_electric}
        ${get_value_elec}=    Set Variable   ${conver_int+10}
        Input Text   ${lct_electric}   ${get_value_elec}
    ELSE
        Input Text    ${lct_electric}    ${data_electric}
    END
    Click Element    ${btnBill}
    Sleep    1s


Verify Update Data Successfully
    Compare Text     ${locatorSuccess}     Thành công
    Compare Text     ${locatorSuccess_1}     Bạn đã cập nhật điện nước thành công
    Click Element    ${confirm_Succes}
    Sleep    1s
    Wait Until Element Is Visible  ${btn_close_bill}
    Click Element   ${btn_close_bill}
    Sleep    1s

Check For Changed Data
    [Arguments]     ${typeroom}     ${room}     ${data_old}
    ${new_data}=    Get Sum Money According To RoomType Bill    ${typeroom}     ${room}
    IF    ${data_old}[0] != ${new_data}[0]
        RETURN  Data Change
    ELSE
#         Fail  Test Case Fail
          RETURN  Test Case Fail
    END


Verrify Table Bill Should Be Displayed
    Compare Text     ${tilt_table_bill}     ${mess_table_bill}
    Compare Text     ${tilte_water}    ${mess_table_water}
    Compare Text     ${tilte_electric}     ${mess_table_electric}

Update Data Bill Room According To Input
    [Arguments]     ${data_water}   ${data_electric}
    Verrify Table Bill Should Be Displayed
    Input Text   ${lct_water}     ${data_water}
    Input Text   ${lct_electric}  ${data_electric}
    Sleep    2s
    Click Element   ${btnBill}
    Sleep    2s

Verify Update Data Faily
    Compare Text     ${locatorSuccess}     Thất bại
    Compare Text     ${locatorSuccess_1}     Vui lòng nhập đầy đủ thông tin

