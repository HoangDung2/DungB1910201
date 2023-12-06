*** Variables ***
${lct_tilte_add_room}   css=div[class="container"]>div
${lct_input_add}    xpath=//form//div[@class="input-data"]/input[@name="{}"]
${lct_img}  xpath=//form//div[@class="input-data"]/input[@type="file"]
${lct_cooking}  xpath=//form//div[@class="form-row"]//label[contains(text(),"Cho phép nấu ăn không ?")]//following-sibling::input[@value="{}"]
${lct_AirCondi}     xpath=//form//div[@class="form-row"]//label[contains(text(),"Có máy lạnh không ?")]//following-sibling::input[@value="{}"]
${lct_submit_add_room}   xpath=//form//div[@class="form-row"]//input[@type="submit"]
${lct_tilt_detail_room}  xpath=//div[@class="container-fluid"]//div//h6
${lct_status_detail_room}   xpath=//table//tbody//td[contains(text(),"{}")]//following-sibling::td[6]
${lct_choose_status_room}   xpath=//table//tbody//td[contains(text(),"{}")]//following-sibling::td[6]//select//option[@value="{}"]

${lct_edit_bill_detail_room}    xpath=//table//tbody//td[contains(text(),"{}")]//following-sibling::td[7]
${lct_input_form_bill_detail}   xpath=//table//tbody//td[1][text()="{}"]//following-sibling::td[4]//div//a[@class="text-secondary"]