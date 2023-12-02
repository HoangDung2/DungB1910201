from SeleniumLibrary.base import keyword, LibraryComponent
from SeleniumLibrary.keywords import WaitingKeywords
from datetime import datetime

class  TimeKeywords(LibraryComponent):
    def __init__(self, ctx):
        LibraryComponent.__init__(self, ctx)
        self.selenium_keyword = LibraryComponent(ctx)
        self.selenium_waiting = WaitingKeywords(ctx)
    @keyword
    def convert_time_data(self,time_str):
        """
        :param time:
        :return: yyyy-mm-đ
        """
        datetime_obj = datetime.strptime(time_str, "%d-%m-%Y")
        formatted_date = datetime_obj.strftime("%Y-%m-%d")
        return formatted_date
    @keyword
    def convert_mmddyyyy(self,time_string):
        """
        :param time:
        :return: mm-dd-yyyy
        """
        timestamp_obj = datetime.strptime(time_string, "%Y-%m-%d %H:%M:%S.%f")

        formatted_date = timestamp_obj.strftime("%m/%d/%Y")
        return formatted_date
    # @keyowrd
    # def update_time_from_table(self, tableName, sansTran=False):
    #     cur = None
    #     selectStatement = ("UPDATE %s" % tableName)
    #     try:
    #         cur = self._dbconnection.cursor()
    #         logger.info('Executing : Update From Table  |  %s ' % selectStatement)
    #         result = self.execute_sql(cur, selectStatement)
    #         if result is not None:
    #             if not sansTran:
    #                 self._dbconnection.commit()
    #             return result
    #         if not sansTran:
    #             self._dbconnection.commit()
    #     finally:
    #         if cur:
    #             if not sansTran:
    #                 self._dbconnection.rollback()