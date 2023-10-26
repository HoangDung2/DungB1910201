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
#${NS}   Ngày sinh
#${HoTen}    Họ tên
#${NganhHoc}  Ngành học
#${HoKhau}   Hộ khẩu tỉnh/TP
#${Lop}  Lớp
#${GT}   Giới tính
#${sdt}  Số điện thoại cá nhân
${room}  Phòng
${day}  Dãy
