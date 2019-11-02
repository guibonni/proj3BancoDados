import pymongo

myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["projetoDestiny"]
mycol = mydb["armor"]

myobj = {
    "name": "Capa de Taniks",
    "power": "768",
    "intellect": "0",
    "discipline": "0",
    "strength": "0",
    "mobility": "0",
    "resilience": "0",
    "recovery": "0",
    "type": "Item de Classe",
    "element": "Solar",
    "equippedMod": {
        "name": "Estudioso",
        "description": "Aumenta a experiência obtida ao derrotar inimigos",
        "bonus": [
            {
                "target": "Comum",
                "type": "Experiência",
                "value": "15"
            },
            {
                "target": "Poderoso",
                "type": "Experiência",
                "value": "15"
            },
            {
                "target": "Ultra",
                "type": "Experiência",
                "value": "15"
            }
        ]
    }
}

x = mycol.insert_one(myobj)

print(x.inserted_id)
