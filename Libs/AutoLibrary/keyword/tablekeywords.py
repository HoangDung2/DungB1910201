from SeleniumLibrary.base import keyword, LibraryComponent
from SeleniumLibrary.keywords import WaitingKeywords
from selenium.webdriver.support.ui import WebDriverWait
class TableKeyWords(LibraryComponent):
    def __init__(self, ctx):
        LibraryComponent.__init__(self, ctx)
        self.selenium_keyword = LibraryComponent(ctx)
        self.selenium_waiting = WaitingKeywords(ctx)
    @keyword
    def dymanic_xpath(self,info,locator):
        """
        :param info:
        :param locator:
        :return:
        """
        temp="{}".format(locator)
        locator1=temp.format(info)
        self.selenium_waiting.is_visible(locator1)
        return locator1
    @keyword
    def get_element_table(self,info,locator):
        """
        :param name: Input File
        :return: Will be return name value
        """
        temp = self.dymanic_xpath(info,locator)
        try:
            self.selenium_waiting.wait_until_element_is_visible(temp)
            element = self.selenium_keyword.find_element(temp)
            print(element)
            result=element.text
        except Exception as e:
            raise AssertionError("Exception when checking whether element '{}' is enabled: {}".format(info, e))
        return result


    @keyword
    def get_data_tabel_infostu(self,locator):
        """
        Document
        :param locator: Input locator table
        :return:
        """
        locator1 = "xpath=//table//tbody//td[contains(text(),'{}')]//following-sibling::td[1]"
        list=["Mã số sinh viên","Ngày sinh","Họ tên","Lớp","Ngành học","Giới tính","Hộ khẩu tỉnh/TP","Số điện thoại cá nhân"]
        store=[]
        self.selenium_waiting.wait_until_element_is_visible(locator)
        self.selenium_waiting.wait_until_element_is_visible(locator1)
        try:
            for i in list:
                temp = self.get_element_table(i,locator1)
                store.append(temp)
        except Exception as e:
            raise AssertionError("Exception when checking whether element '{}' is enabled: {}".format(locator, e))
        return store
