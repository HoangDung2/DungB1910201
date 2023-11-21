*** Variables ***
#----Xpath----
${title}   xpath=//h1[@class="logo me-auto me-lg-0"]
${danamicIDhero}    xpath=//section[@id="hero"]//div//div//div//h3[a]
${iconLogo}     xpath=//h1//a[contains(@text(),'')]
${sloganHome_1}         xpath=//div[@data-aos='fade-up']//h1
${sloganHome_2}     xpath=//div[@data-aos='fade-up']//h1/following-sibling::h2
${locatorService}   xpath=//header//nav//li//a[contains(text(),"Dịch vụ")]
${locatorMaterialRepair}    xpath=//header//nav//li//a[contains(text(),"Sửa chữa vật chất")]
${locatorRoomType}      xpath=//header//nav//li//span[contains(text(),"Loại phòng")]
${locatorFeedBack}      xpath=//header//nav//li//a[contains(text(),"Sửa chữa vật chất")]
#----Messen----
${logoHome}     DORMITORY...
${sloganMess_1}   Chúng tôi là gia đình, không chỉ là nơi ở .
${sloganMess_2}   Tạo kỷ niệm tại ký túc xá - Nơi bạn gọi là nhà
#----List Name----
@{listMenuIcon}     Hòa đồng   Thân thiện   Nơi ở   Tiết kiệm   An toàn
@{lishDashboar}     Trang chủ   Sửa chữa vật chất   Thông tin cá nhân   Dịch vụ    Đăng xuất
#-------- Admin------
${title_admin}  css=h1>a
${logo_admin}   css=ul[id="accordionSidebar"]>a>div[class="sidebar-brand-text mx-3"]

${messTitle_Admin}   HỆ THỐNG QUẢN LÝ KÝ TÚC XÁ

