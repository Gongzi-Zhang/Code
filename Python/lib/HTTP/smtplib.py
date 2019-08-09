import smtplib
server = smtplib.SMTP('localhost')
server.sendmail('sendor@example.org', 'receiver@example.org',
        """To: receiver@example.org
        From: sendor@example.or
        
        Beware the Ides of March.
        """)
server.quit()
