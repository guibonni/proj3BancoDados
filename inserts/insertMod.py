import pymongo

myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["projetoDestiny"]
mycol = mydb["mod"]

myobj = {
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

x = mycol.insert_one(myobj)

print(x.inserted_id)
