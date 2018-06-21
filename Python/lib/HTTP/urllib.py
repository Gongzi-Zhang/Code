# urllib packages
import urllib

r = urllib.urlopen('http://www.baidu.com/')
r.code  # 2xx : success; 3xx : redirection; 4xx : error; 5xx : server error
r.read()    # '<!DOCTYPE html><!--STATUS OK--><html><head><me......'
