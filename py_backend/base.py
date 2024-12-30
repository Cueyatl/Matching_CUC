import sqlite3

#Configuración de la base de datos
def conectar_db():
    return sqlite3.connect("crud_database.db")

#Crear un nuevo usuario
def crear_usuario():
    try:
        id_usuario = int(input("Ingresa el ID: "))
        conexion = conectar_db()
        cursor = conexion.cursor()

        cursor.execute("SELECT id FROM usuarios WHERE id = ?", (id_usuario,))
        if cursor.fetchone():
            print("Ya existe un usuario con ese ID.")
        else:
            nombre = input("Ingresa el nombre: ")
            genero = input("Ingresa el genero de interes (Hombre/Mujer/Otros): ")
            edad = input("Ingresa la edad de interes (Mayores/Mi Edad/Menores/Cualquiera): ")
            altura = input("Ingresa la altura de interes (Alta/Igual/Baja/Cualquiera): ")
            color_piel = input("Ingresa el color de piel de interes (Blanca/Morena/Oscura/Cualquiera): ")
            tipo_de_cuerpo = input("Ingresa el tipo de cuerpo de interes (Musculoso/Atletico/Normal/Descuidado/Gordo/Cualquiera): ")
            tipo_de_persona = input("Ingresa el tipo de persona de interes (Introvertido/Extrovertido): ")

            cursor.execute(
                "INSERT INTO usuarios (id, nombre, genero, edad, altura, color_piel, tipo_de_cuerpo, tipo_de_persona) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
                (id_usuario, nombre, genero, edad, altura, color_piel, tipo_de_cuerpo, tipo_de_persona)
            )
            conexion.commit()
            print("Usuario creado exitosamente.")
        conexion.close()
    except ValueError:
        print("Error: Debes ingresar un número válido para el ID.")

#Buscar un usuario por ID
def buscar_usuario():
    try:
        id_usuario = int(input("Ingresa el ID que deseas buscar: "))
        conexion = conectar_db()
        cursor = conexion.cursor()

        cursor.execute("SELECT * FROM usuarios WHERE id = ?", (id_usuario,))
        usuario = cursor.fetchone()
        if usuario:
            print(f"\nInformación del ID {usuario[0]}:")
            print(f"Nombre: {usuario[1]}")
            print(f"Genero de interes: {usuario[2]}")
            print(f"Edad de interes: {usuario[3]}")
            print(f"Altura de interes: {usuario[4]}")
            print(f"Color de piel de interes: {usuario[5]}")
            print(f"Tipo de cuerpo de interes: {usuario[6]}")
            print(f"Tipo de persona de interes: {usuario[7]}")
        else:
            print("No se encontró ningún registro con ese jID.")
        conexion.close()
    except ValueError:
        print("Error: Debes ingresar un número válido para el ID.")

#Actualiza al usuario mediante su ID
def actualizar_usuario():
    try:
        id_usuario = int(input("Ingresa el ID del usuario a actualizar: "))
        conexion = conectar_db()
        cursor = conexion.cursor()

        cursor.execute("SELECT id FROM usuarios WHERE id = ?", (id_usuario,))
        if not cursor.fetchone():
            print("No se encontró ningún usuario con ese ID.")
        else:
            nombre = input("Ingresa el nuevo nombre: ")
            genero = input("Ingresa el nuevo genero de interes (Hombre/Mujer/Otros): ")
            edad = input("Ingresa la nueva edad de interes (Mayores/Mi Edad/Menores/Cualquiera): ")
            altura = input("Ingresa la nueva altura de interes (Alta/Igual/Baja/Cualquiera): ")
            color_piel = input("Ingresa el nuevo color de piel de interes (Blanca/Morena/Oscura/Cualquiera): ")
            tipo_de_cuerpo = input("Ingresa el nuevo tipo de cuerpo de interes (Musculoso/Atletico/Normal/Descuidado/Gordo/Cualquiera): ")
            tipo_de_persona = input("Ingresa el nuevo tipo de persona de interes (Introvertido/Extrovertido): ")

            cursor.execute(
                "UPDATE usuarios SET nombre = ?, genero = ?, edad = ?, altura = ?, color_piel = ?, tipo_de_cuerpo = ?, tipo_de_persona = ? WHERE id = ?",
                (nombre, genero, edad, altura, color_piel, tipo_de_cuerpo, tipo_de_persona, id_usuario)
            )
            conexion.commit()
            print("Usuario actualizado exitosamente.")
        conexion.close()
    except ValueError:
        print("Error: Debes ingresar un número válido para el ID.")

#Elimina un usuario mediante el ID
def eliminar_usuario():
    try:
        id_usuario = int(input("Ingresa el ID del usuario a eliminar: "))
        conexion = conectar_db()
        cursor = conexion.cursor()

        cursor.execute("SELECT id FROM usuarios WHERE id = ?", (id_usuario,))
        if not cursor.fetchone():
            print("No se encontró ningún usuario con ese ID.")
        else:
            cursor.execute("DELETE FROM usuarios WHERE id = ?", (id_usuario,))
            conexion.commit()
            print("Usuario eliminado exitosamente.")
        conexion.close()
    except ValueError:
        print("Error: Debes ingresar un número válido para el ID.")

#Menu de ejecucion del CRUD
def menu():
    while True:
        print("\n------- Menú -------")
        print("1. Crear Usuario")
        print("2. Buscar por ID")
        print("3. Actualizar Usuario")
        print("4. Eliminar Usuario")
        print("5. Salir")

        opcion = input("Selecciona una opción: ")

        if opcion == "1":
            crear_usuario()
        elif opcion == "2":
            buscar_usuario()
        elif opcion == "3":
            actualizar_usuario()
        elif opcion == "4":
            eliminar_usuario()
        elif opcion == "5":
            print("Saliendo del programa...  ;) ")
            break
        else:
            print("Opción inválida. Inténtalo de nuevo... :(")

#Ejecutar el menú
if __name__ == "__main__":
    menu()