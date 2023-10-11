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

Verify Dashboard Home Page
    ${list}     Create List
        FOR     ${element}  IN  @{lishDashboar}
            Wait Until Element Is Visible    xpath=//header//nav//li//a[contains(text(),"${element}")]
            ${Temp}=   Set Variable  xpath=//header//nav//li//a[contains(text(),"${element}")]
            Element Should Be Visible    ${Temp}
            Append To List    ${list}    ${Temp}
    END

Verify Slogan And Logo Home PAge
    Compare Text    ${iconLogo}     ${logoHome}
    Compare Text    ${sloganHome_1}     ${sloganMess_1}
    Compare Text    ${sloganHome_2}     ${sloganMess_2}

Click Nav Service
    Wait Until Element Is Visible   ${locatorService}
    Click Element   ${locatorService}
    Sleep    2s

Click Nav MaterialRepair
    Wait Until Element Is Visible   ${locatorMaterialRepair}
    Click Element    ${locatorMaterialRepair}
    Sleep    2s

