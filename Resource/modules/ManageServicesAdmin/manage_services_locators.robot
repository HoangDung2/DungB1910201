*** Variables ***
${tilt_mana_servicers}  css=div[class="container-fluid"]>div>div>div>div>h6
${tilt_manaRe_serivers}  css=div[id="content"]>div>div>h1
${lct_edit_services}    xpath=//table//tbody//td[contains(text(),"{}")]//following-sibling::td[4]//button
${lct_form_edit_serives}    xpath=//div[@id="myModal"]//form//div//label[@for="{}"]//following-sibling::input
${lct_content_form}     xpath=//div[@id="myModal"]//form//div//label[@for="description"]//following-sibling::textarea
${lct_status_form}  xpath=//div[@id="myModal"]//form//div//label[text()='Trạng thái']//following-sibling::input[@ng-reflect-value="{}"]
${lct_submit_form_res}  xpath=//div[@class="modal-footer"]//button[contains(text(),"Cập nhật")]
${lct_all_files}    xpath=//div[contains(text(),"{}")]//select
${lct_option}   xpath=//div[contains(text(),"{}")]//select[@id="{}"]//option[@value='{}']
${lct_page_mana_services}   css=ul[class="pagination"]>li>span
${lct_input_mssv}   css=form>input[name="txt"]
#-----MEss
${mess_semester}    Học kỳ
${mess_year}    Năm học
${mess_field}   Ngành
${mess_buckle}  Khóa
${mess_gender}  Giới tính