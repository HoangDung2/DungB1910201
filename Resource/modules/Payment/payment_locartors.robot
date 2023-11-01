*** Variables ***
${locator_messPayment}      xpath=//div[contains(text(),"Chưa thanh toán")]
${locator_messPayment_1}    xpath=//div[@class="mt-2"]
${locator_Payment}  xpath=//div//span[contains(text(),"đây")]
${locator_logoPayment}  xpath=//div[@class="logo d-block text-center"]//img
${locator_TitlePayment}     xpath=//div[@class="main-title h2 text-center show-desktop mb24"]
${locator_Tiltbill}     xpath=//div[@class="bills"]//div[contains(text(),"Thông tin đơn hàng")]
${locator_inputDigits}  css=input[type="digits"]
${locator_inputNameCard}    css=label[class="input-inner-wrap"]>input[id="cardHolder"]
${locator_inputDate}    css=input[id="cardDate"]
${button_continue}  css=button[id="btnContinue"]
${locator_inputOTP}  css=input[id="otpvalue"]
${button_confirm}   css=button[id="btnConfirm"]
${locator_succesPayment}      xpath=//div[contains(text(),"Đã thanh toán")]
${locator_discount}     xpath=//span[contains(text(),"Chọn hoặc nhập mã")]
${locator_voucher}      xpath=//div[@id="listPromotions"]//div[@class="ubtn-inner"]//span[contains(text(),"Áp dụng")]

${locator_valueDiscount}    css=span[id="promoDiscountAmount"]
${locator_valuebill}     xpath=//div[contains(text(),"Giá trị đơn hàng")]//parent::div//following-sibling::div//div
${locator_billPayment}      css=span[id="totalAmountDt"]
#-----mess
${mess_TitlePayment}    Thanh toán qua Ngân hàng NCB
${mess_TitleBill}   Thông tin đơn hàng
${mess_succesPayment}   Đã thanh toán
