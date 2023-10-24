from SeleniumLibrary.base import keyword, LibraryComponent
from SeleniumLibrary.keywords import WaitingKeywords
class  ElementKeywords(LibraryComponent):
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
    def compare_text(self,locator,string):
        """
        :param locator: Input locator get value
        :param string: Input string
        :return: True
        """
        self.selenium_keyword.find_element(locator)
        self.selenium_waiting.wait_until_element_is_visible(locator)
        element=self.find_element(locator)
        text_element=element.text
        if  text_element == string:
            return True
        else:
            return False
