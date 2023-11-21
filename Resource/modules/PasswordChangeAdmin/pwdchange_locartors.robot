*** Variables ***
${lct_pwd_change}   css=div[class="col-md-3 border-right"]>div>span[class="change-password"]
${lct_pwd_old}  xpath=//div[@class="col-md-9"]//div[@class="row mt-3"]//input[@placeholder="Nhập mật khẩu cũ "]
${lct_pwd_new}  xpath=//div[@class="col-md-9"]//div[@class="row mt-3"]//input[@placeholder="Nhập mật khẩu mới "]
${lct_pwd_confirm}  xpath=//div[@class="col-md-9"]//div[@class="row mt-3"]//input[@placeholder="Nhập lại mật khẩu mới "]
${btSubmit}     css=button[class="btn btn-success"]
#----Mess
${mess_Tiltepwd}    Thất bại
${mess_Tiltepwd_success}    Thành công
