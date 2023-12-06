*** Settings ***
Resource    ../../../Resource/commons/init.resource
*** Keywords ***
Verify The Manage Manage Student Page Should Be Displayed
     Compare Text    ${lct_title_manage_student}     HỢP ĐỒNG KÝ TÚC XÁ

Verify Information Search In Manage Student Should Be Displayed
    ${status}=  Run Keyword And Return Status  Element Should Be Visible  ${lct_page_mana_student}
    IF    '${status}' == 'True'
        ${elements}=    Get WebElements    ${lct_page_mana_student}
        FOR    ${element}    IN    @{elements}
            Click Element   ${element}
            Sleep    0.5s
            Capture and Save Screenshot
        END

    ELSE
        Capture and Save Screenshot
        RETURN  Next Step
    END