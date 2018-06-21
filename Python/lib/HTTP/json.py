import requests
import json

json_obj = json.loads("{'key':'value'}")
json_str = json.dumps(json_obj)

# to get json responce
headers = {
        'Uer-Agent':'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36',
        'Accept':'application/json',
        'X-Request':'JSON',
        'X-Requested-With':'XMLHttpRequest'
        }
r = requests.get(url=url, headers=headers)

