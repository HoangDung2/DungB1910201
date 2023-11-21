*** Settings ***
Resource    login_actions.robot
Resource    ../../../Resource/commons/init.resource
*** Keywords ***
User input Username And Password
    [Arguments]   ${username}    ${password}
    Input Username    ${username}
    login_actions.Input Password    ${password}
Verify Username and Password Is Invaid
    [Arguments]     ${username}     ${password}
    Verify That from Fill In Username And Password Are Displayed
    ${text_user}=   Get Value    ${locatorUsername}
    ${text_password}=   Get Value    ${locatorPassword}
    Should Contain    ${text_user}    ${username}
    Should Contain    ${text_password}    ${password}
Verify That from Fill In Username And Password Are Displayed
    Wait Until Element Is Visible    ${locatorUsername}
    Wait Until Element Is Visible    ${locatorPassword}
Verify Failed Login Message
    [Arguments]     ${locator}      ${mess}
    Wait Until Element Is Visible    ${locator}
    ${text}=    Get Text    ${locator}
    Should Contain   ${text}  ${mess}
Verify Home Page Should Be Displayed
    Verify Menu Home Icon
    Verify Dashboard Home Page
    Verify Slogan And Logo Home Page
#---------------- Admin
Verify Manage Page Should Be Displayed
    Compare Text      ${title_admin}    ${messTitle_Admin}
    Element Should Be Visible   ${logo_admin}

Logout If Admin Wanna
    [Arguments]  ${status}
    ${conver_string}=    Convert To Lowercase    ${status}
    IF    '${conver_string}' == 'yes'
        Wait Until Element Is Visible   ${lct_info_user_admin}
        Click Element    ${lct_info_user_admin}
        Sleep    1s
        Capture and Save Screenshot
        Wait Until Element Is Visible    ${locator_logout_admin}
        Click Element    ${locator_logout_admin}
    ELSE
        Pass Execution    Login Succesfully
    END