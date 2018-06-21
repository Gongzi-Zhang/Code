# simple mail transfer protocol

#!/usr/bin/env python


import smtplib
from email.mime.text import MIMEText

# create a plaintext email message
msg = MIMEText("Look, I'm actually doing some work")

msg['Subject'] = 'notification'
msg['From'] = 'jinzhong@me.com'
msg['To'] = 'boss@BOSS.com'

# Send the message
SMTP_SERVER = 'smtp.example.com'
SMTP_PORT  =587

session = smtplib.SMTP(SMTP_SERVER, SMTP_PORT)
session.ehlo()
session.starttls()
session.ehlo()
session.login(msg['From'], 'secretPassword')

session.sendmail(msg['From'], msg['To'], msg.as_string())
session.quit()
