# HTTP for Humans

import requests

## URL
r = requests.get("http://xlzd.me/query", params={"name":"xlzd", "lang":"python"})
print r.url     # http://xlzd.xlzd/query?name=xlzd&&lang=python

## sent HTTP request
r = requests.post("http://xlzd.me/login", data = {"user":"xlzd", "pass":"mypassword"})
r = requests.put("http://xlzd.me/post", data = {"title":"article"})
r = requests.delete("http://xlzd.me/foo")
r = requests.head("http://xlzd.me/bar")
r = requests.options("http://xlzd.me/abc")

## HTTP response
r = requests.get('http://xlzd.me')
r.status_code   # 200
r.encoding      # 'UTF-8'
r.headers       # {'Date': 'Thu, 20 Apr 2017 15:09:27 GMT', 'Content-Encoding': 'gzip', 'X-Powered-By': 'PHP/5.4.45', 'Server': 'nginx', 'Transfer-Encoding': 'chunked', 'X-Frame-Options': 'DENY', 'X-Pingback': 'https://xlzd.me/action/xmlrpc', 'Content-Type': 'text/html; charset=UTF-8', 'Vary': 'Accept-Encoding', 'Connection': 'keep-alive', 'X-Content-Type-Options': 'nosniff'}
r.cookies       # <ReqestsCookieJar[]>
r.text          #  u'<!DOCTYPE HTML>\n<html lang="zh-CN">\n\t<hea......
r.content       # extract file, images ...
r.json          # get json content

### HTTP header
url = 'http://xlzd.me'
headers = {'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.80 Safari/537.36', 'Cookie':'haha'}   # pretent U-A as Chrome browser
requests.get(url, headers=headers)

r = requests.get('http://xlzd.me', allow_redirects=False)   ### redirection
r = requests.get('http://xlzd.me', timeout=3)               ### timeout

### Proxy
proxies = {
        "http" : "http://192.168.31.1:3128",
        "https": "http://10.10.1.10:1080",
        }
r = requests.get("http://xlzd.me", proxies=proxies)

### session(会话)
session = requests.Session()
session.post("http://xlzd.me/login", data = {"user":"xlzd", "pass":"mypassword"})
session.put('http://xlzd.me/new', data = {'title':'title of article', 'data':'content'})
