import pymongo

myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["projetoDestiny"]
mycol = mydb["weapon"]

myquery = { "name": "Espinho" }

mycol.delete_one(myquery)