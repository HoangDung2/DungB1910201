*** Settings ***
#Library    SeleniumLibrary
Resource    ../../../Resource/commons/init.resource
*** Variables ***
${yes}    1
${no}     0
*** Keywords ***
# có máy lạnh
# cho phép nấu ăn
Choose Range type
    [Arguments]  ${string}
    RETURN  xpath=//label[text()='${string}']//parent::div//input
# so luong nguoi trong phong
Choose Number
    [Arguments]    ${number}
    RETURN  xpath=//select//option[@value='${number}']

Navigate To The RoomType Page By Click Nav Link RoomType
    Wait Until Element Is Visible   ${locartorNavRoom}
    Click Element    ${locartorNavRoom}
    Sleep    1s

Verify RoomType Page Should Be Displayed
    Compare Text    ${locatorRoomtype}     ${messRoomType}
    Compare Text    ${locatorChoseRoom}    ${messChoseRoom}

Verify Room Have 'May Lanh' Should Be Displayed
    [Arguments]     ${number}
    ${number_room_db}=  Get Length Number Room Have Number Of People And Air_conditioned    ${number}
    Wait Until Element Is Visible    ${locartorRoom}
    ${elements}=    Get WebElements    ${locartorRoom}
    ${length_elements}=  Get Length    ${elements}
    FOR  ${element}  IN  @{elements}
        ${text}=   Get Element Table  ${messAir}  ${locatorInfoRoom}
        Should Be Equal    ${text}    ${messStatisAir}
    END
    Should Be Equal    ${number_room_db}    ${length_elements}
    Sleep    3s

Verify Room Cooking Should Be Displayed
    [Arguments]     ${number}
    ${number_room_db}=  Get Length Number Room Have Number Of People And Cooking    ${number}
    Wait Until Element Is Visible    ${locartorRoom}
    ${elements}=    Get WebElements    ${locartorRoom}
    ${length_elements}=  Get Length    ${elements}
    FOR  ${element}  IN  @{elements}
        ${text}=   Get Element Table  ${messCook}  ${locatorInfoRoom}
        Should Be Equal    ${text}    ${messStatuscook}
    END
    Should Be Equal    ${number_room_db}    ${length_elements}
    Sleep    3s
Verify Room Have Cooking And Air_Condi Should Be Displayed
    [Arguments]     ${number}
    ${number_room_db}=  Get Length Number Room Have Number Of People And Coblab Cooking, Air_conditioned    ${number}
    Wait Until Element Is Visible    ${locartorRoom}
    ${elements}=    Get WebElements    ${locartorRoom}
    ${length_elements}=  Get Length    ${elements}
    FOR  ${element}  IN  @{elements}
        ${text}=   Get Element Table  ${messCook}  ${locatorInfoRoom}
        ${text1}=   Get Element Table  ${messAir}  ${locatorInfoRoom}
        Should Be Equal    ${text}    ${messStatuscook}
        Should Be Equal    ${text1}    ${messStatisAir}
    END
    Should Be Equal    ${number_room_db}    ${length_elements}
    Sleep    3s

Verifyl Room Have All Air_conditioned Should Be Displayed
    ${number_room_db}=  Get Length Number Room Have All Air_conditioned
    Wait Until Element Is Visible    ${locartorRoom}
    ${elements}=    Get WebElements    ${locartorRoom}
    ${length_elements}=  Get Length    ${elements}
    FOR  ${element}  IN  @{elements}
        ${text}=   Get Element Table  ${messAir}  ${locatorInfoRoom}
        Should Be Equal    ${text}    ${messStatisAir}
    END
    Should Be Equal    ${number_room_db}    ${length_elements}
    Sleep    3s

Verify Room Have All Cooking Should Be Displayed
    ${number_room_db}=  Get Length Number Room Have All Cooking
    Wait Until Element Is Visible    ${locartorRoom}
    ${elements}=    Get WebElements    ${locartorRoom}
    ${length_elements}=  Get Length    ${elements}
    FOR  ${element}  IN  @{elements}
        ${text}=   Get Element Table  ${messCook}  ${locatorInfoRoom}
        Should Be Equal    ${text}    ${messStatuscook}
    END
    Should Be Equal    ${number_room_db}    ${length_elements}
    Sleep    3s

Verify Room Have All Cooking And Air_conditioned Should Be Displayed
    ${number_room_db}=  Get Length Number Room Have All Cooking And Air_conditioned
    Wait Until Element Is Visible    ${locartorRoom}
    ${elements}=    Get WebElements    ${locartorRoom}
    ${length_elements}=  Get Length    ${elements}
    FOR  ${element}  IN  @{elements}
        ${text}=   Get Element Table  ${messCook}  ${locatorInfoRoom}
        ${text1}=   Get Element Table  ${messAir}  ${locatorInfoRoom}
        Should Be Equal    ${text}    ${messStatuscook}
        Should Be Equal    ${text1}    ${messStatisAir}
    END
    Should Be Equal    ${number_room_db}    ${length_elements}
    Sleep    3s