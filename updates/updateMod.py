import pymongo

myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["projetoDestiny"]
mycol = mydb["mod"]

myquery = { "name": "Estudioso" }
newvalues = { "$set": { "description": "Aumenta a experiência obtida ao derrotar combatentes inimigos" } }

mycol.update_one(myquery, newvalues)

for x in mycol.find():
  print(x)