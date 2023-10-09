*** Settings ***
Resource        ../../Resource/commons/init.resource
Test Tags   Login123
#Library     SeleniumLibrary
Library    DateTime
*** Variables ***
${root_path}   D:/LuanVan/DungB1910201
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
Test_1:ABC
    [Tags]  test123
    Get Element Table    ${a}  ${cooking}

