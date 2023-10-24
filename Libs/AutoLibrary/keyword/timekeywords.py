from SeleniumLibrary.base import keyword, LibraryComponent
from SeleniumLibrary.keywords import WaitingKeywords
from datetime import datetime

class  TimeKeywords(LibraryComponent):
    def __init__(self, ctx):
        LibraryComponent.__init__(self, ctx)
        self.selenium_keyword = LibraryComponent(ctx)
        self.selenium_waiting = WaitingKeywords(ctx)
    @keyword
    def convert_time(self,time_str):
        """
        :param time:
        :return:
        """
        datetime_obj = datetime.strptime(time_str, "%d-%m-%Y")
        formatted_date = datetime_obj.strftime("%Y-%m-%d")
        return formatted_date
