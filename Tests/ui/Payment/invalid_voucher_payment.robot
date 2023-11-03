*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
Test Teardown   Close Browser Set Up Time Payment
Test Template   Validate Student Pay Online And Using Method Input Code Voucher Faily
Test Tags   LV
*** Test Cases ***
TC_85: Validate Student Pay Online And Uses Voucher Over Number
    [Documentation]
    [Tags]  Payment_Voucher_Faily
    ${USER_PAYMENT}  ${PASS_PAYMENT}  ${TC_85.CONDITION}    ${TC_85.CODE}
TC_86: Validate Student Pay Online And Uses Voucher Invalid Time
    [Documentation]
    [Tags]  Payment_Voucher_Faily
    ${USER_PAYMENT}  ${PASS_PAYMENT}  ${TC_86.CONDITION}    ${TC_86.CODE}
TC_87: Validate Student Pay Online And Input Any Code String Character
    [Documentation]
    [Tags]  Payment_Voucher_Faily
    ${USER_PAYMENT}  ${PASS_PAYMENT}  ${TC_87.CONDITION}    ${TC_87.CODE}
TC_88: Validate Student Pay Online And Input Any Code Integer String
    [Documentation]
    [Tags]  Payment_Voucher_Faily
    ${USER_PAYMENT}  ${PASS_PAYMENT}  ${TC_88.CONDITION}    ${TC_88.CODE}
TC_89: Validate Student Pay Online And Input Any Code String Of Characters And Integers
    [Documentation]
    [Tags]  Payment_Voucher_Faily
    ${USER_PAYMENT}  ${PASS_PAYMENT}  ${TC_89.CONDITION}    ${TC_89.CODE}
TC_90: Validate Student Pay Online And Input Any Code String Special Character
    [Documentation]
    [Tags]  Payment_Voucher_Faily
    ${USER_PAYMENT}  ${PASS_PAYMENT}  ${TC_90.CONDITION}    ${TC_90.CODE}
*** Keywords ***
Validate Student Pay Online And Using Method Input Code Voucher Faily
        [Documentation]
        [Arguments]     ${username}     ${password}     ${condition}    ${code}
        Given Student Login Into Dormitory System And Check All Information In InForStudent Page    ${username}  ${password}
        And Click In 'đây' Then Payment
        And Wait Page Should Be Displayed
        Then Verify VNPAY Page Should Be Displayed
        And Capture and Save Screenshot
        And Input Full Info Card Need Payment
        And Waiting Reload Page
        And Capture and Save Screenshot
        And Chose Voucher Input Code Then Use According To Condition   ${condition}    ${code}





