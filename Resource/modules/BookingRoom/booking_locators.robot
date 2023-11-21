*** Variables ***
#${img_choose}   xpath=//app-room//h5[contains(text(),"A2")]/parent::div/parent::div/parent::div//div[@class="card-img"]//img
${locatorRoom}   xpath=//table//tbody//td[contains(text(),'{}')]//following-sibling::td[4]//button
${locatorSroll}  xpath=//table//thead//th[3]
${locatorTitleMess}     css=div>h2[class='swal2-title']
${locatorTitleMess_1}   css=div>div[id=swal2-html-container]
${submit_register}      xpath=//div[@class="swal2-actions"]//button[text()='Có']
${submit_messfail}     xpath=//div[@class="swal2-actions"]//button[text()='OK']
${locatorSuccess}       xpath=//div[contains(@class,"swal2-backdrop-show")]//h2
${locatorSuccess_1}     xpath=//div[contains(@class,"swal2-backdrop-show")]//div[@id="swal2-html-container"]
${confirm_Succes}       xpath=//div[contains(@class,"swal2-backdrop-show")]//div[@class="swal2-actions"]//button[text()='OK']
#----Mess----
${messTitleMess}    Bạn có chắc chắn đăng ký phòng này ?
${messTitleMess_1}  Sau khi thanh toán bạn không thể hoàn tác.
${messSuccess}      Thành công
${messSuccess_1}    Đăng ký phòng thành công
${mess_Fail_1}    Vui lòng chọn phòng phù hợp với giới tính của bạn
${room_full}       Room Full Slot Or RoomType Have't Suitable For Student Gender


