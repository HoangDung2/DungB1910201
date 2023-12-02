*** Variables ***
${lct_confirm}      xpath=//table//tbody//td//button//ancestor::tr//td[contains(text(),"{}")]//following-sibling::td[7]
${lct_input_date_res}   css=form>input[name="selectedDate"]
${lct_send}  css=div>button[class="btn btn-success"]
