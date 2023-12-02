*** Variables ***
${tilt_mana_servicers}  css=div[class="container-fluid"]>div>div>div>div>h6
${lct_edit_services}    xpath=//table//tbody//td[contains(text(),"{}")]//following-sibling::td[4]//button
${lct_form_edit_serives}    xpath=//form[@class="ng-valid ng-dirty ng-touched"]//div//label[@for="{}"]//following-sibling::input
${lct_content_form}     xpath=//form[@class="ng-valid ng-dirty ng-touched"]//div//label[@for="description"]//following-sibling::textarea
${lct_status_form}  xpath=//form[@class="ng-valid ng-dirty ng-touched"]//div//label[text()='Trạng thái']//following-sibling::input[@ng-reflect-value="{}"]
${lct_submit_form_res}  xpath=//div[@class="modal-footer"]//button[contains(text(),"Cập nhật")]