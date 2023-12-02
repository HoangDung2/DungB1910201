*** Settings ***
Resource    ../../../Resource/commons/init.resource
*** Keywords ***
Verify Bill Room Page Should Be Displayed
    Compare Text    ${tilt_bill}    ${mess_tiltle}

Navigate To The Bill Room Page
    Wait Until Element Is Visible   ${nav_dash_manage}
    Click Element    ${nav_dash_manage}
    Wait Until Element Is Visible   ${nav_bill}
    Click Element    ${nav_bill}

Navigate To The Response Material Page
    Wait Until Element Is Visible   ${nav_dash_manage}
    Click Element    ${nav_dash_manage}
    Wait Until Element Is Visible   ${nav_res_material}
    Click Element    ${nav_res_material}

Navigate To The Manage Services Page
    Wait Until Element Is Visible   ${nav_dash_manage}
    Click Element    ${nav_dash_manage}
    Wait Until Element Is Visible   ${nav_manage_serives}
    Click Element    ${nav_manage_serives}
