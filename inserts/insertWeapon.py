import pymongo

myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["projetoDestiny"]
mycol = mydb["weapon"]

myobj = {
    "name": "Espinho",
    "power": "840",
    "type": "Canhão de Mão",
    "category": "Primária",
    "elemento": "Cinético",
    "equippedMod": {
        "name": "Dredgen",
        "description": "Aumenta o dano contra outros guardiões",
        "bonus": [
            {
                "target": "Guardião",
                "type": "Dano",
                "value": "20"
            }
        ]
    }
}

x = mycol.insert_one(myobj)

print(x.inserted_id)
