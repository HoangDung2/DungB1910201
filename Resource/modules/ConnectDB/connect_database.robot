*** Settings ***
Resource    ../../../Resource/commons/init.resource
#Library     SeleniumLibrary
#Test Tags   DB
*** Variables ***
${bit_cook}  1
${bit_air}   1
${results}
*** Keywords ***
Connect Database Xampp
    Connect To Database    pymysql  ${DBNAME}    ${DBUSER}    ${DBPASS}    ${DBHOST}    ${DBPORT}

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
    ${query_sql}=    Set Variable   SELECT contract.room_type, contract.number_room FROM student INNER JOIN contract ON student.user_id = contract.student_id WHERE student.number_student='${MSSV_Infostudent}';
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
    ${days_to_add} =    Set Variable    6
    ${future_datetime} =    Add Time To Date    ${current_datetime}    ${days_to_add} days
    Update Time From Table    `sesmester` SET `end_date` = '2023-12-31',`start_date` = '${future_datetime}', `registration_end_date` = '${future_datetime}', `registration_start_date` = '${current_datetime}' WHERE `sesmester`.`id` = 2;
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
    Update Time From Table    `sesmester` SET `end_date` = '${yet_datetime}',`start_date` = '${past_datetime}', `registration_end_date` = '${future_datetime}', `registration_start_date` = '${past_datetime}' WHERE `sesmester`.`id` = 2;
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
    Update Time From Table    `sesmester` SET `end_date` = '2023-12-31',`start_date` = '${past_datetime}', `registration_end_date` = '${future_datetime}', `registration_start_date` = '${past_datetime}' WHERE `sesmester`.`id` = 2;
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


TEST123
    Connect Database Xampp
    [Arguments]   ${MSSV_Infostudent}
    Connect Database Xampp
    ${results}=    Query  SELECT student.user_id FROM student WHERE student.number_student = '${MSSV_Infostudent}';
    Delete All Rows From Table   room_feedback WHERE dormitory.room_feedback.student_id =${results}[0][0];
    Query   Commit
    Disconnect From Database