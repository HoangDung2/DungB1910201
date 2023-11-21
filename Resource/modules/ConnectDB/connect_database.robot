*** Settings ***
Resource    ../../../Resource/commons/init.resource
#Library     SeleniumLibrary
#Test Tags   DB
*** Variables ***
${dbapiModuleName}  pymysql
${dbHost}    127.0.0.1
${DBPORT}    3306
${dbUsername}    root
${dbPassword}    ${EMPTY}
${dbName}    dormitory
*** Keywords ***
Connect Database Xampp
    Connect To Database   ${dbapiModuleName}  ${dbName}    ${dbUsername}    ${dbPassword}    ${dbHost}    ${DBPORT}

Get Length Number Room Have Number Of People And Air_conditioned
    [Arguments]     ${NUMBER}
    Connect Database Xampp
    ${query_sql}=    Set Variable  SELECT COUNT(*) FROM room_type WHERE max_quantity = ${NUMBER} AND is_air_conditioned = 1;
    ${results}=  Query    ${query_sql}
    Disconnect From Database
    RETURN  ${results[0][0]}

Get Length Number Room Have Number Of People And Cooking
    [Arguments]     ${NUMBER}
    Connect Database Xampp
    ${query_sql}=    Set Variable  SELECT COUNT(*) FROM room_type WHERE max_quantity = ${NUMBER} AND is_cooked = 1;
    ${results}=  Query    ${query_sql}
    Disconnect From Database
    RETURN  ${results[0][0]}

Get Length Number Room Have Number Of People And Coblab Cooking, Air_conditioned
    [Arguments]     ${NUMBER}
    Connect Database Xampp
    ${query_sql}=    Set Variable  SELECT COUNT(*) FROM room_type WHERE max_quantity = ${NUMBER} AND is_cooked = 1 AND is_air_conditioned = 1;
    ${results}=  Query    ${query_sql}
    Disconnect From Database
    RETURN  ${results[0][0]}

Get Length Number Room Have All Air_conditioned
    Connect Database Xampp
    ${query_sql}=    Set Variable  SELECT COUNT(*) FROM room_type WHERE is_air_conditioned = 1;
    ${results}=  Query    ${query_sql}
    Disconnect From Database
    RETURN  ${results[0][0]}

Get Length Number Room Have All Cooking
    Connect Database Xampp
    ${query_sql}=    Set Variable  SELECT COUNT(*) FROM room_type WHERE is_cooked = 1;
    ${results}=  Query    ${query_sql}
    Disconnect From Database
    RETURN  ${results[0][0]}

Get Length Number Room Have All Cooking And Air_conditioned
    Connect Database Xampp
    ${query_sql}=    Set Variable  SELECT COUNT(*) FROM room_type WHERE is_cooked = 1 AND is_air_conditioned = 1;
    ${results}=  Query    ${query_sql}
    Disconnect From Database
    RETURN  ${results[0][0]}

Get All Info Student
    [Documentation]  Return List tu 0-7
    ...              0: MSSV , 1: Tên SV, 2: Ngành, 3 Quê quán
    ...              4: Năm sinh 5: MSSV 6: Giới tính 7: SĐT
    [Arguments]     ${MSSV_INFO}
    ${File}=    create list
    ${Temp_File}=   Create List
    Connect Database Xampp
    ${query_sql}=    Set Variable   SELECT student.number_student, student.name, student.major, student.address, student.birthday, student.classroom, student.gender, student.phone FROM student INNER JOIN users ON student.number_student = '${MSSV_INFO}';
    ${results}=  Query    ${query_sql}
    Disconnect From Database
    ${length_results}=   Get Length    ${results[0]}
    FOR    ${element}    IN RANGE    0  ${length_results}
        IF   '${results[0][${element}]}' == '1'
             Append To List    ${File}  Nam
        ELSE IF  '${results[0][${element}]}' == '0'
              Append To List    ${File}  Nữ
        ELSE
              Append To List  ${File}  ${results[0][${element}]}
        END
    END
    RETURN  ${File}

Get Row And Room In Infostudent
    [Documentation]  Keywords have get text row and room in infostudent page then compare ui
    [Arguments]   ${MSSV_Infostudent}
    ${File}=    create list
    Connect Database Xampp
    ${query_sql}=    Set Variable   SELECT contract.room_type, contract.number_room FROM student INNER JOIN contract ON student.id = contract.student_id WHERE student.number_student='${MSSV_Infostudent}';
    ${results}=  Query    ${query_sql}
    Log    ${results}
    Disconnect From Database
    IF  not ${results}
         ${File}=   Set Variable     0
    ELSE
        ${length_results}=   Get Length    ${results[0]}
        FOR    ${element}    IN RANGE    0  ${length_results}
              Append To List  ${File}  ${results[0][${element}]}
        END
    END
    RETURN   ${File}

Delete Register Room Student And Reload Page
    [Arguments]   ${MSSV_Infostudent}
    Connect Database Xampp
    ${results}=     Query   Select c.id FROM contract c INNER JOIN student s ON s.user_id = c.student_id WHERE s.number_student='${MSSV_Infostudent}';
    Delete All Rows From Table   contract WHERE dormitory.contract.id =${results}[0][0];
    Query   Commit
    Disconnect From Database
    Reload Page
    Wait Notification Should Be Displayed

Update Time From Dabata
    Connect Database Xampp
    ${current_datetime} =    Get Current Date
    ${days_to_add} =    Set Variable    7
    ${dat_30d}=  Set Variable    30
    ${future_datetime} =    Add Time To Date    ${current_datetime}   ${days_to_add} days
    ${end_date}=    Add Time To Date    ${future_datetime}  ${dat_30d} days
    Update Time From Table    `sesmester` SET `end_date` = '${end_date}',`start_date` = '${future_datetime}', `registration_end_date` = '${future_datetime}', `registration_start_date` = '${current_datetime}' WHERE `sesmester`.`id` = 2;
    Query   Commit
    Disconnect From Database

#---Material----
Update Time After Registration From Databa
    Connect Database Xampp
    ${current_datetime} =    Get Current Date
    ${days_to_subtract} =    Set Variable    1
    ${days_to_add} =    Set Variable    7
    ${day_30}=      Set Variable    30
    ${yet_datetime} =    Subtract Time From Date    ${current_datetime}    ${days_to_subtract} days
    ${past_datetime} =    Subtract Time From Date    ${yet_datetime}    ${day_30} days
    ${future_datetime} =    Add Time To Date    ${past_datetime}    ${days_to_add} days
    Update Time From Table  `sesmester` SET `end_date` = '${yet_datetime}',`start_date` = '${past_datetime}', `registration_end_date` = '${future_datetime}', `registration_start_date` = '${past_datetime}' WHERE `sesmester`.`id` = 2;
    Query   Commit
    Disconnect From Database
    Reload Page
    Wait Notification Should Be Displayed

Update Time Before Registration From Databa
    Connect Database Xampp
    ${current_datetime} =    Get Current Date
    ${days_to_subtract} =    Set Variable    1
    ${days_to_add} =    Set Variable    7
    ${future_datetime} =    Add Time To Date    ${current_datetime}    ${days_to_add} days
    ${past_datetime} =    Add Time To Date    ${current_datetime}    ${days_to_subtract} days
    Update Time From Table  `sesmester` SET `end_date` = '2023-12-31',`start_date` = '${past_datetime}', `registration_end_date` = '${future_datetime}', `registration_start_date` = '${past_datetime}' WHERE `sesmester`.`id` = 2;
    Query   Commit
    Disconnect From Database
    Reload Page
    Wait Notification Should Be Displayed

Update Time From Dabata Registration Material
    Connect Database Xampp
    ${current_datetime} =    Get Current Date
    ${days_to_add} =    Set Variable    15
    ${future_datetime} =    Subtract Time From Date    ${current_datetime}    ${days_to_add} days
    Update Time From Table    `sesmester` SET `end_date` = '2023-12-31',`start_date` = '${current_datetime}', `registration_end_date` = '${current_datetime}', `registration_start_date` = '${future_datetime}' WHERE `sesmester`.`id` = 2;
    Query   Commit
    Disconnect From Database
    Reload Page
    Wait Notification Should Be Displayed
#------Booking----------

Update Time Before Registration From Databa BookingRoom
    Connect Database Xampp
    ${current_datetime} =    Get Current Date
    ${day_to_add} =    Set Variable    1
    ${week_to_add} =    Set Variable    7
    ${day_30}=      Set Variable    30
    ${yet_datetime} =    Add Time To Date    ${current_datetime}    ${day_to_add} days
    ${past_datetime} =    Add Time To Date    ${yet_datetime}    ${week_to_add} days
    ${future_datetime} =    Add Time To Date    ${past_datetime}    ${day_30} days
    Update Time From Table    `sesmester` SET `end_date` = '${future_datetime}',`start_date` = '${past_datetime}', `registration_end_date` = '${past_datetime}', `registration_start_date` = '${yet_datetime}' WHERE `sesmester`.`id` = 2;
    Query   Commit
    Disconnect From Database
    Reload Page
    Wait Notification Should Be Displayed


Update Time After Registration From Databa BookingRoom
    Connect Database Xampp
    ${current_datetime} =    Get Current Date
    ${day_to_subtract} =    Set Variable    1
    ${week_to_subtract} =    Set Variable    7
    ${day_30}=      Set Variable    30
    ${yet_datetime} =    Subtract Time From Date    ${current_datetime}    ${day_to_subtract} days
    ${pasted_datetime} =    Subtract Time From Date   ${yet_datetime}    ${week_to_subtract} days
    ${future_datetime} =    Add Time To Date    ${yet_datetime}    ${day_30} days
    Update Time From Table    `sesmester` SET `end_date` = '${future_datetime}',`start_date` = '${yet_datetime}', `registration_end_date` = '${yet_datetime}', `registration_start_date` = '${pasted_datetime}' WHERE `sesmester`.`id` = 2;
    Query   Commit
    Disconnect From Database
    Reload Page
    Wait Notification Should Be Displayed


Update Time From Dabata Check-In Period Overlaps With Stay Period
    Connect Database Xampp
    ${current_datetime} =    Get Current Date
    ${days_to_add} =    Set Variable    15
    ${future_datetime} =    Subtract Time From Date    ${current_datetime}    ${days_to_add} days
    Update Time From Table    `sesmester` SET `end_date` = '2023-12-31',`start_date` = '${future_datetime}', `registration_end_date` = '2023-12-31', `registration_start_date` = '${future_datetime}' WHERE `sesmester`.`id` = 2;
    Query   Commit
    Disconnect From Database
    Reload Page
    Wait Notification Should Be Displayed


#----Prepare Data Test
TEST123
    Connect Database Xampp
    [Arguments]   ${MSSV_Infostudent}
    Connect Database Xampp
    ${results}=    Query  SELECT student.user_id FROM student WHERE student.number_student = '${MSSV_Infostudent}';
    Delete All Rows From Table   room_feedback WHERE dormitory.room_feedback.student_id =${results}[0][0];
    Query   Commit
    Disconnect From Database

Delete Services And Reload Page
    [Documentation]     ${results}[0][0] this is ID services
    ...                 ${results}[0][1] this id Student
    [Arguments]   ${MSSV_Infostudent}   ${name_services}
    Connect Database Xampp
    ${results}=     Query   SELECT r.service_id, r.student_id FROM register_services r INNER JOIN student s ON s.user_id = r.student_id INNER JOIN services se ON se.id = r.service_id WHERE s.number_student = '${MSSV_Infostudent} ' AND se.name = '${name_services}';
    IF  not ${results}
        RETURN  Next Step
    ELSE
        Delete All Rows From Table   register_services WHERE register_services.service_id =${results}[0][0] AND register_services.student_id=${results}[0][1];
        Query   Commit
        Disconnect From Database
        Reload Page
        Wait Notification Should Be Displayed
    END


#----- Prepare Case Payment Happycase Tear Down
Update Status Payment In Infor Student
    [Arguments]     ${MSSV}
    IF   '${MSSV}' == 'B1910244'
        RETURN  Next Step
    ELSE
        Connect Database Xampp
        ${results}=    Query   SELECT student.id FROM student Where student.number_student = '${MSSV}';
        Update Time From Table   `contract` SET `status` = '0' WHERE `contract`.`student_id` = ${results}[0][0];
        Update Time From Table   `register_services` SET `status` = '0' WHERE `register_services`.`student_id` = ${results}[0][0];
        Disconnect From Database
    END

#-----Admin---------
Get All Info Admin
    [Documentation]  Return List tu 0-7
    ...              0: SĐT , 1: Địa chỉ, 2: Giới tính, 3 ID
    ...              4: Ngày sinh
    [Arguments]     ${MSSV_INFO}
    ${File}=    create list
    ${Temp_File}=   Create List
    Connect Database Xampp
    ${query_sql}=    Set Variable    SELECT admin.phone,admin.address,admin.gender,admin.number_admin,admin.birthday FROM admin Where admin.number_admin = '${MSSV_INFO}';
    ${results}=  Query    ${query_sql}
    Disconnect From Database
    ${length_results}=   Get Length    ${results[0]}
    FOR    ${element}    IN RANGE    0  ${length_results}
        IF   '${results[0][${element}]}' == '1'
             Append To List    ${File}  Nam
        ELSE IF  '${results[0][${element}]}' == '0'
              Append To List    ${File}  Nữ
        ELSE
              Append To List  ${File}  ${results[0][${element}]}
        END
    END
    RETURN  ${File}

Get Name And Email Admin
    [Documentation]  Return List tu 0-7
    ...              0: Email , 1: Tên Admin
    [Arguments]     ${MSSV_INFO}
    ${File}=    create list
    ${Temp_File}=   Create List
    Connect Database Xampp
    ${query_sql}=    Set Variable    SELECT admin.email,admin.name FROM admin Where admin.number_admin = '${MSSV_INFO}';
    ${results}=  Query    ${query_sql}
    Disconnect From Database
    ${length_results}=   Get Length    ${results[0]}
    FOR    ${element}    IN RANGE    0  ${length_results}
          Append To List  ${File}  ${results[0][${element}]}
    END
    RETURN  ${File}
#-----Get Sum Money According To RoomType Bill room
Get Sum Money According To RoomType Bill
    [Arguments]  ${room_type}    ${room}
    ${File}=    create list
    Connect Database Xampp
    ${results}=    Query  SELECT bill.price FROM bill WHERE bill.room_type = '${room_type}'  AND  bill.number_room='${room}';
    Disconnect From Database
    IF  not ${results}
        RETURN  Next Step
    ELSE
        Append To List  ${File}  ${results}[0]
        RETURN  ${File}
    END
