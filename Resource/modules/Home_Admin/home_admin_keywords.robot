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

Navigate To The Manage Register Services Page
    Wait Until Element Is Visible   ${nav_dash_manage}
    Click Element    ${nav_dash_manage}
    Wait Until Element Is Visible   ${nav_manageRegis_serives}
    Click Element    ${nav_manageRegis_serives}

Navigate To The Add Room Type Page
    Wait Until Element Is Visible   ${nav_dash_manage}
    Click Element    ${nav_dash_manage}
    Wait Until Element Is Visible   ${nav_add_room}
    Click Element    ${nav_add_room}

Navigate To The Detail Room Type Page And Check
    Wait Until Element Is Visible   ${nav_dash_manage}
    Click Element    ${nav_dash_manage}
    Wait Until Element Is Visible   ${nav_detail_room}
    Click Element    ${nav_detail_room}
    Scroll From Top to Bottom of Page And Capture Page Screenshot Room

Navigate To The Detail Room Type Page
    Wait Until Element Is Visible   ${nav_dash_manage}
    Click Element    ${nav_dash_manage}
    Wait Until Element Is Visible   ${nav_detail_room}
    Click Element    ${nav_detail_room}