*** Settings ***
Library             XML
Library             Screenshot
Library             Collections
Library             JsonValidator
Library             Process
Library             OperatingSystem
Library             SeleniumLibrary
Resource            common_keyword.resource
#----Home----
Resource    ../../Resource/modules/Home/home_actions.robot
Resource    ../../Resource/modules/Home/home_locator.robot
#----Login----
Resource    ../../Resource/modules/Login/login_actions.robot
Resource    ../../Resource/modules/Login/login_locators.robot
Resource    ../../Resource/modules/Login/login_keywords.robot
#----Data----
Variables    ../../Data/data_login.yml
#----Environment----
Resource    ../../Tests/Environment_Test.robot