*** Variables ***
${locatorUsername}  css=input[id='username']
${locatorPassword}  css=input[id='password']
${contentMessFail}  xpath=//div[@class='swal2-popup swal2-modal swal2-icon-error swal2-show']//h2
${btnSumit}     xpath=//button[contains(@text(),'')]
#----Message Login----
${infoMessFail}     Đăng nhập thất bại
${infoIDFail}