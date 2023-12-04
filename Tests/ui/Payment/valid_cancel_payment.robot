*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Teardown   Close Browser Set Up Time Payment
Test Tags   LV
*** Test Cases ***
TC_91: Validate Notification Sudent Have Payment Online Cancel After Input Full Info Card Payment
    [Documentation]
    [Tags]  PaymentCancel
    Given Student Login Into Dormitory System And Check All Information In InForStudent Page        ${USER_PAYMENT}  ${PASS_PAYMENT}
    And Click In 'đây' Then Payment
    And Wait Page Should Be Displayed
    And Verify VNPAY Page Should Be Displayed
    And Capture and Save Screenshot
    And Input Full Info Card Need Payment
    And Capture and Save Screenshot
    And Click In 'Hủy thanh toán' Then Cancel
    And Alert Cancel Should Be Displayed
    And Capture and Save Screenshot
    And Wait Page Should Be Displayed
    Then Verify Nofication Cancel Should Be Displayed
    And Capture and Save Screenshot


TC_92: Validate Notification Sudent Have Payment Online Cancel Before Input Code OTP
    [Documentation]
    [Tags]  PaymentCancel
    Given Student Login Into Dormitory System And Check All Information In InForStudent Page       ${USER_PAYMENT}  ${PASS_PAYMENT}
    And Click In 'đây' Then Payment
    And Wait Page Should Be Displayed
    And Verify VNPAY Page Should Be Displayed
    And Capture and Save Screenshot
    And Input Full Info Card Need Payment
    And Capture and Save Screenshot
    And Click In 'Tiếp tục' Then Payment
    And Wait Page Should Be Displayed
    And Verify Confirm Payment Should Be Displayed
    And Click In 'Hủy thanh toán' Then Cancel
    And Alert Cancel Should Be Displayed
    And Capture and Save Screenshot
    And Wait Page Should Be Displayed
    Then Verify Nofication Cancel Should Be Displayed
    And Capture and Save Screenshot




