from SeleniumLibrary.base import keyword, LibraryComponent
from SeleniumLibrary.keywords import WaitingKeywords
from .elementkeywords import ElementKeywords
from .timekeywords import TimeKeywords
from selenium.webdriver.support.ui import WebDriverWait
class TableKeyWords(LibraryComponent):
    def __init__(self, ctx):
        LibraryComponent.__init__(self, ctx)
        self.selenium_keyword = LibraryComponent(ctx)
        self.selenium_waiting = WaitingKeywords(ctx)
        self.selenium_elementkey=ElementKeywords(ctx)
        self.selenium_timekey = TimeKeywords(ctx)
    @keyword
    def get_element_table(self,info,locator):
        """
        :param name: Input File
        :return: Will be return name value
        """
        temp = self.selenium_elementkey.dymanic_xpath(info,locator)
        try:
            self.selenium_waiting.wait_until_element_is_visible(temp)
            element = self.selenium_keyword.find_element(temp)
            print(element)
            result=element.text
        except Exception as e:
            raise AssertionError("Exception when checking whether element '{}' is enabled: {}".format(info, e))
        return result


    @keyword
    def get_data_tabel_infostu(self):
        """
        Document
        :param locator: Input locator table
        :return:
        """
        locator = "xpath=//table//tbody//td[contains(text(),'{}')]//following-sibling::td[1]"
        list=["Mã số sinh viên","Họ tên","Ngành học","Hộ khẩu tỉnh/TP","Ngày sinh","Lớp","Giới tính","Số điện thoại cá nhân"]
        store=[]
        try:
            for i in list:
                if i == "Ngày sinh":
                    temp = self.get_element_table(i,locator)
                    temp_time = self.selenium_timekey.convert_time(temp)
                    store.append(temp_time)
                else:
                    temp = self.get_element_table(i,locator)
                    store.append(temp)
        except Exception as e:
            raise AssertionError("Exception when checking whether element '{}' is enabled: {}".format(locator, e))
        return store
