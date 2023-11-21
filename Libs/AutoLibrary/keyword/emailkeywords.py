from SeleniumLibrary.base import keyword, LibraryComponent
from SeleniumLibrary.keywords import WaitingKeywords
import imaplib
import email
import re
from email.header import decode_header
from bs4 import BeautifulSoup


class EmailKeywords(LibraryComponent):
    def __init__(self, ctx):
        LibraryComponent.__init__(self, ctx)
        self.selenium_keyword = LibraryComponent(ctx)
        self.selenium_waiting = WaitingKeywords(ctx)

    @keyword
    def read_email(self):
        # Kết nối đến máy chủ IMAP
        email_user = 'dungb1910201@student.ctu.edu.vn'
        email_pass = 'ytpicutullyhihtb'
        mail = imaplib.IMAP4_SSL("imap.gmail.com")
        # Đăng nhập vào tài khoản email
        mail.login(email_user, email_pass)
        # Chọn hộp thư
        mail.select("INBOX")
        # Tìm và lấy danh sách ID của các email trong hộp thư
        _, selected_mails = mail.search(None, f'FROM "kytucxa190@gmail.com"')
        # print("Total Messages from kytucxa190@gmail.com:", len(selected_mails[0].split()))
        latest_email_id = selected_mails[0].split()[-1]
        # for num in selected_mails[0].split():
        #     print(num)
        _, data = mail.fetch(latest_email_id, '(RFC822)')
        _, bytes_data = data[0]
        email_message = email.message_from_bytes(bytes_data)
        print("\n===========================================")
        # access data
        print("To:", email_message["to"])
        print("From: ", email_message["from"])
        print("Date: ", email_message["date"])
        decoded_subject = " ".join(
            [text.decode(encoding or 'utf-8') for text, encoding in decode_header(email_message["subject"])])
        print("Subject: ", decoded_subject)
        # print("Body:",email_message["body"])
        for part in email_message.walk():
            if part.get_content_type() == "text/plain" or part.get_content_type() == "text/html":
                message = part.get_payload(decode=True)
                soup = BeautifulSoup(message.decode('utf-8'), 'html.parser')
                # print(soup)
                tables = soup.find_all('table')
                # Lấy cái tittle nè
                tittle = soup.select_one("div[class='header']>h3")
                print(tittle.text)
                # Lấy thông tin table email
                rows = tables[0].find_all('tr')
                for row in rows:
                    cells = row.find_all('td')
                    if cells[1].text == '1':
                        temp = 'Nam'
                    elif cells[1].text == '0':
                        temp = 'Nữ'
                    else:
                        temp = cells[1].text
                    print(f"{cells[0].text}  {temp} ")
                rows = tables[1].find_all('tr')

                tittle_room = soup.select_one("h4[style='text-align: center']")
                print("         ", tittle_room.text)
                for row in rows:
                    cells = row.find_all('td')
                    if cells[1].text == '1':
                        temp = 'Nam'
                    elif cells[1].text == '0':
                        temp = 'Nữ'
                    else:
                        temp = cells[1].text
                    print(f"{cells[0].text}  {temp} ")
                texts = soup.select('span[style="font-size: 10pt"]')
                ol_tag = soup.find("ol", {"start": "3"})
                p_tags = ol_tag.find_all_next("p")
                i = 1;
                for text in texts:
                    temp = text.text
                    result = re.split(r'\s{2,}', temp)
                    new_text = ' '.join(result)
                    print(i, "", new_text)
                    i += 1
                    if i == 3:
                        print(p_tags[0].get_text())
                count = 1;
                for counts in range(count, len(p_tags)):
                    temp = p_tags[counts].get_text()
                    result = re.split(r'\s{2,}', temp)
                    new_text = ' '.join(result)
                    print(new_text)
                print("======================================== ==\n")
                break

        mail.logout()
