import pymongo

myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["projetoDestiny"]
mycol = mydb["guardian"]

myobj = {
    "name": "Gui",
    "class": "Caçador",
    "race": "Desperto",
    "equippedItems": {
        "primaryWeapon": {
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
            },
            "status": "Equipada"
        },
        "specialWeapon": {
            "name": "Dúvida Carregada",
            "power": "905",
            "type": "Fuzil de Fusão",
            "category": "Especial",
            "elemento": "Arco",
            "equippedMod": {
                "name": "",
                "description": "",
                "bonus": []
            },
            "status": "Equipada"
        },
        "heavyWeapon": {
            "name": "Sorte Ultrajante",
            "power": "900",
            "type": "Lança-Granadas",
            "category": "Pesada",
            "elemento": "Solar",
            "equippedMod": {
                "name": "Matador de Chefões",
                "description": "Aumenta o dano contra chefões",
                "bonus": [
                    {
                        "target": "Ultra",
                        "type": "Dano",
                        "value": "25"
                    }
                ]
            },
            "status": "Equipada"
        },
        "headArmor": {
            "name": "Falcão Noturno Celestial",
            "power": "850",
            "intellect": "26",
            "discipline": "10",
            "strength": "8",
            "mobility": "7",
            "resilience": "0",
            "recovery": "6",
            "type": "Cabeça",
            "element": "Solar",
            "equippedMod": {
                "name": "",
                "description": "",
                "bonus": []
            },
            "status": "Equipado"
        },
        "bodyArmor": {
            "name": "O Sexto Coiote",
            "power": "900",
            "intellect": "0",
            "discipline": "8",
            "strength": "18",
            "mobility": "19",
            "resilience": "1",
            "recovery": "10",
            "type": "Corpo",
            "element": "Vácuo",
            "equippedMod": {
                "name": "",
                "description": "",
                "bonus": []
            },
            "status": "Equipado"
        },
        "legsArmor": {
            "name": "P1S4NT3S",
            "power": "825",
            "intellect": "26",
            "discipline": "10",
            "strength": "8",
            "mobility": "7",
            "resilience": "0",
            "recovery": "6",
            "type": "Pernas",
            "element": "Arco",
            "equippedMod": {
                "name": "",
                "description": "",
                "bonus": []
            },
            "status": "Equipado"
        },
        "armsArmor": {
            "name": "Espinha do Jovem Ahamkara",
            "power": "910",
            "intellect": "26",
            "discipline": "10",
            "strength": "8",
            "mobility": "7",
            "resilience": "0",
            "recovery": "6",
            "type": "Braços",
            "element": "Solar",
            "equippedMod": {
                "name": "",
                "description": "",
                "bonus": []
            },
            "status": "Equipado"
        },
        "classItem": {
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
            },
            "status": "Equipado"
        }
    },
    "weaponInventory": [
        {
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
            },
            "status": "Equipada"
        },
        {
            "name": "Dúvida Carregada",
            "power": "905",
            "type": "Fuzil de Fusão",
            "category": "Especial",
            "elemento": "Arco",
            "equippedMod": {
                "name": "",
                "description": "",
                "bonus": []
            },
            "status": "Equipada"
        },
        {
            "name": "Sorte Ultrajante",
            "power": "900",
            "type": "Lança-Granadas",
            "category": "Pesada",
            "elemento": "Solar",
            "equippedMod": {
                "name": "Matador de Chefões",
                "description": "Aumenta o dano contra chefões",
                "bonus": [
                    {
                        "target": "Ultra",
                        "type": "Dano",
                        "value": "25"
                    }
                ]
            },
            "status": "Equipada"
        },
        {
            "name": "Monte Carlo",
            "power": "917",
            "type": "Fuzil Automático",
            "category": "Primária",
            "elemento": "Cinético",
            "equippedMod": {
                "name": "",
                "description": "",
                "bonus": []
            },
            "status": "Não equipada"
        },
    ],
    "armorInventory": [
        {
            "name": "Falcão Noturno Celestial",
            "power": "850",
            "intellect": "26",
            "discipline": "10",
            "strength": "8",
            "mobility": "7",
            "resilience": "0",
            "recovery": "6",
            "type": "Cabeça",
            "element": "Solar",
            "equippedMod": {
                "name": "",
                "description": "",
                "bonus": []
            },
            "status": "Equipado"
        },
        {
            "name": "O Sexto Coiote",
            "power": "900",
            "intellect": "0",
            "discipline": "8",
            "strength": "18",
            "mobility": "19",
            "resilience": "1",
            "recovery": "10",
            "type": "Corpo",
            "element": "Vácuo",
            "equippedMod": {
                "name": "",
                "description": "",
                "bonus": []
            },
            "status": "Equipado"
        },
        {
            "name": "P1S4NT3S",
            "power": "825",
            "intellect": "26",
            "discipline": "10",
            "strength": "8",
            "mobility": "7",
            "resilience": "0",
            "recovery": "6",
            "type": "Pernas",
            "element": "Arco",
            "equippedMod": {
                "name": "",
                "description": "",
                "bonus": []
            },
            "status": "Equipado"
        },
        {
            "name": "Espinha do Jovem Ahamkara",
            "power": "910",
            "intellect": "26",
            "discipline": "10",
            "strength": "8",
            "mobility": "7",
            "resilience": "0",
            "recovery": "6",
            "type": "Braços",
            "element": "Solar",
            "equippedMod": {
                "name": "",
                "description": "",
                "bonus": []
            },
            "status": "Equipado"
        },
        {
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
            },
            "status": "Equipado"
        },
    ]
}

x = mycol.insert_one(myobj)

print(x.inserted_id)
