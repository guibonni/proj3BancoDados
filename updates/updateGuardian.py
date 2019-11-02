import pymongo

myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["projetoDestiny"]
mycol = mydb["guardian"]

myquery = { "name": "GuiCastro" }
newvalues = { "$set": { "name": "Gui" } }

mycol.update_one(myquery, newvalues)

for x in mycol.find():
  print(x)