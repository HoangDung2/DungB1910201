*** Settings ***
Resource    ../../../Resource/commons/init.resource
*** Variables ***
${root_path_img}   D:/LuanVan/DungB1910201/Img/image.png
${root_path_slq}   D:/LuanVan/DungB1910201/Img/old_data.sql
*** Keywords ***
Verify The Manage The Add Room Type Page Should Be Displayed
    Compare Text    ${lct_tilte_add_room}   THÊM LOẠI PHÒNG

Input Fields To Add Room
    [Arguments]     ${roomtype}   ${number}   ${price}  ${img}  ${is_cooked}  ${is_AirConditioned}
    ${scrollHeight}=    Execute JavaScript    return Math.max(document.body.scrollHeight, document.documentElement.scrollHeight, document.body.offsetHeight, document.documentElement.offsetHeight, document.body.clientHeight, document.documentElement.clientHeight)
    ${scrollPosition}=    Evaluate    (1/3) * ${scrollHeight}
    Execute JavaScript    window.scrollTo(0, ${scrollPosition})
    # roomtype
    IF    '${roomtype}' == 'No'
       RETURN  Next Step
    ELSE
        ${lct_roomtype}=     Dymanic Xpath  name  ${lct_input_add}
        Wait Until Element Is Visible   ${lct_roomtype}
        Input Text  ${lct_roomtype}  ${roomtype}
    END
    # number
    IF    '${number}' == 'No'
       RETURN  Next Step
    ELSE
        ${lct_number}=     Dymanic Xpath  quantity  ${lct_input_add}
        Wait Until Element Is Visible   ${lct_number}
        Input Text  ${lct_number}  ${number}
    END
    # price
    IF    '${price}' == '0'
       RETURN  Next Step
    ELSE
        ${lct_price}=     Dymanic Xpath  price  ${lct_input_add}
        Wait Until Element Is Visible   ${lct_price}
        Input Text  ${lct_price}  ${price}
    END
    # chose img
    IF    '${img}' == 'No'
       RETURN  Next Step
    ELSE
        Wait Until Element Is Visible   ${lct_img}
        IF    '${img}' == 'Fail'
            Choose File  ${lct_img}  ${root_path_slq}
        ELSE
            Choose File  ${lct_img}  ${root_path_img}
        END
    END
    # is_cooked
    IF    '${is_cooked}' == 'No'
        RETURN  Next Step
    ELSE
        ${conver_string_cooking}=     Convert To Lowercase    ${is_cooked}
        ${lct_iscooke}=     Dymanic Xpath  ${conver_string_cooking}  ${lct_cooking}
        Click Element   ${lct_iscooke}
    END
   # is_AirConditioned
    IF    '${is_AirConditioned}' == 'No'
        RETURN  Next Step
    ELSE
        ${conver_string_air}=     Convert To Lowercase    ${is_AirConditioned}
        ${lct_isAir}=     Dymanic Xpath  ${conver_string_air}  ${lct_AirCondi}
        Click Element   ${lct_isAir}
    END

   Sleep    2s
    
Click 'Thêm' Then Add Room Type
    Wait Until Element Is Visible    ${lct_submit_add_room}
    Click Element    ${lct_submit_add_room}

Verify Notification Add Room Should Be Displayed
     Compare Text   ${locatorTitleMess}    Thành công
     Compare Text   ${locatorTitleMess_1}    Bạn đã thêm phòng thành công
     Click Element  ${submit_messfail}

Login Into Dormitory Student System Them Check Add Room Successfully
       [Arguments]  ${name_room}
       Student Login Into Dormitory System     ${USERNAME}   ${PASSWORD}
       Navigate To The RoomType Page By Click Nav Link RoomType
       Scroll From Top to Bottom of Page And Capture Page Screenshot
       Delete Room Type     ${name_room}

Verify Error Notification Add Room Should Be Displayed
     [Arguments]    ${mess_1}   ${mees_2}
     Compare Text   ${locatorTitleMess}    ${mess_1}
     ${length_mess_2}=  Get Length    ${mees_2}
     IF    ${length_mess_2} > 0
         Compare Text   ${locatorTitleMess_1}    ${mees_2}
     ELSE
         RETURN  Sucessfully
     END

Verify Bill Detail Room Type Page Should Be Displayed
     Compare Text   ${lct_tilt_detail_room}     QUẢN LÝ LOẠI PHÒNG

Update All Status For All Rooms
    [Arguments]  ${roomtype}    ${status}
    ${lct_roomtype}=     Dymanic Xpath  ${roomtype}  ${lct_status_detail_room}
    ${lct_status}=  Run Keyword And Return Status  Element Should Be Visible  ${lct_roomtype}
    IF    '${lct_status}' == 'True'
        Wait Until Element Is Visible  ${lct_roomtype}
        Click Element    ${lct_roomtype}
        ${lct_chose_status}=    Dymanic Xpath More  ${roomtype}  ${status}  ${lct_choose_status_room}
        Wait Until Element Is Visible    ${lct_chose_status}
        Click Element    ${lct_chose_status}
    ELSE
         Pass Execution    RoomType Does Not Exist
    END
    Sleep    2s

Verify Notification Update Status Room Type Successfully
     Compare Text   ${locatorTitleMess}    Thành công
     Compare Text   ${locatorTitleMess_1}    Bạn đã cập nhật thành công
     Click Element  ${submit_messfail}

Login Into Dormitory Student System Then Check Status Room
       Student Login Into Dormitory System     ${USERNAME}   ${PASSWORD}
       Navigate To The RoomType Page By Click Nav Link RoomType
       Scroll From Top to Bottom of Page And Capture Page Screenshot