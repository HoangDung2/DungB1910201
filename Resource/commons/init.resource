*** Settings ***
Library             XML
Library             Screenshot
Library             Collections
Library             JsonValidator
Library             Process
Library             OperatingSystem
Library             String
Library             BuiltIn
Library             DatabaseLibrary
Library             AutoLibrary
Library             DateTime
Library             RequestsLibrary
Resource            common_keyword.resource
#----Home----
Resource    ../../Resource/modules/Home/home_actions.robot
Resource    ../../Resource/modules/Home/home_locator.robot
#----Login----
Resource    ../../Resource/modules/Login/login_actions.robot
Resource    ../../Resource/modules/Login/login_locators.robot
Resource    ../../Resource/modules/Login/login_keywords.robot
#----InformationStudent
Resource    ../../Resource/modules/InformationStudent/info_locators.robot
Resource    ../../Resource/modules/InformationStudent/info_keywords.robot
#----RoomType----
Resource    ../../Resource/modules/RoomType/room_actions.robot
Resource    ../../Resource/modules/RoomType/room_keywords.robot
Resource    ../../Resource/modules/RoomType/room_locators.robot
#----BookingRoom-----
Resource    ../../Resource/modules/BookingRoom/booking_keywords.robot
Resource    ../../Resource/modules/BookingRoom/booking_locators.robot
#----FeedbackMaterial----
Resource    ../../Resource/modules/FeedbackMaterial/feedback_keywords.robot
Resource    ../../Resource/modules/FeedbackMaterial/feedback_locators.robot
#----Data----
Variables    ../../Data/data_login.yml
Variables    ../setting.yml
Resource    ../../Resource/modules/ConnectDB/connect_database.robot
Variables   ../../Data/data_feedback.yml
Variables    ../../Data/data_infoPay.yml
#----Environment----
Resource    ../../Tests/Environment_Test.robot
