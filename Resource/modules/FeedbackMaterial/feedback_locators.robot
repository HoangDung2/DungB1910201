*** Variables ***
${locatorTitleFBack}    xpath=//div[@class="section-title mt-5"]//h2
${locatorTitleFBack_1}    xpath=//div[@class="section-title mt-5"]//p
${locatorNameMaterial}  xpath=//select/option[contains(text(),'{}')]
${locatorSubmit_Mater}  xpath=//div/button[text()='Xác nhận']
${locator_inputN}   css=input[type="number"]
#----Mess----
${messTitle}    Cơ sở vật chất
${messTitle_1}  Nếu phòng có sự cố hãy phản hồi
@{listMaterial}      Hư cửa lùa     Bể gạch nền    Thay khoen khóa cửa   Bản lề cửa sổ   Hư cửa tủ   Rớt la phong   Phòng dột   Mất điện  Hư đồng hồ điện  Cháy công tắc  Nghẹt bồn cầu  Nghẹt cống     Đèn phòng hư    Đèn nhà tắm hư   Vòi nước bị rỉ
${messs_succesMA}   Thành công
${messs_succesMA_1}     Phản hồi thành công