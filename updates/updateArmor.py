import pymongo

myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["projetoDestiny"]
mycol = mydb["armor"]

myquery = { "name": "Capa de Taniks" }
newvalues = { "$set": { "name": "Capa do Taniks" } }

mycol.update_one(myquery, newvalues)

for x in mycol.find():
  print(x)