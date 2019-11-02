import pymongo

myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["projetoDestiny"]
mycol = mydb["guardian"]

myquery = { "name": "Gui" }

mycol.delete_one(myquery)