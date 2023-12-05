*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Teardown   Close Browser Set Up Time
Test Template   Validate Contains Update Services From Admin Faily
Test Tags   LV
*** Test Cases ***
TC_135: Validate Contains Unfill Form Update Bicycles Register
    [Tags]  ServicesCleanFaily
    ${TC_135.TITLE}   ${TC_135.PRICES}   ${TC_135.CONTENT}   ${TC_135.STATUS}   ${TC_135.NAME_SERVICES}    ${TC_135.MESS}
TC_136: Validate Contains Unfill Form Update Motorbike Register
    [Tags]  ServicesCleanFaily
    ${TC_136.TITLE}   ${TC_136.PRICES}   ${TC_136.CONTENT}   ${TC_136.STATUS}   ${TC_136.NAME_SERVICES}    ${TC_136.MESS}
TC_137: Validate Contains Unfill Form Update Clean Register
    [Tags]  ServicesCleanFaily
    ${TC_137.TITLE}   ${TC_137.PRICES}   ${TC_137.CONTENT}   ${TC_137.STATUS}   ${TC_137.NAME_SERVICES}    ${TC_137.MESS}
TC_138: Validate Update Price Input A Negative Integer Any Service
    [Tags]  ServicesCleanFaily
    ${TC_138.TITLE}   ${TC_138.PRICES}   ${TC_138.CONTENT}   ${TC_138.STATUS}   ${TC_138.NAME_SERVICES}    ${TC_138.MESS}
TC_139: Validate Update Price Input A Number Greater Than 25 digits Any Service
    [Tags]  ServicesCleanFaily
    ${TC_139.TITLE}   ${TC_139.PRICES}   ${TC_139.CONTENT}   ${TC_139.STATUS}   ${TC_139.NAME_SERVICES}    ${TC_139.MESS}
TC_141: Validate Update Price Input Any Number Not Divisible 1000 Any Service
    [Tags]  ServicesCleanFaily
    ${TC_141.TITLE}   ${TC_141.PRICES}   ${TC_141.CONTENT}   ${TC_141.STATUS}   ${TC_141.NAME_SERVICES}    ${TC_141.MESS}
*** Keywords ***
Validate Contains Update Services From Admin Faily
    [Arguments]  ${tilte}  ${prices}  ${content}  ${status}  ${name_services}    ${mess}
    Given Admin Login Into Dormitory Manage System  ${USER_AD}  ${PASSWORD_AD}
    And Capture and Save Screenshot
    When Navigate To The Manage Services Page
    And Verify The Manage Serivces Page Should Be Displayed
    And Capture and Save Screenshot
    And Input Name Service Wanna Edit  ${name_services}
    And Click 'Chỉnh sửa' Then Edit Services  ${name_services}
    And Capture and Save Screenshot
    And Input The Fields You Wanna To  ${tilte}  ${prices}  ${content}  ${status}
    And Send By Click 'Cập nhật'
    And Verify Notification Update Faily  ${mess}
    And Capture and Save Screenshot
