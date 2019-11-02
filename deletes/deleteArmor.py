import pymongo

myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["projetoDestiny"]
mycol = mydb["armor"]

myquery = { "name": "P1S4NT3S" }

mycol.delete_one(myquery)