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
    [Documentation]  Return List tu 0-8
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
