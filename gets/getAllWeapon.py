import pymongo

myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["projetoDestiny"]
mycol = mydb["weapon"]

mydoc = mycol.find()

# Trazendo a média de poder de cada categoria de arma cadastrada
# mydoc = mycol.aggregate([{
#     "$group": {
#        "_id": "$category",
#        "avg_power": { "$avg": "$power"}#
#    }
# }])

for x in mydoc:
    print(x)