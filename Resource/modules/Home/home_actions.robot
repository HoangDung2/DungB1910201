*** Settings ***
Resource        home_locator.robot
Resource    ../../../Resource/commons/init.resource
*** Keywords ***
Verify Menu Home Icon
    [Arguments]     @{listElement}  ${file}
    ${element}  Get WebElements ${danamicIDhero}
    Wait Until Element Is Visible    ${element}
    ${storeIDhero}  Create List
    FOR    ${elements}    IN    @{element}
            Wait Until Element Is Visible    xpath=//section[@id="hero"]//div//div//div//h3[a="${elements}"]
            ${Temp}   Set Variable  xpath=//section[@id="hero"]//div//div//div//h3[a="${elements}"]
            Element Should Be Visible    ${Temp}
            Append To List    ${storeIDhero}    ${Temp}
    END
    Take Screenshot ${file}

