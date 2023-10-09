*** Settings ***
Resource    ../../Resource/commons/init.resource
*** Variables ***
${root_path}   D:/LuanVan/DungB1910201/Sreenshot
*** Keywords ***
Student Login Into Dormitory System
    [Arguments]     ${username}     ${password}
    User Open Browser And Go To Website
    Verify That from Fill In Username And password Are Displayed
    User input Username And Password    ${username}     ${password}
    Click Button Submit     ${btnSumit}
#Capture and Save Screenshot
#    [Documentation]     Take A screentshot And Save File
#    # Lấy được tên Tag
#    ${prevTag}=    Set Variable      ${TEST_TAGS}[0]/${TEST_NAME}
#    ${name_tag}=    Split String     ${TEST_NAME}    :
#    Run Keyword If    '${prevTag}' == '${name_tag}'   Increase screenNumber ${scrNum}
#    Run Keyword If    '${prevTag}' != '${name_tag}'    Setup initial screenNumber
#    Set Test Variable    ${prevTag}  ${name_tag}
#    Set Test Variable    ${scrNum}  ${scrNum}
#    Remove File    ${root_path}/${name_tag}[0]/${name_tag}[0]_SS${scrNum}.png
#    Sleep    2s
#    Capture Page Screenshot     ${root_path}/${TEST_TAGS}[0]/${name_tag}[0]/${name_tag}[0]_SS${scrNum}.png
#    File Should Exist    ${root_path}/${TEST_TAGS}[0]/${name_tag}[0]/${name_tag}[0]_SS${scrNum}.png
#Setup initial screenNumber
#    Set Test Variable    ${scrNum}     1
#Increase screenNumber   ${i}
#    ${i+1}=     Evaluate    ${i}+1
#    Set Test Variable    ${scrNum}  ${i+1}
Wait Notification Should Be Displayed
    Sleep  1

