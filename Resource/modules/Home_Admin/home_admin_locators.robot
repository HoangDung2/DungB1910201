*** Variables ***
#-------- Admin------
${title_admin}  css=h1>a
${logo_admin}   css=ul[id="accordionSidebar"]>a>div[class="sidebar-brand-text mx-3"]
${messTitle_Admin}   HỆ THỐNG QUẢN LÝ KÝ TÚC XÁ

${nav_dash_manage}  css=li[class="nav-item"]>a[aria-controls="collapsePages"]>span
${nav_bill}     css=li[class="nav-item"]>div[id="collapsePages"]>div>a[routerlink="/bill"]
${tilt_bill}    css=div[class="container-fluid"]>div>h1
${nav_res_material}  css=li[class="nav-item"]>div[id="collapsePages"]>div>a[routerlink="/material"]
${nav_manage_serives}   css=li[class="nav-item"]>div[id="collapsePages"]>div>a[routerlink="/service"]
${nav_manageRegis_serives}  css=li[class="nav-item"]>div[id="collapsePages"]>div>a[routerlink="/register-service"]
${nav_add_room}     css=li[class="nav-item"]>div[id="collapsePages"]>div>a[routerlink="/add-room-type"]
${nav_detail_room}  css=li[class="nav-item"]>div[id="collapsePages"]>div>a[routerlink="/room-type"]

#------MESS
${mess_tiltle}   Danh sách hóa đơn điện nước
