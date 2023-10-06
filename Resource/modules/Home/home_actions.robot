*** Settings ***
Resource        home_locator.robot
Resource    ../../../Resource/commons/init.resource
*** Keywords ***
# Custom cai key nay
Verify Menu Home Icon
    ${list}  Create List
    FOR     ${element}  IN  @{listMenuIcon}
            Wait Until Element Is Visible    xpath=//section[@id="hero"]//div//div//div//h3[a="${element}"]
            ${Temp}=   Set Variable  xpath=//section[@id="hero"]//div//div//div//h3[a="${element}"]
            Element Should Be Visible    ${Temp}
            Append To List    ${list}    ${Temp}
    END
    Log To Console    ${list}
Verify Dashboard Home Page
    ${list}     Create List
        FOR     ${element}  IN  @{lishDashboar}
            Wait Until Element Is Visible    xpath=//header//nav//li//a[contains(text(),"${element}")]
            ${Temp}=   Set Variable  xpath=//header//nav//li//a[contains(text(),"${element}")]
            Element Should Be Visible    ${Temp}
            Append To List    ${list}    ${Temp}
    END
    Log To Console  ${list}
Verify Slogan And Logo Home PAge
    #custom key này lại
    Wait Until Element Is Visible    ${iconLogo}
    Wait Until Element Is Visible    ${sloganHome_1}
    Wait Until Element Is Visible    ${sloganHome_2}
    ${text_logo}=   Get Text    ${iconLogo}
    ${text_slogan1}=    Get Text    ${sloganHome_1}
    ${text_slogan2}=    Get Text    ${sloganHome_2}
    Should Be Equal As Strings    ${text_logo}    ${logoHome}
    Should Be Equal As Strings    ${text_slogan1}   ${sloganMess_1}
    Should Be Equal As Strings    ${text_slogan2}   ${sloganMess_2}

