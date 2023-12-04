*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Teardown   Close Browser Set Up Time Payment
Test Template   Validate Student Pay Online And Methods Of Using Vouchers
Test Tags   LV
*** Test Cases ***
TC_83: Validate Student Pay Online And Method Click 'Áp dụng' Then Use Voucher
    [Documentation]  This test case validate method pay online by click 'Áp dụng'
    [Tags]  PaymentVoucher
    ${USER_PAYMENT}  ${PASS_PAYMENT}  ${TC_83.METHOD}
TC_84: Validate Student Pay Online And Method Input Code Then Use Voucher
    [Documentation]  This test case validate method pay online by input code
    [Tags]  PaymentVoucher
    ${USER_PAYMENT}  ${PASS_PAYMENT}  ${TC_84.METHOD}
*** Keywords ***
Validate Student Pay Online And Methods Of Using Vouchers
        [Documentation]
        [Arguments]     ${username}     ${password}     ${method}
        Given Student Login Into Dormitory System And Check All Information In InForStudent Page    ${username}  ${password}
        And Click In 'đây' Then Payment
        And Wait Page Should Be Displayed
        And Verify VNPAY Page Should Be Displayed
        And Capture and Save Screenshot
        And Input Full Info Card Need Payment
        And Chose Methods Use Voucher   ${method}
        And Waiting Reload Page
        Then Verify Voucher Is Applied  ${username}
        And Capture and Save Screenshot




