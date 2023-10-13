*** Settings ***
Resource        ../../Resource/commons/init.resource
Test Tags   Login123
Test Teardown   Close Browser
#Library     SeleniumLibrary
#Library    DateTime
#Library    SeleniumLibrary
*** Variables ***
#${root_path}   D:/LuanVan/DungB1910201
${ss}   sreenshot
*** Variables ***
${a}     Máy lạnh
*** Test Cases ***
#Test_1: ABCD
#    [Tags]  test
##    Get Element Infostu     abc
#    Log To Console    ${TEST_NAME}
#    ${name}=   Split String     ${TEST_NAME}    :
#    Take Screenshot     ${root_path}/${ss}/${TEST_TAGS}[0]/${name}[0]
#Subtract Dates Example
#    ${date1}    Set Variable    2023-10-15
#    ${date2}    Set Variable    2023-10-05
#
#    ${date1_obj}    Evaluate    datetime.datetime.strptime($date1, '%Y-%m-%d')
#    ${date2_obj}    Evaluate    datetime.datetime.strptime($date2, '%Y-%m-%d')
#
#    ${difference}    Evaluate    $date1_obj - $date2_obj
#
#    Log To Console    Difference in days: ${difference.days}
TC_1:ABC
    [Tags]  TEST123
    User Open Browser And Go To Website
    Capture and Save Screenshot

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

