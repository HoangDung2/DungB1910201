*** Settings ***
Resource    ../../Resource/commons/init.resource
*** Variables ***
${root_path}   D:/LuanVan/DungB1910201/Screenshot
*** Keywords ***
Student Login Into Dormitory System
    [Arguments]     ${username}     ${password}
    User Open Browser And Go To Website   ${NAME_PAGE_STUDENT}
    Verify That from Fill In Username And password Are Displayed
    User input Username And Password    ${username}     ${password}
    Capture and Save Screenshot
    Click Button Submit     ${btnSumit}

Student Login Into Dormitory System And Check All Information In InForStudent Page
        [Arguments]     ${username}     ${password}
        Student Login Into Dormitory System     ${username}   ${password}
        Verify Home Page Should Be Displayed
        Capture and Save Screenshot
        Navigate To The Info Student Page By Click Nav Link Info Student
        Verify Info Student Page Should Be Displayed
        Check All Info Sudent With Databse  ${username}
        Verify Row And Room Have Displayed  ${username}
        Capture and Save Screenshot
Admin Login Into Dormitory Manage System
    [Arguments]     ${username}     ${password}
    User Open Browser And Go To Website   ${NAME_PAGE_ADMIN}
    Verify That from Fill In Username And password Are Displayed
    User input Username And Password    ${username}     ${password}
    Capture and Save Screenshot
    Click Button Submit     ${iptSubmit}

Capture and Save Screenshot
    [Documentation]     Take A screentshot And Save File Test Suite, limit 9 image
    ${name_tag}=    Split String     ${TEST_NAME}    :
    ${prevTag}=    Set Variable      ${root_path}/${TEST_TAGS}[0]/${name_tag}[0]
    ${length_image}=   Count Image File  ${prevTag}
    IF    '${length_image}' == '0'
         ${i}=  Set Variable    1
         Set Global Variable    ${i}
    ELSE
        ${file_image}=  Get Image Files     ${prevTag}
        ${get_value_image}=     Split String     ${file_image}[0]   .
        ${Number}=    Split String    ${get_value_image}[0]   SS_
        ${ssNumber}=  Evaluate    ${Number}[1]
        ${max}=     Set Variable  ${ssNumber}
        FOR    ${element}    IN    @{file_image}
            ${get_value_image_1}=     Split String     ${element}   .
            ${Number_1}=    Split String    ${get_value_image_1}[0]   SS_
            ${ssNumber_1}=  Evaluate    ${Number_1}[1]
            ${max}=  Evaluate    max(${max},${ssNumber_1})
            ${i}=   Set Variable    ${max+1}
        END
    END
    Capture Page Screenshot     ${root_path}/${TEST_TAGS}[0]/${name_tag}[0]/${name_tag}[0]_SS_${i}.png
    File Should Exist    ${root_path}/${TEST_TAGS}[0]/${name_tag}[0]/${name_tag}[0]_SS_${i}.png


Capture Element and Save Screenshot
    [Documentation]     Take A screentshot And Save File Test Suite, limit 9 image
    [Arguments]     ${locator_element}
    ${name_tag}=    Split String     ${TEST_NAME}    :
    ${prevTag}=    Set Variable      ${root_path}/${TEST_TAGS}[0]/${name_tag}[0]
    ${length_image}=   Count Image File  ${prevTag}
    IF    '${length_image}' == '0'
         ${i}=  Set Variable    1
         Set Global Variable    ${i}
    ELSE
        ${file_image}=  Get Image Files     ${prevTag}
        ${get_value_image}=     Split String     ${file_image}[0]   .
        ${Number}=    Split String    ${get_value_image}[0]   SS_
        ${ssNumber}=  Evaluate    ${Number}[1]
        ${max}=     Set Variable  ${ssNumber}
        FOR    ${element}    IN    @{file_image}
            ${get_value_image_1}=     Split String     ${element}   .
            ${Number_1}=    Split String    ${get_value_image_1}[0]   SS_
            ${ssNumber_1}=  Evaluate    ${Number_1}[1]
            ${max}=  Evaluate    max(${max},${ssNumber_1})
            ${i}=   Set Variable    ${max+1}
        END
    END
    Capture Element Screenshot    ${locator_element}     ${root_path}/${TEST_TAGS}[0]/${name_tag}[0]/${name_tag}[0]_SS_${i}.png
    File Should Exist    ${root_path}/${TEST_TAGS}[0]/${name_tag}[0]/${name_tag}[0]_SS_${i}.png

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

#Capture and Save Screenshot
#    [Documentation]     Take A screentshot And Save File Test Suite, limit 9 image
#    ${name_tag}=    Split String     ${TEST_NAME}    :
#    ${prevTag}=    Set Variable      ${root_path}/${TEST_TAGS}[0]/${name_tag}[0]
#    ${length_image}=   Count Image File  ${prevTag}
#    IF    '${length_image}' == '0'
#         ${i}=  Set Variable    1
#         Set Global Variable    ${i}
#    ELSE
#        ${file_image}=  Get Image Files     ${prevTag}
#        ${get_value_image}=     Split String     ${file_image}[0]   .
#        ${Number}=    Split String    ${get_value_image}[0]   SS_
#        ${ssNumber}=  Evaluate    ${Number}[1]
#        ${max}=     Set Variable  ${ssNumber}
#        FOR    ${element}    IN    @{file_image}
#            ${get_value_image_1}=     Split String     ${element}   .
#            ${Number_1}=    Split String    ${get_value_image_1}[0]   SS_
#            ${ssNumber_1}=  Evaluate    ${Number_1}[1]
#            ${max}=  Evaluate    max(${max},${ssNumber_1})
#            ${i}=   Set Variable    ${max+1}
#        END
#    END
#    Capture Page Screenshot     ${root_path}/${TEST_TAGS}[0]/${name_tag}[0]/${name_tag}[0]_SS_${i}.png
#    File Should Exist    ${root_path}/${TEST_TAGS}[0]/${name_tag}[0]/${name_tag}[0]_SS_${i}.png

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


Wait Notification Should Be Displayed
    Sleep    2s

Wait Page Should Be Displayed
    Sleep    2s
Waiting Reload Page
    Sleep    2s

Scroll To Bottom
    ${scrollHeight}=    Execute JavaScript    return Math.max(document.body.scrollHeight, document.documentElement.scrollHeight, document.body.offsetHeight, document.documentElement.offsetHeight, document.body.clientHeight, document.documentElement.clientHeight)
    ${scrollPosition}=    Evaluate    (1/3) * ${scrollHeight}
    Execute JavaScript    window.scrollTo(0, ${scrollPosition})
    Sleep    2s
    Capture and Save Screenshot
Scroll To Top
    ${scrollHeight}=    Execute JavaScript    return Math.max(document.body.scrollHeight, document.documentElement.scrollHeight, document.body.offsetHeight, document.documentElement.offsetHeight, document.body.clientHeight, document.documentElement.clientHeight)
    ${scrollPosition}=    Evaluate    (1/3) * ${scrollHeight}
    Execute JavaScript    window.scrollTo(${scrollPosition}, 0)
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

Scroll From Top to Bottom of Page And Capture Page Screenshot Room
    ${scroll_height}=    Execute JavaScript    return Math.max( document.body.scrollHeight, document.body.offsetHeight, document.documentElement.clientHeight, document.documentElement.scrollHeight, document.documentElement.offsetHeight )
    ${part_height}=    Evaluate    int(${scroll_height} / 3)
    # First Scroll
    Execute JavaScript    window.scrollTo(0, ${part_height})
    Capture and Save Screenshot
    Sleep    1s
    # Second Scroll
    Execute JavaScript    window.scrollTo(0, ${part_height} * 3)
    Capture and Save Screenshot
    Sleep    1s
    # Third Scroll
    Execute JavaScript    window.scrollTo(0, ${part_height} * 6)
    Capture and Save Screenshot
    Sleep    1s
    # Fourth Scroll
    Execute JavaScript    window.scrollTo(0, ${part_height} * 8)
    Capture and Save Screenshot
    Sleep    1s
    # Fifth Scroll
    Execute JavaScript    window.scrollTo(0, ${part_height} * 10)
    Sleep    1s
    Capture and Save Screenshot


Save File Image Prev And Clear File Current Test Suite
#    Save File Image If Exits Test Suite
    Clear Image In File If Exits Test Suite
    Start Video
    Update Set Up Data

Save File Image Prev And Clear File Current Test Alls
#    Save File Image If Exits Test All
    Clear Image In File If Exits Test All

Close Browser Set Up Time
    Run Keyword And Ignore Error    Update Set Up Data
    Run Keyword And Ignore Error    Close Browser
    Run Keyword And Ignore Error    Stop Video Recording    alias=None

Close Browser Set Up Time Payment
    Run Keyword And Ignore Error    Update Set Up Data
    Run Keyword And Ignore Error    Close Browser
    Run Keyword And Ignore Error    Stop Video Recording    alias=None

Start Video
    ${name_tag}=    Split String     ${TEST_NAME}    :
    ${path_folder}  Set Variable      ${root_path}/${TEST_TAGS}[0]/${name_tag}[0]
    ${prevTag}=    Set Variable      ${root_path}/${TEST_TAGS}[0]/${name_tag}[0]/${name_tag}[0]_Video
    Create Folder   ${path_folder}
    Start Video Recording    alias=None    name=${prevTag}    fps=None    size_percentage=1    embed=True    embed_width=100px    monitor=1
#  ------

