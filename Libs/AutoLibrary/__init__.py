from SeleniumLibrary import SeleniumLibrary
from .keyword import TableKeyWords
from .keyword import ElementKeywords
from .keyword import ImageKeyWords
from .keyword import TimeKeywords
from .keyword import EmailKeywords
class AutoLibrary(SeleniumLibrary):
    Library_SCOPE = 'GLOBAL'
    def __init__(self):
        SeleniumLibrary.__init__(self, 30, run_on_failure='Take Screenshot Failed Case')
        # 'Take Screenshot Failed Case' keyword run when have any keyword from selenium library run failed
        # self.add_library_components([ElementKeywords(self)])
        self.add_library_components([TableKeyWords(self),ElementKeywords(self),ImageKeyWords(self),TimeKeywords(self),EmailKeywords(self)])