*** Settings ***
Resource    ../../../Resource/commons/init.resource
*** Keywords ***
Navigate To The Services Page By Click Nav Link Services
    Click Nav Service

Verify Services Page Should Be Displayed
      Compare Text    ${locatorTitleService}     ${mess_services}
      Compare Text    ${locatorTitleService_1}     ${mess_services_1}

Input Motorbike License Plate If Student Regisvices Send Motorbike
    [Arguments]  ${name_licensePlate}
    ${conver_string}=     Convert To Lowercase    ${name_licensePlate}
    IF    '${conver_string}' == 'no'
         Log Many   Student Have't Register Services Send Motorbike
    ELSE
         Wait Until Element Is Visible    ${locator_licensePlate}
         Input Text  ${locator_licensePlate}    ${name_licensePlate}
         ${text}=   Get Value    ${locator_licensePlate}
         ${status}=  Run Keyword And Return Status   Should Match Regexp   ${text}  [0-9]{2}[A-Z]{1}[0-9A-Z]{1}-\s?\d{5}$
         IF    '${status}' == 'Fail'
             Pass Execution    The Student Entered An Invalid License Plate Number
         END
    END

Input Services Student Want To Register
   [Arguments]      ${name_services}
   ${locator}=     Dymanic Xpath  ${name_services}  ${locator_registerServices}
   Wait Until Element Is Visible    ${locator}
   Click Element    ${locator}
   Sleep    1s

Submit Confirm Register
   Compare Text     ${locatorTitleMess}     Xác nhận đăng ký
   Compare Text     ${locatorTitleMess_1}   Bạn có chắc chắn đăng ký dịch vụ này?
   Click Element    ${submit_register}
   Capture and Save Screenshot

Verify Notification Register Successfully Should Be Displayed
   Compare Text     ${locatorTitleMess}     Chúc mừng
   Compare Text     ${locatorTitleMess_1}   Bạn đã đăng ký dịch vụ thành công
   Click Element    ${submit_messfail}

Verify Services Information Stored In Info Student Page
   [Arguments]  ${name_services}    ${name_licensePlate}
   ${conver_string}=     Convert To Lowercase    ${name_licensePlate}
   IF    '${conver_string}' == 'no'
        ${name_licensePlate}=  Set Variable    ${EMPTY}
   END
   ${locator}=     Dymanic Xpath  ${name_services}  ${name_tableServices}
   ${text}=  Get Text  ${locator}
   Compare Text     ${locator}     ${name_services}
   Compare Text     ${info_licensePlate}    ${name_licensePlate}

Update Time According To TCs Service
    [Arguments]     ${Time}
    ${conver_string}=     Convert To Lowercase    ${Time}
    IF    '${conver_string}' == 'happycase'
         Update Time From Dabata
    ELSE IF  '${conver_string}'=='after'
          Update Time After Registration From Databa BookingRoom
    ELSE IF  '${conver_string}'=='likable'
          Update Time From Dabata Check-In Period Overlaps With Stay Period
    ELSE
          Update Time Before Registration From Databa BookingRoom
    END

Check If The Service Student Wanna Register Has Connect DB Delete
    [Arguments]      ${MSSV}  ${name_service}
    ${locator_text}=     Dymanic Xpath  ${name_service}  ${name_tableServices}
    ${status}=  Run Keyword And Return Status    Element Should Be Visible  ${locator_text}
    IF  '${status}'== 'True'
        ${get_text}=    Get Text    ${locator_text}
        Should Be Equal As Strings    ${get_text}    ${name_service}
        Delete Services And Reload Page   ${MSSV}   ${name_service}
    ELSE
        RETURN  Next Step
    END

Check Service Then Student Is Previously Registered
    [Arguments]   ${name_service}
    ${locator_text}=     Dymanic Xpath  ${name_service}  ${name_tableServices}
    ${get_text}=    Get Text    ${locator_text}
    Should Be Equal As Strings    ${name_service}    ${get_text}

Verify Notification Register Faily Should Be Displayed
    [Arguments]     ${mess_1}   ${mess_2}
    Compare Text    ${locatorSuccess}     ${mess_1}
    Compare Text    ${locatorSuccess_1}     ${mess_2}
    ${status}=  Run Keyword And Return Status    Element Should Be Visible  ${submit_messfail_1}
    IF    '${status}' == 'True'
        Click Element   ${submit_messfail_1}
    ELSE
         Pass Execution    Test Case Fail
    END

    
Click Confirm Register
   Sleep    0.5s