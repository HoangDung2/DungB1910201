*** Variables ***
${locatorRoomtype}  xpath=//div[@class="container"]//div//p[text()='Chọn dãy phòng phù hợp với nhu cầu bạn']
${locatorChoseRoom}     xpath=//div[@class="container"]//div//h2[text()='Loại dãy phòng']
${locartorNavRoom}      xpath=//header//nav//li//a//span
# lấy giá trị năm
# locortor admin nho custom lai
${locarNamhoc}      xpath=xpath=//form//span[text()='Năm học:']
${locartorTimedk}   xpath=xpath=//form//span[text()='Thời gian đăng ký:']
${locartorTimeo}    xpath=xpath=//form//span[text()='Thời gian ở:']
${locartorValuetimeo}    (xpath=//form//span[text()='Thời gian ở:']//parent::div//text())[2]
${locartorValuenamhoc}       (xpath=//form//span[text()='Năm học:']//parent::div//text())[2]
${locartorValuetimedk}    (xpath=//form//span[text()='Thời gian đăng ký:']//parent::div//text())[2]
# lấy số lượng phòng sll
${locatorInfoRoom}  xpath=//app-room//div[@class="card-body"]//div//div[@class="d-flex justify-content-between"]//span[contains(text(),'{}')]//following-sibling::span
${locartorRoom}     xpath=//app-room
${messStatusroom}   xpath=//app-room//div[@class="card-body"]//div//div[@class="text-center"]//span[@class="text-center text-success"]
${messNotify}   xpath=//div[@class="col-sm-4 text-danger"]//text()
#----Mess----
${messRoomType}  Chọn dãy phòng phù hợp với nhu cầu bạn
${messChoseRoom}    Loại dãy phòng
${messAirConditioned}   Có máy lạnh
${messCooking}  Cho phép nấu ăn
${messAir}  Máy lạnh
${messCook}  Nấu ăn
${messStatuscook}   Cho phép
${messStatisAir}    Có
${number_4}     4
${number_6}     6
${number_8}     8
${all}  0