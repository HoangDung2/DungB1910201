*** Settings ***
Resource    ../../../Resource/commons/init.resource
*** Keywords ***
Verify The Manage Serivces Page Should Be Displayed
    Compare Text    ${tilt_mana_servicers}    QUẢN LÝ DỊCH VỤ

Input Name Service Wanna Edit
    [Arguments]     ${name_services}
    ${locator}=     Dymanic Xpath  ${name_services}  ${lct_edit_services}
    RETURN  ${locator}

Click 'Chỉnh sửa' Then Edit Services
    [Arguments]     ${name_services}
    ${locator}=   Input Name Service Wanna Edit  ${name_services}
    Click Element   ${locator}
    Sleep    5s

Input The Fields You Wanna To
    [Arguments]   ${name}   ${prices}   ${content}   ${status}
    ${length_name}=  Get Length  ${name}
    IF  ${length_name} == 0
        RETURN  Next Step
    ELSE
        ${locator_name}=     Dymanic Xpath   name   ${lct_form_edit_serives}
        Input Text   ${locator_name}   ${name}
    END

    ${length_prcies}=  Get Length  ${prices}
    IF  ${length_prcies} == 0
        RETURN  Next Step
    ELSE
        ${locator_prices}=     Dymanic Xpath    price     ${lct_form_edit_serives}
        Input Text   ${locator_prices}  ${prices}
    END

    ${length_content}=  Get Length  ${content}
    IF  ${length_content} == 0
        RETURN  Next Step
    ELSE
        Wait Until Element Is Visible   ${lct_content_form}
        Input Text   ${lct_content_form}    ${content}
    END

    IF    '${status}' == 'Continue'
        ${locator_status}=     Dymanic Xpath  true  ${lct_status_form}
        Wait Until Element Is Visible   ${locator_status}
        Click Element    ${locator_status}
    ELSE
        ${locator_status_false}=     Dymanic Xpath  false   ${lct_status_form}
        Wait Until Element Is Visible   ${locator_status_false}
        Click Element    ${locator_status_false}
    END

Send By Click 'Cập nhật'
    Wait Until Element Is Visible    ${lct_submit_form_res}
    Click Element    ${lct_submit_form_res}
    Sleep    1s

Verify Notification Update Succesfully
     Compare Text   ${locatorTitleMess}    Thành công
     Compare Text   ${locatorTitleMess_1}    Bạn đã cập nhật thành công

Verify Notification Register From To Admin Faily Should Be Displayed
    ${status}=  Compare Text    ${locatorSuccess}   ${messSuccess}
    IF    '${status}' == 'True'
        Pass Execution    Test Case Fail
    END

Verify Notification Update Faily
     [Arguments]    ${mess}
     Compare Text   ${locatorTitleMess}    Thất bại
     Compare Text   ${locatorTitleMess_1}    ${mess}

Login Into Dormitory Student System Then Check
        [Arguments]  ${name_service}    ${name_licensePlate}
        Student Login Into Dormitory System     ${USERNAME_MANAGE_SERVICES}   ${PASS_MANAGE_SERVICES}
        Verify Home Page Should Be Displayed
        Capture and Save Screenshot
        Navigate To The Info Student Page By Click Nav Link Info Student
        Verify Info Student Page Should Be Displayed
        Check All Info Sudent With Databse  ${USERNAME_MANAGE_SERVICES}
        Capture and Save Screenshot
        Check If The Service Student Wanna Register Has Connect DB Delete   ${USERNAME_MANAGE_SERVICES}  ${name_service}
        Navigate To The Services Page By Click Nav Link Services
        Verify Services Page Should Be Displayed
        Capture and Save Screenshot
        Input Motorbike License Plate If Student Regisvices Send Motorbike  ${name_licensePlate}
        Input Services Student Want To Register  ${name_service}
        Capture and Save Screenshot
        Submit Confirm Register
        Verify Notification Register From To Admin Faily Should Be Displayed

Verify The Manage Register Services Page Should Be Displayed
    Compare Text    ${tilt_manaRe_serivers}   DỊCH VỤ SINH VIÊN ĐÃ ĐĂNG KÝ

Input Fields To Search
    [Arguments]  ${methods}  ${MSSV}  ${semester}   ${schoolYear}   ${major}    ${numberStudent}  ${gender}
    IF    '${methods}' == 'InputMssv'
           Wait Until Element Is Visible    ${lct_input_mssv}
           Input Text    ${lct_input_mssv}    ${MSSV}
    ELSE
           # semsemster
           IF    '${semester}' == 'No'
               RETURN  Next Step
           ELSE
                ${lct_semester}=     Dymanic Xpath  ${mess_semester}  ${lct_all_files}
                Wait Until Element Is Visible   ${lct_semester}
                Click Element    ${lct_semester}
                ${lct_op_semester}=     Dymanic Xpath Three  ${mess_semester}  sesmester  ${semester}  ${lct_option}
                ${status}=  Run Keyword And Return Status  Element Should Be Visible  ${lct_op_semester}
                IF    '${status}' == 'True'
                    Wait Until Element Is Visible    ${lct_op_semester}
                    Click Element    ${lct_op_semester}
                ELSE
                     RETURN    Not Find ${semester}
                END
           END
           # schoolYear
           IF    '${schoolYear}' == 'No'
               RETURN  Next Step
           ELSE
                ${lct_schoolYear}=     Dymanic Xpath  ${mess_year}  ${lct_all_files}
                Wait Until Element Is Visible   ${lct_semester}
                Click Element    ${lct_semester}
                ${lct_op_year}=     Dymanic Xpath Three  ${mess_year}  schoolYear  ${schoolYear}  ${lct_option}
                ${status}=  Run Keyword And Return Status  Element Should Be Visible  ${lct_op_year}
                IF    '${status}' == 'True'
                    Wait Until Element Is Visible    ${lct_op_year}
                    Click Element    ${lct_op_year}
                ELSE
                     RETURN    Not Find ${schoolYear}
                END
           END
           # major
           IF    '${major}' == 'No'
               RETURN  Next Step
           ELSE
                ${lct_major}=     Dymanic Xpath  ${mess_field}  ${lct_all_files}
                Wait Until Element Is Visible   ${lct_major}
                Click Element    ${lct_major}
                ${lct_op_major}=     Dymanic Xpath Three  ${mess_field}  major  ${major}  ${lct_option}
                ${status}=  Run Keyword And Return Status  Element Should Be Visible  ${lct_op_major}
                IF    '${status}' == 'True'
                    Wait Until Element Is Visible    ${lct_op_major}
                    Click Element    ${lct_op_major}
                ELSE
                     RETURN    Not Find ${major}
                END
           END

          #numberStudent
           IF    '${numberStudent}' == 'No'
               RETURN  Next Step
           ELSE
                ${lct_numberStudent}=     Dymanic Xpath  ${mess_buckle}  ${lct_all_files}
                Wait Until Element Is Visible   ${lct_numberStudent}
                Click Element    ${lct_numberStudent}
                ${lct_op_numberStudent}=     Dymanic Xpath Three  ${mess_buckle}  numberStudent  ${numberStudent}  ${lct_option}
                ${status}=  Run Keyword And Return Status  Element Should Be Visible  ${lct_op_numberStudent}
                IF    '${status}' == 'True'
                    Wait Until Element Is Visible    ${lct_op_numberStudent}
                    Click Element    ${lct_op_numberStudent}
                ELSE
                     RETURN    Not Find ${numberStudent}
                END
           END
           #    gender
           IF    '${gender}' == 'No'
               RETURN  Next Step
           ELSE
                IF    '${gender}' == 'Nam'
                    ${value_gender}=    Set Variable    1
                ELSE
                    ${value_gender}=    Set Variable    0
                END
                ${lct_gender}=     Dymanic Xpath  ${mess_gender}  ${lct_all_files}
                Wait Until Element Is Visible   ${lct_gender}
                Click Element    ${lct_gender}
                ${lct_op_gender}=     Dymanic Xpath Three  ${mess_gender}  gender  ${value_gender}  ${lct_option}
                ${status}=  Run Keyword And Return Status  Element Should Be Visible  ${lct_op_gender}
                IF    '${status}' == 'True'
                    Wait Until Element Is Visible    ${lct_op_gender}
                    Click Element    ${lct_op_gender}
                ELSE
                     RETURN    Not Find ${gender}
                END
           END
    END

Verify Information Search Should Be Displayed
    ${status}=  Run Keyword And Return Status  Element Should Be Visible  ${lct_page_mana_services}
    IF    '${status}' == 'True'
        ${elements}=    Get WebElements    ${lct_page_mana_services}
        FOR    ${element}    IN    @{elements}
            Click Element   ${element}
            Sleep    0.5s
            Capture and Save Screenshot
        END

    ELSE
        Capture and Save Screenshot
        RETURN  Next Step
    END
