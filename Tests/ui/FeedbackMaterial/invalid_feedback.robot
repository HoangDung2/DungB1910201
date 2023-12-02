*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Teardown   Close Browser Set Up Time
Test Template   Validata Student Have Content Material And Number
#Test Tags   FeedBack
Test Tags   LV
*** Test Cases ***
TC_43: Validata Student Have Unchoose Content Material And Unchoose Number
     [Tags]     FeedBackFaily
     ${USERNAME_BOOKING}   ${PASS_BOOKING}  ${TC_43.TIME}   ${TC_43.SELECT_METERIAL}    ${TC_43.NUMBER_METERIAL}    ${TC_43.MESS}
TC_44: Validata Student Have Choose Content Material And Unfill Number
     [Tags]     FeedBackFaily
     ${USERNAME_BOOKING}   ${PASS_BOOKING}  ${TC_44.TIME}   ${TC_44.SELECT_METERIAL}    ${TC_44.NUMBER_METERIAL}    ${TC_44.MESS}
TC_45: Validata Student Have Unchoose Content Material And Fill Number
     [Tags]     FeedBackFaily
     ${USERNAME_BOOKING}   ${PASS_BOOKING}  ${TC_45.TIME}   ${TC_45.SELECT_METERIAL}    ${TC_45.NUMBER_METERIAL}    ${TC_45.MESS}
TC_46: Validata Student Have Unchoose Content Material And Fill Number Of 6
     [Tags]     FeedBackFaily
     ${USERNAME_BOOKING}   ${PASS_BOOKING}  ${TC_46.TIME}   ${TC_46.SELECT_METERIAL}    ${TC_46.NUMBER_METERIAL}    ${TC_46.MESS}
TC_47: Validata Student Have Unchoose Content Material And Fill Infinity Number
     [Tags]     FeedBackFaily
     ${USERNAME_BOOKING}   ${PASS_BOOKING}  ${TC_47.TIME}   ${TC_47.SELECT_METERIAL}    ${TC_47.NUMBER_METERIAL}    ${TC_47.MESS}
TC_48: Validata Student Have Unchoose Content Material And Fill 2 Number
     [Tags]     FeedBackFaily
     ${USERNAME_BOOKING}   ${PASS_BOOKING}  ${TC_48.TIME}   ${TC_48.SELECT_METERIAL}    ${TC_48.NUMBER_METERIAL}    ${TC_48.MESS}
TC_49: Validata Student Have Unchoose Content Material And Fill Negative Number 1
     [Tags]     FeedBackFaily
     ${USERNAME_BOOKING}   ${PASS_BOOKING}  ${TC_49.TIME}   ${TC_49.SELECT_METERIAL}    ${TC_49.NUMBER_METERIAL}    ${TC_49.MESS}
TC_50: Validata Student Have Unchoose Content Material And Fill Number Of 0
     [Tags]     FeedBackFaily
     ${USERNAME_BOOKING}   ${PASS_BOOKING}  ${TC_50.TIME}   ${TC_50.SELECT_METERIAL}    ${TC_50.NUMBER_METERIAL}    ${TC_50.MESS}
*** Keywords ***
Validata Student Have Content Material And Number
        [Documentation]  This test case verifies then All Case Register Material Fail
        ...              ${Time} It maybe HappyCase, Before or After Then Run keyword according to ${Time}
        ...              ${select_meterial} It have maybe ( Hư cửa lùa  Bể gạch nền  Thay khoen khóa cửa  Bản lề cửa sổ
        ...              Hư cửa tủ   Rớt la phong   Phòng dột   Mất điện  Hư đồng hồ điện  Cháy công tắc  Nghẹt bồn cầu  Nghẹt cống
        ...              Đèn phòng hư   Đèn nhà tắm hư   Vòi nước bị rỉ)  Depends on the student select
        ...              And  ${select_meterial} Value 'No' It's Indicated That Student Did't choose
        ...              ${number_meterial}  It have value student input 0 <= ${number_meterial} <= 5 And
        ...              Value 'No' It's Indicated That Student Did't choose
        ...              Note use Id BookingRoom Then All Case This
        [Arguments]     ${USERNAME}   ${PASSWORD}   ${Time}   ${select_meterial}    ${number_meterial}  ${mess}
        Given Student Login Into Dormitory System     ${USERNAME}   ${PASSWORD}
        Then Verify Home Page Should Be Displayed
        And Capture and Save Screenshot
        When Navigate To The Info Student Page By Click Nav Link Info Student
        Then Verify Info Student Page Should Be Displayed
        And Check All Info Sudent With Databse  ${USERNAME}
        And Capture and Save Screenshot
        And Validate Student Has Previously Registered For The Room     ${USERNAME}
        And Capture and Save Screenshot
        And Navigate To The Info Student Page By Click Nav Link Feedback Material
        Then Verify Feedback Page Should Be Displayed
        And Update time according to TCs  ${Time}
        And Select Content Material Have Repaired  ${select_meterial}
        And Input Number If Any  ${number_meterial}
        And Click Confirm
        And Verify Message Fail Should Be Displayed   ${mess}
        And Capture and Save Screenshot

