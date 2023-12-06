*** Settings ***
Resource        ../../Resource/commons/init.resource
Test Tags   Login123
Test Teardown  Close Browser

*** Variables ***
${a}    	B1910201
${name}     Gửi xe máy
${b}    B1910241
#${root_path}   D:/LuanVan/DungB1910201
*** Test Cases ***
TC_1:ABC
    [Tags]  123
    User Open Browser And Go To Website     ${NAME_PAGE_STUDENT}
#    Read Email Material
#    Update Status Payment In Infor Student
#    Update Time From Dabata Check-In Period Overlaps With Stay Period
#    ${list}=  Get Row And Room In Infostudent   ${USER_SERVICE}
#    Log To Console    ${list}
    Update Time From Dabata
#     Update Set Up Data
#     Read Email Bill
#     Delete Room Type   AB1
#      Delete Bill Room  A5
#    Delete Services And Reload Page     ${USERNAME}      ${name}
#    TEST123     ${b}
#     Update Time From Dabata Registration Material
#    Update Time Before Registration From Databa
#    Update Time After Registration From Databa


