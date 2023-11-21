*** Variables ***
${lct_ipt_time}  xpath=//div[@class="text-center mb-3 mt-3"]//input
${lct_mess_fail_bill}  xpath=//div[contains(text(),"Chưa có dữ liệu của tháng này")]
${lct_data_row}    xpath=//div[@class="col-sm-6"]//div[contains(text(),"Dãy")]
${lct_next}     xpath=//h1[contains(text(),"Thống kê hàng tháng")]
${lct_money}    xpath=//table//tbody//td[contains(text(),"{}")]//following-sibling::td[6]
${lct_moth}   xpath=//table//tbody//td[contains(text(),"{}")]//following-sibling::td[7]
${lct_status}   xpath=//table//tbody//td//div[contains(text(),"CHƯA THANH TOÁN ")]//ancestor::tr//td[contains(text(),"{}")]//following-sibling::td[6]
${lct_pag}    css=ul[class="pagination"]>li>span
${lct_sum_money}    xpath=//div[contains(text(),"Dãy {}")]//following-sibling::div[contains(text(),"Tổng tiền")]
${lct_prceeds}      xpath=//div[contains(text(),"Dãy {}")]//following-sibling::div[contains(text(),"Số tiền thu")]
${lct_debt}         xpath=//div[contains(text(),"Dãy {}")]//following-sibling::div[contains(text(),"Số tiền còn nợ")]
${lct_roomtype_room}    xpath=//table//tbody//td[contains(text(),"{}")]//following-sibling::td[contains(text(),"{}")]//following-sibling::td[10]

${tilt_table_bill}  css=div>h4[class="modal-title"]
${tilte_water}  css=div>label[for="finalWater"]
${tilte_electric}   css=div>label[for="finalElectricity"]
${lct_water}    css=div>input[id="finalWater"]
${lct_electric}  css=div>input[id="finalElectricity"]
${btn_close_bill}   css=div>button[class="btn-close"]
${btnBill}  css=button[class="btn btn-success"]
#---Mess
@{list_month}   01-01-2023    02-01-2023  03-01-2023  04-01-2023  05-01-2023  06-01-2023  07-01-023  08-01-2023  09-01-2023  10-01-2023  11-01-2023  12-01-2023
#@{list_month}  10-01-2023  11-01-2023  12-01-2023
#@{list_month}  11-01-2023
${mess_table_water}  Chỉ số nước cuối
${mess_table_electric}  Chỉ số điện cuối
${mess_status_bill}  CHƯA THANH TOÁN
${mess_table_bill}  Cập nhật lại chỉ số điện nước