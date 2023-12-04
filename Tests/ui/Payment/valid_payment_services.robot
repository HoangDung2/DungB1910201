*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Teardown   Close Browser Set Up Time Payment
Test Template   Validate Sudent Have Payment Online Services Or Payment Use Voucher Discount
Test Tags   LV
*** Test Cases ***
TC_95: Validate Sudent Have Payments Online Serives 'Gửi xe máy' And Has't Use Voucher Discount
    [Documentation]
    [Tags]  PaymentService
    ${USER_SERVICE}     ${PASS_SERVICE}   ${TC_95.STATUS}   ${TC_95.NAME_SERVICE}
TC_96: Validate Sudent Have Payments Online Serives 'Gửi xe máy' And Use Voucher Discount
    [Documentation]
    [Tags]  PaymentService
    ${USER_SERVICE}     ${PASS_SERVICE}   ${TC_95.STATUS}   ${TC_95.NAME_SERVICE}

TC_97: Validate Sudent Have Payments Online Serives 'Gửi xe đạp' And Has't Use Voucher Discount
    [Documentation]
    [Tags]  PaymentService
    ${USER_SERVICE}     ${PASS_SERVICE}   ${TC_97.STATUS}   ${TC_97.NAME_SERVICE}
TC_98: Validate Sudent Have Payments Online Serives 'Gửi xe đạp' And Use Voucher Discount
    [Documentation]
    [Tags]  PaymentService
    ${USER_SERVICE}     ${PASS_SERVICE}   ${TC_98.STATUS}   ${TC_98.NAME_SERVICE}

TC_99: Validate Sudent Have Payments Online Serives 'Vệ sinh khu vực' And Has't Use Voucher Discount
    [Documentation]
    [Tags]  PaymentService
    ${USER_SERVICE}     ${PASS_SERVICE}   ${TC_99.STATUS}   ${TC_99.NAME_SERVICE}
TC_100: Validate Sudent Have Payments Online Serives 'Vệ sinh khu vực' And Use Voucher Discount
    [Documentation]
    [Tags]  PaymentService
    ${USER_SERVICE}     ${PASS_SERVICE}   ${TC_100.STATUS}   ${TC_100.NAME_SERVICE}

TC_102: Validate Noficiton Student Have Paid Online 'Gửi xe đạp'
    [Documentation]
    [Tags]  PaymentService
    ${USER_PAID}     ${PASS_PAID}   ${TC_102.STATUS}   ${TC_102.NAME_SERVICE}
TC_103: Validate Noficiton Student Have Paid Online 'Gửi xe máy'
    [Documentation]
    [Tags]  PaymentService
    ${USER_PAID}     ${PASS_PAID}   ${TC_103.STATUS}   ${TC_103.NAME_SERVICE}
TC_104: Validate Noficiton Student Have Paid Online 'Vệ sinh khu vực'
    [Documentation]
    [Tags]  PaymentService
    ${USER_PAID}     ${PASS_PAID}   ${TC_104.STATUS}   ${TC_104.NAME_SERVICE}
*** Keywords ***
Validate Sudent Have Payment Online Services Or Payment Use Voucher Discount
        [Documentation]
        [Arguments]     ${username}     ${password}     ${status}   ${name_service}
        Given Student Login Into Dormitory System And Check All Information In InForStudent Page    ${username}  ${password}
        And Check If The Service Student Wanna Payment Has't Return Nofication    ${name_service}
        And Wait Page Should Be Displayed
        And Verify VNPAY Page Should Be Displayed
        And Capture and Save Screenshot
        And Input Full Info Card Need Payment
        And Use Voucher Discount If Student Wanna   ${status}
        And Waiting Reload Page
        And Capture and Save Screenshot
        And Click In 'Tiếp tục' Then Payment
        And Wait Page Should Be Displayed
        And Verify Confirm Payment Should Be Displayed
        And Capture and Save Screenshot
        And Input Code OTP
        And Capture and Save Screenshot
        And Click In 'Thanh Toán' Then Confirm Payment Succeslly
        And Wait Page Should Be Displayed
        And Verify Online Payment Service Succeslly  ${name_service}    ${username}
        And Capture and Save Screenshot



