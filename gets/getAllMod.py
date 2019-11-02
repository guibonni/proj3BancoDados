import pymongo

myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["projetoDestiny"]
mycol = mydb["mod"]

mydoc = mycol.find()

for x in mydoc:
    print(x)