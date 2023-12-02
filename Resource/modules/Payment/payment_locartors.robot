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
${locator_succesPayment}      xpath=//div[contains(text(),"thanh toán")]
${locator_discount}     xpath=//span[contains(text(),"Chọn hoặc nhập mã")]
${locator_voucher}      xpath=//div[@id="listPromotions"]//span[contains(text(),"Áp dụng")]

${locator_code_voucher}     xpath=//div[@id="listPromotions"]//span[contains(text(),"Áp dụng")]//ancestor::div[@class="col-auto promo-right"]//preceding::div[contains(@class,"row-8 align-items-center")]//div[@class="col"]
${locator_IP_Voucher}   css=input[id="inputPromoManual"]
${submit_code_voucher}  css=button[id="btnPromoManual"]
${cancel_payment}   css=a[data-bs-target="#modalCancelPayment"]
${locator_voucher_overNu}   xpath=//div[@id="listPromotions"]//div[contains(text(),"Số lần sử dụng")]//ancestor::div[@class="promo-left-inner"]//child::div[contains(@class,"row-8 align-items-center")]//div[@class="col"]
${img_voucher_overNu}   xpath=//div[@id="listPromotions"]//div[contains(text(),"Số lần sử dụng")]//ancestor::div[@class="row row-0 align-items-center"]

${locator_voucher_indvalTime}   xpath=//div[@id="listPromotions"]//div[contains(text(),"Không đáp ứng")]//ancestor::div[@class="promo-left-inner"]//child::div[contains(@class,"row-8 align-items-center")]//div[@class="col"]
${img_voucher_invali_time}   xpath=//div[@id="listPromotions"]//div[contains(text(),"Không đáp ứng")]//ancestor::div[@class="row row-0 align-items-center"]

${locator_error_overNu}     xpath=//div[@class="col title weight5 error-message"]

${locator_valueDiscount}    css=span[id="promoDiscountAmount"]
${locator_valuebill}     xpath=//div[contains(text(),"Giá trị đơn hàng")]//parent::div//following-sibling::div//div
${locator_billPayment}      css=span[id="totalAmountDt"]

${locator_mess_cancel}  css=div[class="header"]
${locator_mess_cancel_1}  css=div[class="content"]>p
${locator_alert_cancel}     xpath=//h2[contains(text(),"Hủy thanh toán")]
${locator_alert_cancel_1}   xpath=//div[@id="modalCancelPayment"]//child::div[contains(@class,"modal-body")]
${button_cancel_alert}  xpath=//span[contains(text(),'Xác nhận hủy')]

${locator_mess_cardID}  css=div[id="err-card"]>ul>li
${locator_mess_namPay}  css=ul[id="parsley-id-7"]>li
${locator_messDate}  css=ul[id="parsley-id-9"]>li

#-----mess
${mess_TitlePayment}    Thanh toán qua Ngân hàng NCB
${mess_TitleBill}   Thông tin đơn hàng
${mess_succesPayment}   Đã thanh toán
${mess_error_overN}  Quý khách đã sử dụng hết số lượt khuyến mại của chương trình
${mess_error_InvaliT}   Mã khuyến mại không hợp lệ

${mess_alert_1}     Hủy thanh toán
${mess_alert_2}     Quý khách có chắc chắn muốn hủy thanh toán giao dịch này?

${mess_cancel_1}    Thanh toán thất bại.
${mess_cancel_2}    Giao dịch của bạn đã bị hủy bỏ
${mess_invali_payment}  CHƯA THANH TOÁN
${mess_vali_payment}     ĐÃ THANH TOÁN
