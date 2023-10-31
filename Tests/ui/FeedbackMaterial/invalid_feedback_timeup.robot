*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Teardown   Close Browser Set Up Time
Test Template   Validata Student Have Content Material And Number But Register Time Up or Over Time
#Test Tags   FeedBack
Test Tags   LV
*** Test Cases ***
TC_51: Validata Student Have Choose Content Material And Fill Number Of 5 But Is't Register time
     [Tags]     FeedBackFaily
     ${USERNAME}   ${PASS_FEEDBACK}  ${TC_51.TIME}   ${TC_51.SELECT_METERIAL}    ${TC_51.NUMBER_METERIAL}    ${TC_51.MESS}
TC_52: Validata Student Have Choose Content Material And Fill Number Of 1 But Is't Register time
     [Tags]     FeedBackFaily
     ${USERNAME}   ${PASS_FEEDBACK}  ${TC_52.TIME}   ${TC_52.SELECT_METERIAL}    ${TC_52.NUMBER_METERIAL}    ${TC_52.MESS}
TC_53: Validata Student Have Choose Content Material And Fill Number Of 6 But Is't Register time
     [Tags]     FeedBackFaily
     ${USERNAME}   ${PASS_FEEDBACK}  ${TC_53.TIME}   ${TC_53.SELECT_METERIAL}    ${TC_53.NUMBER_METERIAL}    ${TC_53.MESS}
TC_54: Validata Student Have Choose Content Material And Fill 2 Number But Is't Register time
     [Tags]     FeedBackFaily
     ${USERNAME}   ${PASS_FEEDBACK}  ${TC_54.TIME}   ${TC_54.SELECT_METERIAL}    ${TC_54.NUMBER_METERIAL}    ${TC_54.MESS}
TC_55: Validata Student Have Choose Content Material And Fill Infinity But Is't Register time
     [Tags]     FeedBackFaily
     ${USER_FEEDBACK}   ${PASS_FEEDBACK}  ${TC_55.TIME}   ${TC_55.SELECT_METERIAL}    ${TC_55.NUMBER_METERIAL}    ${TC_55.MESS}
TC_56: Validata Student Have Choose Content Material And Fill Number Of 0 But Is't Register time
     [Tags]     FeedBackFaily
     ${USER_FEEDBACK}   ${PASS_FEEDBACK}  ${TC_56.TIME}   ${TC_56.SELECT_METERIAL}    ${TC_56.NUMBER_METERIAL}    ${TC_56.MESS}

TC_57: Validata Student Have Choose Content Material And Fill Number Of 5 But Register Over Time
     [Tags]     FeedBackFaily
     ${USER_FEEDBACK}   ${PASS_FEEDBACK}  ${TC_57.TIME}   ${TC_57.SELECT_METERIAL}    ${TC_57.NUMBER_METERIAL}    ${TC_57.MESS}
TC_58: Validata Student Have Choose Content Material And Fill Number Of 1 But Register Over Time
     [Tags]     FeedBackFaily
     ${USER_FEEDBACK}   ${PASS_FEEDBACK}  ${TC_58.TIME}   ${TC_58.SELECT_METERIAL}    ${TC_58.NUMBER_METERIAL}    ${TC_58.MESS}
TC_59: Validata Student Have Choose Content Material And Fill Number Of 6 But Register Over Time
     [Tags]     FeedBackFaily
     ${USER_FEEDBACK}   ${PASS_FEEDBACK}  ${TC_59.TIME}   ${TC_59.SELECT_METERIAL}    ${TC_59.NUMBER_METERIAL}    ${TC_59.MESS}
TC_60: Validata Student Have Choose Content Material And Fill 2 Number But Register Over Time
     [Tags]     FeedBackFaily
     ${USER_FEEDBACK}   ${PASS_FEEDBACK}  ${TC_60.TIME}   ${TC_60.SELECT_METERIAL}    ${TC_60.NUMBER_METERIAL}    ${TC_60.MESS}
TC_61: Validata Student Have Choose Content Material And Fill Infinity But Register Over Time
     [Tags]     FeedBackFaily
     ${USER_FEEDBACK}   ${PASS_FEEDBACK}  ${TC_61.TIME}   ${TC_61.SELECT_METERIAL}    ${TC_61.NUMBER_METERIAL}    ${TC_61.MESS}
TC_62: Validata Student Have Choose Content Material And Fill Number Of 0 But Register Over Time
     [Tags]     FeedBackFaily
     ${USER_FEEDBACK}   ${PASS_FEEDBACK}  ${TC_62.TIME}   ${TC_62.SELECT_METERIAL}    ${TC_62.NUMBER_METERIAL}    ${TC_62.MESS}
*** Keywords ***
Validata Student Have Content Material And Number But Register Time Up or Over Time
        [Documentation]  This test case verifies then All Case Register Material Time Up
        ...              ${Time} It maybe HappyCase, Before or After Then Run keyword according to ${Time}
        ...              ${select_meterial} It have maybe ( Hư cửa lùa  Bể gạch nền  Thay khoen khóa cửa  Bản lề cửa sổ
        ...              Hư cửa tủ   Rớt la phong   Phòng dột   Mất điện  Hư đồng hồ điện  Cháy công tắc  Nghẹt bồn cầu  Nghẹt cống
        ...              Đèn phòng hư   Đèn nhà tắm hư   Vòi nước bị rỉ)  Depends on the sutdent select
        ...              And  ${select_meterial} Value 'No' It's Indicated That Student Did't choose
        ...              ${number_meterial}  It have value student input 0 <= ${number_meterial} <= 5 And
        ...              Value 'No' It's Indicated That Student Did't choose
        [Arguments]     ${USERNAME}   ${PASSWORD}   ${Time}   ${select_meterial}    ${number_meterial}     ${mess}
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
        And Wait Notification Should Be Displayed
        And Verify Message Fail Should Be Displayed    ${mess}
        And Capture and Save Screenshot

