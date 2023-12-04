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
        Verify Notification Register Faily Should Be Displayed

