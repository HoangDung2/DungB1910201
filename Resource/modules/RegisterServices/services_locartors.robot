*** Variables ***
${locatorTitleService}    xpath=//div[@class="section-title mt-5"]//h2
${locatorTitleService_1}    xpath=//div[@class="section-title mt-5"]//p
${locator_registerServices}     xpath=//a[contains(text(),"{}")]//parent::h4//parent::div/following-sibling::button
${locator_licensePlate}    xpath=//a[contains(text(),"Gửi xe máy")]//parent::h4/following-sibling::form//input
${info_licensePlate}    xpath=//table[@class="table"]//tbody//td[contains(text(),"Gửi xe đạp")]/following-sibling::td[2]
${name_tableServices}   xpath=//table[@class="table"]//tbody//td[contains(text(),"{}")]

${locator_payment_service}  xpath=//table[@class="table"]//tbody//td[contains(text(),"{}")]//following-sibling::td[3]//div[@class="payment"]
${locator_inva_payment}     xpath=//table[@class="table"]//tbody//td[contains(text(),"{}")]//following-sibling::td[3]//div[@class="p-2"]

${submit_messfail_1}     xpath=//div[@class="swal2-actions"]//button[text()='OK']
${submit_messfail_2}     xpath=//div[@class="swal2-actions"]//button[text()='Có']
#-----mess----
${mess_services}    DỊCH VỤ
${mess_services_1}  CHÚNG TÔI CUNG CẤP CÁC DỊCH VỤ
${mess_fail_1}   Có lỗi xảy ra
${mess_fail_2}   Dịch vụ đã được đăng ký trong học kỳ này
${mess_fail_3}   Ngày đăng ký không phù hợp
${mess_fail_4}   Đã hết hạn đăng ký dịch vụ