*** Settings ***
Resource        ../../Resource/commons/init.resource
Test Tags   Login123
Test Teardown   Close Browser
#Library     SeleniumLibrary
#Library    DateTime
#Library    SeleniumLibrary
*** Variables ***
#${root_path}   D:/LuanVan/DungB1910201
*** Test Cases ***
TC_1:ABC
    [Tags]  123
    User Open Browser And Go To Website
#    TEST123     ${USERNAME}
     Update Time From Dabata Registration Material
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

