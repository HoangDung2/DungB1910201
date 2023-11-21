*** Settings ***
Resource        ../../Resource/commons/init.resource
Test Tags   Login123
Test Teardown  Close Browser
#Library     SeleniumLibrary
#Library    DateTime
#Library    SeleniumLibrary
*** Variables ***
${a}    	B1910201
${name}     Gửi xe máy
${b}    B1910241
#${root_path}   D:/LuanVan/DungB1910201
*** Test Cases ***
TC_1:ABC
    [Tags]  123
    User Open Browser And Go To Website     ${NAME_PAGE_STUDENT}
    Read Email
#    Update Status Payment In Infor Student
#    Update Time From Dabata Check-In Period Overlaps With Stay Period
#    ${list}=  Get Row And Room In Infostudent   ${USER_SERVICE}
#    Log To Console    ${list}
#    Update Time From Dabata
#    Delete Services And Reload Page     ${USERNAME}      ${name}
#    TEST123     ${b}
#     Update Time From Dabata Registration Material
#    Update Time Before Registration From Databa
#    Update Time After Registration From Databa
#Scroll From Top to Bottom of Page And Capture Page Screenshot
#    Open Browser    https://example.com    chrome
#    # Your test steps here
#    Click Element   //button[@id='your-button-id']   # Example action
#
#    # Use Execute JavaScript to scroll to the bottom of the page
#    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
#
#    Capture Page Screenshot    full=True   # Capture the screenshot after scrolling
#    Close Browser

