# urllib packages
import urllib
from urllib.request import urlopen

with urlopen('http://tycho.usno.navy.mil/cgi-bin/timer.pl') as response:
    for line in response:
        line = line.decode('utf-8') # decoding the binary data to text
        if 'EST' in line or 'EDT' in line:
            print(line)


r = urlopen('http://www.baidu.com/')
r.code  # 2xx : success; 3xx : redirection; 4xx : error; 5xx : server error
r.read()    # '<!DOCTYPE html><!--STATUS OK--><html><head><me......'
