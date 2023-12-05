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
        Input 1 agrumment
        :param info:
        :param locator:
        :return:
        """
        temp="{}".format(locator)
        locator1=temp.format(info)
        self.selenium_waiting.is_visible(locator1)
        return locator1
    @keyword
    def dymanic_xpath_more(self, info1, info2, locator):
        """
        :param info1:
        :param info2:
        :param locator:
        :return:
        """

        xpath=locator.format(info1, info2)
        # temp = "{} {}".format(info1, info2)
        #
        # locator_with_info = temp.format(locator)
        self.selenium_waiting.is_visible(xpath)
        return xpath
    @keyword
    def dymanic_xpath_three(self, info1,info2, info3, locator):
        """
        :param info1:
        :param info2:
        :param locator:
        :return:
        """

        xpath=locator.format(info1, info2, info3)
        # temp = "{} {} {}".format(info1, info2, info3)
        #
        # locator_with_info = temp.format(locator)
        self.selenium_waiting.is_visible(xpath)
        return xpath

    @keyword
    def compare_text(self,locator,string):
        """
        :param locator: Input locator get value
        :param string: Input string
        :return: True
        """
        self.selenium_keyword.find_element(locator)
        self.selenium_waiting.wait_until_element_is_visible(locator)
        element = self.find_element(locator)
        text_element = element.text
        if text_element == string:
            return True
        else:
            return False

    @keyword
    def convert_value_integer(self,string):
        try:
            if isinstance(string, int):
                return string
            else:
                integer_value = int(string.replace(',', ''))
                return integer_value
        except ValueError as e:
            print("Error:", e)
    @keyword
    def clear_element_arr(self,arry):
        arry.clear()

