*** Variables ***
${temp}    //section[@class='container']//h4/following-sibling::div//child::table[@class="table table-striped text-center"]//tbody
${lineTableInfo}    xpath=${temp}tbody//tr
${elementInfo}     xpath=${temp}//tr[""]//td[""]
${tilte}    xpath=////section[@class='container']//h4[contains(@text,"Thông tin sinh viên và dịch vụ đã đăng ký")]