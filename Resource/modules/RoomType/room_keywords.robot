*** Settings ***
Resource    ../../../Resource/commons/init.resource
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