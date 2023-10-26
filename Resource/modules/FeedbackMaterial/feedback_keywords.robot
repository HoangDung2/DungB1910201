*** Settings ***
#Library    SeleniumLibrary
Resource    ../../../Resource/commons/init.resource
*** Keywords ***
Navigate To The Info Student Page By Click Nav Link Feedback Material
      Click Nav FeedBack

Verify Feedback Page Should Be Displayed
      Compare Text    ${locatorTitleFBack}     ${messTitle}
      Compare Text    ${locatorTitleFBack_1}     ${messTitle_1}

Select Content Material Have Repaired Any
     Wait Until Element Is Visible  xpath=//select
     Click Element    xpath=//select
     ${locator}=    Dymanic Xpath   ${listMaterial}[0]  ${locatorNameMaterial}
     Click Element    ${locator}

Input Number Need Repair Maximum <= 5
    [Arguments]     ${number}
    Input Text    ${locator_inputN}    ${number}

Click Confirm
    Wait Until Element Is Visible    ${locatorSubmit_Mater}
    Click Element   ${locatorSubmit_Mater}

Verify Content Repair Have Send
    Compare Text    ${locatorSuccess}     ${messs_succesMA}
    Compare Text    ${locatorSuccess_1}     ${messs_succesMA_1}

Select And Register All Content Material Have Repaired
     FOR    ${element}    IN    @{listMaterial}
         ${locator}=    Dymanic Xpath  ${element}  ${locatorNameMaterial}
         Wait Until Element Is Visible  ${locator}
         Click Element    ${locator}
         Input Number Need Repair Maximum <= 5  1
         Capture and Save Screenshot
         Click Confirm
         Sleep    2s
         Verify Content Repair Have Send
         Capture and Save Screenshot
         Click Element  ${submit_messfail}
     END

Verify Message Fail Should Be Displayed
    [Arguments]     ${mess}
    Compare Text    ${locatorSuccess}     ${messFail_Homepage}
    Compare Text    ${locatorSuccess_1}     ${mess}
 
Update time according to TCs  
    [Arguments]     ${Time}
    ${conver_string}=     Convert To Lowercase    ${Time}
    IF    '${conver_string}' == 'happycase'
        Update Time From Dabata Registration Material
    ELSE IF  '${conver_string}'=='after'
        Update Time After Registration From Databa
    ELSE
        Update Time Before Registration From Databa
    END

Select Content Material Have Repaired
    [Arguments]     ${select_meterial}
    ${conver_string}=     Convert To Lowercase    ${select_meterial}
    IF    '${conver_string}' == 'no'
        RETURN  Student Have't Choose Conten
    ELSE
        ${locator}=    Dymanic Xpath   ${select_meterial}  ${locatorNameMaterial}
        Click Element    ${locator}
    END

Input Number If Any
    [Arguments]     ${number_meterial}
    ${status}=  Run Keyword And Return Status   Should Match Regexp   ${number_meterial}  ^[0-9]$
    ${conver_string}=     Convert To Lowercase    ${number_meterial}
    IF  '${conver_string}' == 'no'
        RETURN  Student Have't Input Number
    ELSE IF   '${status}' == 'True'
          Input Number Need Repair Maximum <= 5     ${number_meterial}
    ELSE
        Pass Execution    Student Input Wrong Format
    END