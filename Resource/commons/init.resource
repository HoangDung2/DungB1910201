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
Library             ScreenCapLibrary
Library             DateTime
Library             RequestsLibrary
Resource            common_keyword.resource
#----Home----
Resource    ../../Resource/modules/Home/home_actions.robot
Resource    ../../Resource/modules/Home/home_locator.robot
#----HomeAdmin----
Resource    ../../Resource/modules/Home_Admin/home_admin_keywords.robot
Resource    ../../Resource/modules/Home_Admin/home_admin_locators.robot
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
#----RegisterServices
Resource    ../../Resource/modules/RegisterServices/services_keywords.robot
Resource    ../../Resource/modules/RegisterServices/services_locartors.robot
#----PWDChange
Resource    ../../Resource/modules/PasswordChangeAdmin/pwdchange_keywords.robot
Resource    ../../Resource/modules/PasswordChangeAdmin/pwdchange_locartors.robot
#----Payment-----
Resource    ../../Resource/modules/Payment/payment_keywords.robot
Resource    ../../Resource/modules/Payment/payment_locartors.robot
#----BillRoom----
Resource    ../../Resource/modules/BillRoom/billroom_keywords.robot
Resource    ../../Resource/modules/BillRoom/billroom_locators.robot
#----ResponseMaterial----
Resource    ../../Resource/modules/ResponseMaterialAdmin/res_material_keywords.robot
Resource    ../../Resource/modules/ResponseMaterialAdmin/res_material_locators.robot
#----ManageServices----
Resource    ../../Resource/modules/ManageServicesAdmin/manage_services_keywords.robot
Resource    ../../Resource/modules/ManageServicesAdmin/manage_services_locators.robot
#----Data----
Variables    ../../Data/data_login.yml
#Variables    ../setting.yml
Resource    ../../Resource/modules/ConnectDB/connect_database.robot
Variables   ../../Data/data_feedback.yml
Variables    ../../Data/data_infoPay.yml
Variables    ../../Data/data_services.yml
Variables    ../../Data/data_billroom.yml
Variables   ../../Data/data_bookingroom.yml
Variables   ../../Data/data_response_material.yml
Variables   ../../Data/data_manage_services.yml
#----Environment----
Resource    ../../Tests/Environment_Test.robot
#----Drivers----
Variables   ../../Drivers/chrome.yml

