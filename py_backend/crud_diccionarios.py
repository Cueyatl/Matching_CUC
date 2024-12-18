from libreria_diccionarios import diccionarios

# Diccionario inicial
cuentas = diccionarios()

#Este metodo crea un nuevo diccionario, evaluando primero si existe otro diccionario con el mismo ID
def crear_diccionario():
    try:
        id_diccionario = int(input("Ingresa el ID: "))
        if id_diccionario in cuentas:
            print("Ya existe una persona con ese ID.")
        else:
            nombre = input("Ingresa el nombre: ")
            altura = input("Ingresa la altura (Alta/Baja): ")
            color_piel = input("Ingresa el color de piel: ")
            complexion = input("Ingresa la complexión: ")
            cuentas[id_diccionario] = {
                "nombre": nombre,
                "Altura": altura,
                "Color piel": color_piel,
                "Complexión": complexion
            }
            print("Persona creada exitosamente.")
    except ValueError:
        print("Error: Debes ingresar un número válido para el ID.")

#Este metodo imprime toda la lista de diccionarios
"""
def leer_productos():
    if not cuentas:
        print("No hay personas registradas.")
    else:
        for id_persona, info in cuentas.items():
            print(f"ID: {id_persona}, Nombre: {info['nombre']}, "
                  f"Altura: {info['Altura']}, Color piel: {info['Color piel']}, Complexión: {info['Complexión']}")
"""

#Este metodo busca un diccionario en especifico mediante su ID
def buscar_diccionario():
    try:
        id_diccionario = int(input("Ingresa el ID que deseas buscar: "))
        if id_diccionario in cuentas:
            diccionario = cuentas[id_diccionario]
            print(f"\nInformación del ID {id_diccionario}:")
            for clave, valor in diccionario.items():
                print(f"{clave}: {valor}")
        else:
            print("No se encontró ningún registro con ese ID.")
    except ValueError:
        print("Error: Debes ingresar un número válido para el ID.")

#Este metodo actualiza el diccionario seleccionado
def actualizar_diccionario():
    try:
        id_persona = int(input("Ingresa el ID de la persona a actualizar: "))
        if id_persona not in cuentas:
            print("No se encontró ninguna persona con ese ID.")
        else:
            nombre = input("Ingresa el nuevo nombre: ")
            altura = input("Ingresa la nueva altura (Alta/Baja): ")
            color_piel = input("Ingresa el nuevo color de piel: ")
            complexion = input("Ingresa la nueva complexión: ")
            cuentas[id_persona] = {
                "nombre": nombre,
                "Altura": altura,
                "Color piel": color_piel,
                "Complexión": complexion
            }
            print("Persona actualizada exitosamente.")
    except ValueError:
        print("Error: Debes ingresar un número válido para el ID.")

#Este metodo elimina el diccionario seleccionado
def eliminar_diccionario():
    try:
        id_persona = int(input("Ingresa el ID de la persona a eliminar: "))
        if id_persona not in cuentas:
            print("No se encontró ninguna persona con ese ID.")
        else:
            del cuentas[id_persona]
            print("Persona eliminada exitosamente.")
    except ValueError:
        print("Error: Debes ingresar un número válido para el ID.")

#Demostracion de Funcionamiento
def menu():
    while True:
        print("\n------- Menú -------")
        print("1. Crear Usuario")
        """print("2. Leer personas")"""
        print("2. Buscar por ID")
        print("3. Actualizar Usuario")
        print("4. Eliminar Usuario")
        print("5. Salir")
        
        opcion = input("Selecciona una opción: ")
        
        if opcion == "1":
            while True:
                print("-----------------------------------------")
                crear_diccionario()
                opcion = input("\nDesea crear un nuevo Usuario? (Si o No): ")
                if opcion == "Si":
                    True
                elif opcion == "No":
                    break
                else:   
                    print("Opcion no valida")
                    break 
        elif opcion == "2":
            while True:
                print("-----------------------------------------")
                """leer_productos()"""
                buscar_diccionario()
                opcion = input("\nDesea buscar otro Usuario? (Si o No): ")
                if opcion == "Si":
                    True
                elif opcion == "No":
                    break
                else:   
                    print("Opcion no valida")
                    break 
        elif opcion == "3":
            while True:
                print("-----------------------------------------")
                actualizar_diccionario()
                opcion = input("\nDesea actualizar otro Usuario? (Si o No): ")
                if opcion == "Si":
                    True
                elif opcion == "No":
                    break
                else:   
                    print("Opcion no valida")
                    break 
        elif opcion == "4":
            while True:
                print("-----------------------------------------")
                eliminar_diccionario()
                opcion = input("\nDesea eliminar otro Usuario? (Si o No): ")
                if opcion == "Si":
                    True
                elif opcion == "No":
                    break
                else:   
                    print("Opcion no valida")
                    break 
        elif opcion == "5":
            print("Saliendo del programa...  ;) ")
            break
        else:
            print("Opción inválida. Inténtalo de nuevo... :(")

# Ejecutar el menú
menu()
