*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Template   Verify Notification Send Bill But Previous Bill Does Exist
Test Teardown   Close Browser Set Up Time
Test Tags   LV
*** Test Cases ***
TC_160: Validate Contains Send Bill But Previous Bill Does Exist
    [Documentation]
    [Tags]  160
    ${TC_160.USER}   ${TC_160.PASS}  ${TC_160.ROOMTYPE}  ${TC_160.NUMBER}   ${TC_160.WATER}   ${TC_160.ELECTRIC}  ${TC_160.MESS}
TC_161: Validate Contains Send Bill Fill Water And Electric Less Then Current But Previous Bill Does Exist
    [Documentation]
    [Tags]  160
    ${TC_161.USER}   ${TC_161.PASS}  ${TC_161.ROOMTYPE}  ${TC_161.NUMBER}   ${TC_161.WATER}   ${TC_161.ELECTRIC}  ${TC_161.MESS}
TC_162: Validate Contains Send Bill Fill Water And Electric A Negative Integer But Previous Bill Does Exist
    [Documentation]
    [Tags]  160
    ${TC_162.USER}   ${TC_162.PASS}  ${TC_162.ROOMTYPE}  ${TC_162.NUMBER}   ${TC_162.WATER}   ${TC_162.ELECTRIC}  ${TC_162.MESS}
TC_163: Validate Contains Send Bill Fill Water And Electric 0 But Previous Bill Does Exist
    [Documentation]
    [Tags]  160
    ${TC_163.USER}   ${TC_163.PASS}  ${TC_163.ROOMTYPE}  ${TC_163.NUMBER}   ${TC_163.WATER}   ${TC_163.ELECTRIC}  ${TC_163.MESS}
*** Keywords ***
Verify Notification Send Bill But Previous Bill Does Exist
    [Documentation]
    [Arguments]     ${USER}   ${PASS}  ${ROOMTYPE}  ${NUMBER}   ${WATER}   ${ELECTRIC}  ${MESS}
    Given Student Login Into Dormitory System     ${USER}   ${PASS}
    Then Verify Home Page Should Be Displayed
    And Capture and Save Screenshot
    When Navigate To The Info Student Page By Click Nav Link Info Student
    Then Verify Info Student Page Should Be Displayed
    And Scroll From Top to Bottom of Page And Capture Page Screenshot
    And Close Browser
    And Login Into Dormitory Admin System Then Send Bill  ${ROOMTYPE}  ${NUMBER}   ${WATER}   ${ELECTRIC}
    And Verify Error Notification Send Bill Should Be Displayed   ${MESS}

