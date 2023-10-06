from SeleniumLibrary.base import keyword, LibraryComponent
from SeleniumLibrary.keywords import WaitingKeywords
class Keyword(LibraryComponent):
    def __init__(self, ctx):
        LibraryComponent.__init__(self, ctx)
        self.selenium_keyword = LibraryComponent(ctx)
        self.selenium_waiting = WaitingKeywords(ctx)
    @keyword
    def get_element(self,locator):
        """Doccument: 1 MSSV tr[1]/td[1], 2 Ngau sinh tr[1]/td[2]
                      3 Ho Ten tr[2]/td[1] 4 Lop tr[2]/td[2]
                      5 Nganh hoc tr[3]/td[1] 6 Gioi tinh tr[3]/td[1]
                      7 HoKHau tr[4]/td[1], 7 SDT tr[4]/td[1]
        """
        self.selenium_waiting.wait_until_element_is_visible(locator)
        element=self.selenium_keyword.find_elements()
        value=[]
        try:

        except Exception as e:
            raise AssertionError("Exception when checking whether element '{}' is enabled: {}".format(locator, e))
        return value