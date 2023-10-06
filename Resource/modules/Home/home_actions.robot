*** Settings ***
Resource        home_locator.robot
Resource    ../../../Resource/commons/init.resource
*** Keywords ***
# Custom cai key nay
Verify Menu Home Icon
    [Arguments]     @{listElement}
    ${storeIDhero}  Create List
    FOR     ${element}  IN  @{listElement}
            Wait Until Element Is Visible    xpath=//section[@id="hero"]//div//div//div//h3[a="${element}"]
            ${Temp}=   Set Variable  xpath=//section[@id="hero"]//div//div//div//h3[a="${element}"]
            Element Should Be Visible    ${Temp}
            Append To List    ${storeIDhero}    ${Temp}
    END
    Log To Console    ${storeIDhero}
Verify Dashboard Home Page
    [Arguments]     @{lishDashboar}
    ${list}     Create List
        FOR     ${element}  IN  @{lishDashboar}
            Wait Until Element Is Visible    xpath=//header//nav//li//a[contains(text(),"${element}")]
            ${Temp}=   Set Variable  xpath=//header//nav//li//a[contains(text(),"${element}")]]
            Element Should Be Visible    ${Temp}
            Append To List    ${list}    ${Temp}
    END
    Log To Console  ${list}
