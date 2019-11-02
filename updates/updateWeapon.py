import pymongo

myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["projetoDestiny"]
mycol = mydb["weapon"]

myquery = { "name": "Espinho" }
newvalues = { "$set": { "power": "950" } }

mycol.update_one(myquery, newvalues)

for x in mycol.find():
  print(x)