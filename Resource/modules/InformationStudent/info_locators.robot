*** Variables ***
${temp}    //section[@class='container']//h4/following-sibling::div//child::table[@class="table table-striped text-center"]//tbody
${lineTableInfo}    xpath=${temp}tbody//tr
${tilte}    xpath=//section[@class='container']//h4[contains(@text,"Thông tin sinh viên và dịch vụ đã đăng ký")]
${locatorInfo}  xpath=//header//nav//li//a[contains(text(),"Thông tin cá nhân")]
${tilteInfo}    xpath=//div[@class="container"]//div[@class="section-title mt-5"]//h2
${tilteInfo_1}    xpath=//div[@class="container"]//div[@class="section-title mt-5"]//p
${tilteInfo_2}    xpath=//section[@class="container"]//*[contains(text(),"Thông tin sinh viên và dịch vụ đã đăng ký")]
${locatorInfotalble}    xpath=//table//tbody//td[contains(text(),'{}')]//following-sibling::td[1]
${locartor_statusRoom}  xpath=//div[@class="text-danger"]

${lctTiltelMessFail}  xpath=//h2[@class="swal2-title"]
${lctMessFail}  xpath=//h2[@class="swal2-title"]//following-sibling::div[@id="swal2-html-container"]
#----Mess----
${messInfo}     Thông tin sinh viên
${messInfo_1}   Kiểm tra thông tin chính xác
${messInfo_2}   Thông tin sinh viên và dịch vụ đã đăng ký
${MessData}     Dữ Liệu Không Trùng Khớp

${messService}  Bạn phải là sinh viên ở phòng mới đăng ký dịch vụ được
${mesMaterialRepair}    Bạn phải là sinh viên ở phòng mới đăng ký sửa chữa được
${messFail_Homepage}  Có lỗi xảy ra
${MSSV}  Mã số sinh viên
${room}  Phòng
${day}  Dãy
#----- Admin ----
${lct_info_user_admin}   css=a[id="userDropdown"]>span
${locator_nav_info}     css=div[aria-labelledby="userDropdown"]>a[routerlink="/information"]
${locator_name_admin}   css=div[class="col-md-3 border-right"]>div>span[class="font-weight-bold"]
${locator_mail_admin}   css=div[class="col-md-3 border-right"]>div>span[class="text-black-50"]
${locator_logout_admin}  css=div[aria-labelledby="userDropdown"]>a[data-target="#logoutModal"]

@{list_info_admin}  Số điện thoại   Địa chỉ     Giới tính   Mã số   Ngày sinh
${lct_row_table}    xpath=//div[@class="col-md-9"]//div//div[@class="row mt-3"]//div
${lct_table_info_admin}     xpath=//div[@class="col-md-9"]//div//div[@class="row mt-3"]//div//label[contains(text(),'{}')]//following-sibling::input