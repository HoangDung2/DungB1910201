from SeleniumLibrary.base import keyword, LibraryComponent
from SeleniumLibrary.keywords import WaitingKeywords
import os
import shutil
class ImageKeyWords(LibraryComponent):
    def __init__(self, ctx):
        LibraryComponent.__init__(self, ctx)
        self.selenium_keyword = LibraryComponent(ctx)
        self.selenium_waiting = WaitingKeywords(ctx)
    @keyword
    def count_image_file(self,path):
        """

        :param path: Input Path Folder
        :return: Number of Image
        """
        image_extensions = ['.jpg', '.jpeg', '.png', '.bmp']

        image_count = 0

        for root, dirs, files in os.walk(path):
            for file in files:
                if any(file.lower().endswith(ext) for ext in image_extensions):
                    image_count += 1
        return image_count

    @keyword
    def get_image_files(setf, path):
        """

        :param path:Input Path Folder
        :return: Get Name Path Image
        """
        image_files = []
        image_extensions = ['.jpg', '.jpeg', '.png', '.bmp']
        for root, dirs, files in os.walk(path):
            for file in files:
                if any(file.lower().endswith(ext) for ext in image_extensions):
                    image_files.append(os.path.join(root, file))
        return image_files
    @keyword
    def clear_image_folder(self, path):
        """

        :param path: Input Path Folder
        :return: Delete All fill Png
        """
        image_extensions = ['.jpg', '.jpeg', '.png', '.bmp', '.webm']
        for root, dirs, files in os.walk(path):
            for file in files:
                if any(file.lower().endswith(ext) for ext in image_extensions):
                    file_path = os.path.join(root, file)
                    os.remove(file_path)

    @keyword
    def copy_image_folder(self,source_folder, destination_folder):
        try:
            shutil.copytree(source_folder, destination_folder)
            print(f"File will copy '{source_folder}' change '{destination_folder}'")
        except Exception as e:
            print(f"Fail: {e}")

    @keyword
    def create_folder(self,path):
        if not os.path.exists(path):
            os.makedirs(path)