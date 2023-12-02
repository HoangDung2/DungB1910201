*** Settings ***
Resource    ../../../Resource/commons/init.resource
*** Keywords ***
Check Status Room Have't Pay For Room
    Element Should Be Visible   ${locator_messPayment}
    Element Should Be Visible   ${locator_messPayment_1}
    Element Should Be Visible   ${locator_Payment}

Click In 'đây' Then Payment
    Wait Until Element Is Visible    ${locator_Payment}
    Click Element  ${locator_Payment}

Verify VNPAY Page Should Be Displayed
    Element Should Be Visible    ${locator_logoPayment}
    Compare Text    ${locator_TitlePayment}     ${mess_TitlePayment}
    Compare Text    ${locator_Tiltbill}     ${mess_TitleBill}


Student Input Info Card Need Payment
    [Arguments]     ${id_card}  ${name_pay}  ${date_pay}
    Wait Until Element Is Visible    ${locator_inputDigits}
    Wait Until Element Is Visible    ${locator_inputNameCard}
    Wait Until Element Is Visible    ${locator_inputDate}
    Input Text    ${locator_inputDigits}   ${id_card}
    Click Element   ${button_continue}
    Input Text    ${locator_inputNameCard}    ${name_pay}
    Input Text    ${locator_inputDate}    ${date_pay}
    Click Element   ${button_continue}



Input Full Info Card Need Payment
    Wait Until Element Is Visible    ${locator_inputDigits}
    Wait Until Element Is Visible    ${locator_inputNameCard}
    Wait Until Element Is Visible    ${locator_inputDate}
    Input Text    ${locator_inputDigits}   ${ID_CARD}
    Input Text    ${locator_inputNameCard}    ${NAME_PAY}
    Input Text    ${locator_inputDate}    ${DATE_PAY}

Click In 'Tiếp tục' Then Payment
    Wait Until Element Is Visible    ${button_continue}
    Sleep    1s
    Click Element    ${button_continue}

Verify Confirm Payment Should Be Displayed
    Element Should Be Visible    ${locator_TitlePayment}
    Element Should Be Visible    ${locator_inputOTP}

Input Code OTP
    Wait Until Element Is Visible    ${locator_inputOTP}
    Input Text    ${locator_inputOTP}    ${OTP}

Click In 'Thanh Toán' Then Confirm Payment Succeslly
    Wait Until Element Is Visible    ${button_confirm}
    Click Element    ${button_confirm}

Verify Online Payment Succeslly
    [Arguments]     ${MSSV}
    Compare Text    ${locator_succesPayment}     ${mess_succesPayment}
    Run Keyword And Ignore Error    Update Status Payment In Infor Student  ${MSSV}
Use Voucher Discount If Student Wanna
   [Arguments]  ${status}
   ${conver_string}=    Convert To Lowercase    ${status}
   IF    '${conver_string}' == 'yes'
        Wait Until Element Is Visible    ${locator_discount}
        Click Element    ${locator_discount}
        Sleep    2s
        Capture and Save Screenshot
        ${return_status}=   Run Keyword And Return Status    Element Should Be Visible    ${locator_voucher}
        IF    '${return_status}' == 'True'
             Wait Until Element Is Visible    ${locator_voucher}
             Click Element    ${locator_voucher}
             Sleep    2s
        ELSE
             Pass Execution   Vouchers Are Currently Sold Out
        END
        # Check xem co duoc giam gia hay khong ?
        Check Payment Have Discount
   ELSE
        RETURN  Next STep
   END


Chose Methods Use Voucher
    [Documentation]
    [Arguments]     ${methods}
    ${conver_string}=    Convert To Lowercase    ${methods}
    Wait Until Element Is Visible    ${locator_discount}
    Click Element    ${locator_discount}
    Sleep    2s
    Capture and Save Screenshot
    IF    '${conver_string}' == 'click'
        ${return_status}=   Run Keyword And Return Status    Element Should Be Visible    ${locator_voucher}
        IF    '${return_status}' == 'True'
             Wait Until Element Is Visible    ${locator_voucher}
             Click Element    ${locator_voucher}
             Sleep    2s
        ELSE
             Pass Execution   Vouchers Are Currently Sold Out
        END
    ELSE IF  '${conver_string}' == 'code'
        ${return_status}=   Run Keyword And Return Status    Element Should Be Visible    ${locator_voucher}
        IF    '${return_status}' == 'True'
             Wait Until Element Is Visible    ${locator_code_voucher}
             ${text_code}=  Get Text    ${locator_code_voucher}
             Input Text    ${locator_IP_Voucher}    ${text_code}
             Sleep    2s
             Capture and Save Screenshot
             Click Element    ${submit_code_voucher}
             Sleep    2s
        ELSE
             Pass Execution   Vouchers Are Currently Sold Out
        END
    ELSE
        Pass Execution    Student Chooses The Wrong Payment Method
    END

Chose Voucher Input Code Then Use According To Condition
    [Arguments]     ${condition}    ${code}
    ${conver_string}=    Convert To Lowercase    ${condition}
    Wait Until Element Is Visible    ${locator_discount}
    Click Element    ${locator_discount}
    Sleep    2s
    ${i}=  Evaluate    0
    Capture and Save Screenshot
    IF    '${conver_string}' == 'over number'
             ${img_vou}  Get WebElements  ${img_voucher_overNu}
             ${elements}    Get WebElements  ${locator_voucher_overNu}
             FOR    ${element}    IN    @{elements}
                Capture Element and Save Screenshot  ${img_vou}[${i}]
                ${i}=   Evaluate    ${i}+1
                ${text_code}  Get Text    ${element}
                Input Text    ${locator_IP_Voucher}    ${text_code}
                Sleep    2s
                Capture and Save Screenshot
                Click Element    ${submit_code_voucher}
                Sleep    2s
                Capture and Save Screenshot
                Compare Text    ${locator_error_overNu}     ${mess_error_overN}
             END
    ELSE IF     '${conver_string}' == 'invalid time'
            ${img_vou}  Get WebElements  ${img_voucher_invali_time}
            ${elements}    Get WebElements  ${locator_voucher_indvalTime}
             FOR    ${element}    IN    @{elements}
                Capture Element and Save Screenshot  ${img_vou}[${i}]
                ${i}=   Evaluate    ${i}+1
                ${text_code}  Get Text    ${element}
                Input Text    ${locator_IP_Voucher}    ${text_code}
                Sleep    2s
                Capture and Save Screenshot
                Click Element    ${submit_code_voucher}
                Sleep    2s
                Capture and Save Screenshot
                Compare Text    ${locator_error_overNu}     ${mess_error_InvaliT}
             END
    ELSE IF   '${conver_string}' == 'input code'
                Input Text    ${locator_IP_Voucher}    ${code}
                Sleep    2s
                Capture and Save Screenshot
                Click Element    ${submit_code_voucher}
                Sleep    2s
                Capture and Save Screenshot
                Compare Text    ${locator_error_overNu}     ${mess_error_InvaliT}
    ELSE
                RETURN  Student Choose Voucher Faily
    END

Verify Voucher Is Applied
    [Arguments]     ${MSSV}
    Check Payment Have Discount
    Run Keyword And Ignore Error    Update Status Payment In Infor Student  ${MSSV}

Check Payment Have Discount
    ${text_discount}=  Get Text    ${locator_valueDiscount}
    ${text_bill}=  Get Text  ${locator_valuebill}
    ${text_payment}=   Get Text  ${locator_billPayment}
    ${slip_discount}=    Split String     ${text_discount}    .
    ${slip_bill}=    Split String     ${text_bill}    .
    ${slip_payment}=    Split String     ${text_payment}    .
    ${convert_discount}=  Convert To Integer    ${slip_discount}[0]
    ${convert_bill}=     Convert To Integer     ${slip_bill}[0]
    ${convent_payment}=   Convert To Integer    ${slip_payment}[0]
    ${result}=  Evaluate  ${convert_bill} - ${convert_discount}
    Should Be Equal As Integers    ${convent_payment}    ${result}

Click In 'Hủy thanh toán' Then Cancel
    Wait Until Element Is Visible   ${cancel_payment}
    Click Element    ${cancel_payment}
    Wait Notification Should Be Displayed

Alert Cancel Should Be Displayed
    Compare Text    ${locator_alert_cancel}     ${mess_alert_1}
    Compare Text    ${locator_alert_cancel_1}     ${mess_alert_2}
    Click Element   ${button_cancel_alert}

Verify Nofication Cancel Should Be Displayed
    Compare Text    ${locator_mess_cancel}     ${mess_cancel_1}
    Compare Text    ${locator_mess_cancel_1}     ${mess_cancel_2}

Verify Error Should Be Displayed
    Wait Notification Should Be Displayed

Check If The Service Student Wanna Payment Has't Return Nofication
    [Arguments]  ${name_service}
    ${locator_text}=     Dymanic Xpath   ${name_service}    ${locator_inva_payment}
    ${status}=  Run Keyword And Return Status    Element Should Contain     ${locator_text}   ${mess_invali_payment}
    IF  '${status}'== 'True'
        ${locator_payment}=     Dymanic Xpath  ${name_service}  ${locator_payment_service}
        Wait Until Element Is Visible    ${locator_payment}
        Click Element    ${locator_payment}
    ELSE
        Pass Execution  Student Have't Register Services Then Don't Payment Online
    END

Check If The Room Student Wanna Payment Has't Return Nofication
    ${text}=  Get Text  ${locator_succesPayment}
    IF    '${text}' == '${mess_succesPayment}'
           Pass Execution    Student Have Done Payment Online Room
    ELSE
           Check Status Room Have't Pay For Room
    END
    
Verify Online Payment Service Succeslly
    [Arguments]    ${name_service}      ${MSSV}
    ${locator_text}=     Dymanic Xpath   ${name_service}    ${locator_inva_payment}
    ${status}=  Run Keyword And Return Status    Element Should Contain     ${locator_text}   ${mess_vali_payment}
    Should Be Equal As Strings    ${status}    True
    Run Keyword And Ignore Error    Update Status Payment In Infor Student  ${MSSV}