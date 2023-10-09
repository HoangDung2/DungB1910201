*** Variables ***
${locatorRoomtype}  xpath=//div[@class="container"]//div//p[text()='Chọn dãy phòng phù hợp với nhu cầu bạn']
${locatorChoseRoom}     xpath=//div[@class="container"]//div//h2[text()='Loại dãy phòng']
# lấy giá trị năm
# locortor admin nho custom lai
${locarNamhoc}      xpath=xpath=//form//span[text()='Năm học:']
${locartorTimedk}   xpath=xpath=//form//span[text()='Thời gian đăng ký:']
${locartorTimeo}    xpath=xpath=//form//span[text()='Thời gian ở:']
${locartorValuetimeo}    (xpath=//form//span[text()='Thời gian ở:']//parent::div//text())[2]
${locartorValuenamhoc}       (xpath=//form//span[text()='Năm học:']//parent::div//text())[2]
${locartorValuetimedk}    (xpath=//form//span[text()='Thời gian đăng ký:']//parent::div//text())[2]
# lấy số lượng phòng sll
${cooking}  xpath=//app-room//div[@class="card-body"]//div//div[@class="d-flex justify-content-between"]//span[contains(text(),'{}')]//following-sibling::span
${locartorRoom}     xpath=//app-room
${messStatusroom}   xpath=//app-room//div[@class="card-body"]//div//div[@class="text-center"]//span[@class="text-center text-success"]
#----Mess----
${messNotify}   xpath=//div[@class="col-sm-4 text-danger"]//text()