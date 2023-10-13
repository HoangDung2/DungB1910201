*** Settings ***
Library             XML
Library             Screenshot
Library             Collections
Library             JsonValidator
Library             Process
Library             OperatingSystem
Library             String
Library             DatabaseLibrary
Library             AutoLibrary
#Library             Pillow
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
#----Data----
Variables    ../../Data/data_login.yml
Variables    ../setting.yml
Resource    ../../Resource/modules/ConnectDB/connect_database.robot
#----Environment----
Resource    ../../Tests/Environment_Test.robot
