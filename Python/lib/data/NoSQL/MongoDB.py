import datatime
from pymongo import MongoClient

client = MongoClient()  # default ip: localhost, port: 27017
client = MongoClient(host, port)
client = MongoClient('mongodb://localhost:27017')   # url method

# connect to database
db = client.test_database   # or
db = client['test_database']

# connect table
table = db.test_table     # or
table = db['test_table']

data['author'] = 'Mike'
data['text'] = 'My first mongo test'
data['date'] = datatime.datatime.now()

data2 = [ {"author":"Mike",
    "text":"Another post",
    "date":datatime.datetime.now()},
   {"author":"Eliot",
    "text":"MongoDB is fun",
    "date":datetime.datetime.now()}
   ]
# insert data
table.insert_one(data)
table.insert_many(data2)
table.find_one()
table.find_one({'author':'Mike'})
for i in table.find():
    print i

table.count()
table.find({'author':'Mike'}).count()
table.update_one(   # update_many
        filter={'author':'Eliot'},
        update={'$set': {'author':'Lily'}}, 
        upsert=True   # if no record matching filter, then insert this record
    )
