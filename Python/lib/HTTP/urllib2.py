import urllib
import urllib2

urllib2.urlopen(url, data, timeout)
response = urllib2.urlopen("http://www.zhihu.com")
print response.read()

# more logical reasonable
request = urllib2.Request("http://www.baidu.com")
response = urllib2.urlopen(request)
print response.read()

# POST method
values = {"username":"1016903130@qq.com", "password":"XXXX"}
data = urllib.urlencode(values)
url = "https://passport.csdn.net/account/login?from=http://my.csdn.net/my/mycsdn"
request = urllib2.Request(url, data)
response = urllib2.urlopen(request)
print response.read()
