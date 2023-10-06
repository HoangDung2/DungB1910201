from SeleniumLibrary import SeleniumLibrary
from.AutoLibrary import keyword
class AutoLibrary(SeleniumLibrary):
    Library_SCOPE = 'GLOBAL'
    def __init__(self):
        SeleniumLibrary.__init__(self, 30, run_on_failure='Take Screenshot Failed Case')
        # 'Take Screenshot Failed Case' keyword run when have any keyword from selenium library run failed
        self.add_library_components(Keyword(self))