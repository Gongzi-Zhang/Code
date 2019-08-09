import datetime
datatime.datetime.now()
datetime.datetime.utcnov()



from datetime import date

now = date.today()
now.strftime("%m-%d-%y, %d %b %Y is a %A on the %d day of %B.")

birthday = date(1964, 7, 31)
age = now - birthday
age.days

