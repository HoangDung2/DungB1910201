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
#    [Documentation]     Take A screentshot And Save File Test Suite, limit 99 image
#    ${name_tag}=    Split String     ${TEST_NAME}    :
#    ${prevTag}=    Set Variable      ${root_path}/${TEST_TAGS}[0]/${name_tag}[0]
#    ${length_image}=   Count Image File  ${prevTag}
#    IF    '${length_image}' == '0'
#         ${i}=  Set Variable    1
#         Set Global Variable    ${i}
#    ELSE
#        ${file_image}=  Get Image Files     ${prevTag}
#        ${get_value_image}=     Split String     ${file_image}[${length_image-1}]   .
#        ${value_image}=  Evaluate  ${get_value_image}[0][-1]
#        ${i}=   Set Variable    ${value_image+1}
#    END
#    Capture Page Screenshot     ${root_path}/${TEST_TAGS}[0]/${name_tag}[0]/${name_tag}[0]_SS${i}.png
#    File Should Exist    ${root_path}/${TEST_TAGS}[0]/${name_tag}[0]/${name_tag}[0]_SS${i}.png

Capture and Save Screenshot
    [Documentation]     Take A screentshot And Save File Test All, limit 99 image
    ${name_tag}=    Split String     ${TEST_NAME}    :
    ${prevTag}=    Set Variable      ${root_path}/${TEST_TAGS}[1]/${name_tag}[0]/${name_tag}[1]
    ${length_image}=   Count Image File  ${prevTag}
    IF    '${length_image}' == '0'
         ${i}=  Set Variable    1
         Set Global Variable    ${i}
    ELSE
        ${file_image}=  Get Image Files     ${prevTag}
        Log   ${file_image}
        ${get_value_image}=     Split String     ${file_image}[${length_image-1}]   .
        ${value_image}=  Evaluate  ${get_value_image}[0][-1]
        ${i}=   Set Variable    ${value_image+1}
    END
    Capture Page Screenshot     ${root_path}/${TEST_TAGS}[1]/${name_tag}[0]/${name_tag}[1]/${name_tag}[0]_SS${i}.png
    File Should Exist    ${root_path}/${TEST_TAGS}[1]/${name_tag}[0]/${name_tag}[1]/${name_tag}[0]_SS${i}.png

Wait Notification Should Be Displayed
    Sleep    2s

Scroll From Top to Bottom of Page And Capture Page Screenshot
    ${scroll_height}=    Execute JavaScript    return Math.max( document.body.scrollHeight, document.body.offsetHeight, document.documentElement.clientHeight, document.documentElement.scrollHeight, document.documentElement.offsetHeight );
    ${part_height}=    Evaluate    int(${scroll_height} / 3)
    Execute JavaScript    window.scrollTo(0, ${part_height})
    Capture and Save Screenshot
    Sleep    1s
    Execute JavaScript    window.scrollTo(0, ${part_height} * 2)
    Capture and Save Screenshot
    Sleep    1s
    Execute JavaScript    window.scrollTo(0, ${scroll_height})
    Sleep    1s
    Capture and Save Screenshot


Clear Image In File If Exits Test Suite
    ${name_tag}=    Split String     ${TEST_NAME}    :
    ${prevTag}=    Set Variable      ${root_path}/${TEST_TAGS}[0]/${name_tag}[0]
    ${length_image}=   Count Image File  ${prevTag}
    IF    '${length_image}' != '0'
         Clear Image Folder     ${prevTag}
    END

Save File Image If Exits Test Suite
    ${name_tag}=    Split String     ${TEST_NAME}    :
    ${prevTag}=    Set Variable      ${root_path}/${TEST_TAGS}[0]/${name_tag}[0]
    ${length_image}=   Count Image File  ${prevTag}
    IF    '${length_image}' != '0'
         Copy Image Folder     ${prevTag}   ${prevTag}Prev
    END

Save File Image Prev And Clear File Current Test Suite
    Save File Image If Exits Test Suite
    Clear Image In File If Exits Test Suite

Clear Image In File If Exits Test All
    ${name_tag}=    Split String     ${TEST_NAME}    :
    ${prevTag}=    Set Variable      ${root_path}/${TEST_TAGS}[1]/${name_tag}[0]/${name_tag}[1]
    ${length_image}=   Count Image File  ${prevTag}
    IF    '${length_image}' != '0'
         Clear Image Folder     ${prevTag}
    END

Save File Image If Exits Test All
    ${name_tag}=    Split String     ${TEST_NAME}    :
    ${prevTag}=    Set Variable      ${root_path}/${TEST_TAGS}[1]/${name_tag}[0]/${name_tag}[1]
    ${length_image}=   Count Image File  ${prevTag}
    IF    '${length_image}' != '0'
         Copy Image Folder     ${prevTag}   ${prevTag}Prev
    END

Save File Image Prev And Clear File Current Test All
#    Save File Image If Exits Test All
    Clear Image In File If Exits Test All


