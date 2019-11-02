import pymongo

myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["projetoDestiny"]
mycol = mydb["mod"]

myquery = { "name": "Estudioso" }

mycol.delete_one(myquery)