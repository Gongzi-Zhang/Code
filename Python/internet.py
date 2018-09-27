# Internet Access
from urllib.request import urlopen
with urlopen('http://tycho.usno.navy.mil/cgi-bin/timer.pl') as response:
    for line in response:
        line = line.decode('utf-8') # shouldn't they be utf-8 encoding in memory? What's the binary data
        if 'EST' in line or 'EDT' in line:
            print(line)


import smtplib
server = smtplib.SMTP('localhost')
server.sendmail('soothsayer@example.ort', 'jcaesar@example.ort',
        """To: jcaesar@example.org
        From: soothsayer@example.org
        
        Beware the Ides of March
        """)
server.quit()
