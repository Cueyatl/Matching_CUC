def diccionarios():
    lista_diccionarios = [
        {"id": 1, "nombre": "Alberto", "Altura": "Alta", "Color piel": "Morena", "Complexión": "Musculosa"},
        {"id": 6, "nombre": "Roberto", "Altura": "Baja", "Color piel": "Guerita", "Complexión": "Gorda"},
        {"id": 9, "nombre": "Alan", "Altura": "Baja", "Color piel": "Negra", "Complexión": "Flaca"},
        {"id": 2, "nombre": "Pablo", "Altura": "Alta", "Color piel": "Pálida", "Complexión": "Atlética"}
    ]
    # Se convierte la lista en diccionario con el ID como clave
    return {item["id"]: item for item in lista_diccionarios}
