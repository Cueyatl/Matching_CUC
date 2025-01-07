import sqlite3

#Configuración de la base de datos
def conectar_db():
    return sqlite3.connect("crud_database.db")


#Crear un nuevo usuario
def mostrar_usuarios():
    try:
        conexion = conectar_db()
        cursor=conexion.cursor()
        
        cursor.execute("SELECT * FROM usuarios")
        registros = cursor.fetchall()

        if not registros:
            print("La tabla 'usuarios' está vacía.")
        else:
            for registro in registros:
                print(f"ID: {registro[0]}")
                print(f"Email: {registro[1]}")
                print(f"Contraseña: {registro[2]}")
                print(f"Nombre: {registro[3]}")
                print(f"Edad: {registro[4]}")
                print(f"Género: {registro[5]}")
                print(f"Altura: {registro[6]}")
                print(f"Color de piel: {registro[7]}")
                print(f"Carrera: {registro[8]}")
                print(f"Complexión: {registro[9]}")
                print(f"Tipo de persona: {registro[10]}")
                print(f"Género de interés: {registro[11]}")
                print(f"Altura de interés: {registro[12]}")
                print(f"Color de piel de interés: {registro[13]}")
                print(f"Personalidad de interés: {registro[14]}")
                print(f"Carrera de interés: {registro[15]}")
                print(f"Complexión de interés: {registro[16]}")
                print(f"Etiquetas: {registro[17]}")
                print(f"Foto: {registro[18]}")
                print("-" * 70)
        conexion.close()
    except ValueError:
        print("Error: NO es posible acceder a la base de datos.")


def crear_usuario(id_usuario, email, contrasena, nombre, edad, genero, altura, color_piel, carrera, complexion, tipo_de_persona, genero_interes, altura_interes, color_piel_interes, personalidad_interes, carrera_interes, complexion_interes, etiquetas, foto):
    try:
        # id_usuario = int(input("Ingresa el ID: "))
        conexion = conectar_db()
        cursor = conexion.cursor()

        cursor.execute("SELECT id FROM usuarios WHERE id = ?", (id_usuario,))
        if cursor.fetchone():
            print("Ya existe un usuario con ese ID.")
        else:
            cursor.execute(
                """INSERT INTO usuarios (id, email, contrasena, nombre, edad, genero, altura, color_piel, carrera, complexion, tipo_de_persona, genero_interes, altura_interes, color_piel_interes, personalidad_interes, carrera_interes, complexion_interes, etiquetas, foto) 
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)""",
                (id_usuario, email, contrasena, nombre, edad, genero, altura, color_piel, carrera, complexion, tipo_de_persona, genero_interes, altura_interes, color_piel_interes, personalidad_interes, carrera_interes, complexion_interes, etiquetas, foto)
            )
        conexion.commit()
        print("Usuario creado exitosamente.")
        conexion.close()
        return {"success": True, "message": "Usuario creado exitosamente."}
    except ValueError:
        print("Error: Debes ingresar un número válido para el ID.")
        return {"success": False, "message": "Error: Debes ingresar un número válido para el ID."}
        

#Buscar un usuario por ID
def buscar_usuario(id_usuario):
    try:
        
        conexion = conectar_db()
        cursor = conexion.cursor()

        cursor.execute("SELECT * FROM usuarios WHERE id = ?", (id_usuario,))
        usuario = cursor.fetchone()
        if usuario:
            print(f"Información del ID {usuario[0]}:")
            print(f"Email: {usuario[1]}")
            print(f"Contraseña: {usuario[2]}")
            print(f"Nombre: {usuario[3]}")
            print(f"Edad: {usuario[4]}")
            print(f"Género: {usuario[5]}")
            print(f"Altura: {usuario[6]}")
            print(f"Color de piel: {usuario[7]}")
            print(f"Carrera: {usuario[8]}")
            print(f"Complexión: {usuario[9]}")
            print(f"Tipo de persona: {usuario[10]}")
            print(f"Género de interés: {usuario[11]}")
            print(f"Altura de interés: {usuario[12]}")
            print(f"Color de piel de interés: {usuario[13]}")
            print(f"Personalidad de interés: {usuario[14]}")
            print(f"Carrera de interés: {usuario[15]}")
            print(f"Complexión de interés: {usuario[16]}")
            print(f"Etiquetas: {usuario[17]}")
            print(f"Foto: {usuario[18]}")
        else:
            print("No se encontró ningún registro con ese jID.")
        conexion.close()
    except ValueError:
        print("Error: Debes ingresar un número válido para el ID.")

#Actualiza al usuario mediante su ID
def actualizar_usuario(id_usuario, email, contrasena, nombre, edad, genero, altura, color_piel, carrera, complexion, tipo_de_persona, genero_interes, altura_interes, color_piel_interes, personalidad_interes, carrera_interes, complexion_interes, etiquetas, foto):
    try:
        
        conexion = conectar_db()
        cursor = conexion.cursor()

        cursor.execute("SELECT id FROM usuarios WHERE id = ?", (id_usuario,))
        if not cursor.fetchone():
            print("No se encontró ningún usuario con ese ID.")
        else:
        
            cursor.execute(
                """UPDATE usuarios SET email = ?, contrasena = ?, nombre = ?, edad = ?, genero = ?, altura = ?, color_piel = ?, carrera = ?, complexion = ?, tipo_de_persona = ?, genero_interes = ?, altura_interes = ?, color_piel_interes = ?, personalidad_interes = ?, carrera_interes = ?, complexion_interes = ?, etiquetas = ?, foto = ? WHERE id = ?""",
                (email, contrasena, nombre, edad, genero, altura, color_piel, carrera, complexion, tipo_de_persona, genero_interes, altura_interes, color_piel_interes, personalidad_interes, carrera_interes, complexion_interes, etiquetas, foto, id_usuario)
            )
            conexion.commit()
            print("Usuario actualizado exitosamente.")
        conexion.close()
    except ValueError:
        print("Error: Debes ingresar un número válido para el ID.")

#Elimina un usuario mediante el ID
def eliminar_usuario(id_usuario):
    try:
        
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

#DEV, quitar antes de demo.
def limpiar_tabla():
    
    try:
        conexion = conectar_db()
        cursor = conexion.cursor()
        cursor.execute(f"DELETE FROM usuarios;")
        conexion.commit()
        conexion.close()
        print("tabla limpiada.")
    except ValueError:
        print("Error: Debes ingresar un número válido para el ID.")

#Menu de ejecucion del CRUD

def inputDatos():
    id_usuario = int(input("ID del usuario: "))
    email = input("Email: ")
    contrasena = input("Contraseña: ")
    nombre = input("Nombre: ")
    edad = input("Edad: ")
    genero = input("Género: ")
    altura = input("Altura: ")
    color_piel = input("Color de piel: ")
    carrera = input("Carrera: ")
    complexion = input("Complexión: ")
    tipo_de_persona = input("Tipo de persona: ")
    genero_interes = input("Género de interés: ")
    altura_interes = input("Altura de interés: ")
    color_piel_interes = input("Color de piel de interés: ")
    personalidad_interes = input("Personalidad de interés: ")
    carrera_interes = input("Carrera de interés: ")
    complexion_interes = input("Complexión de interés: ")
    etiquetas = input("Etiquetas: ")
    foto = input("Foto (en formato binario): ")
    
    return(id_usuario, email, contrasena, nombre, edad, genero, altura, color_piel, carrera, complexion, tipo_de_persona, genero_interes,  altura_interes, color_piel_interes, personalidad_interes,carrera_interes,complexion_interes, etiquetas, foto)

def menu():
    
    while True:
        print("\n------- Menú -------")
        print("1. Crear Usuario")
        print("2. Buscar por ID")
        print("3. Actualizar Usuario")
        print("4. Eliminar Usuario")
        print("5. Mostrar usuarios")
        print("6. Salir")
        print("9. Limpiar tabla")
        opcion = input("Selecciona una opción: ")
        if opcion == "1":
            datos_crear_usuario= inputDatos()
            crear_usuario(datos_crear_usuario)
        elif opcion == "2":
            id_usuario = int(input("Ingresa el ID del usuario a BUSCAR: "))
            buscar_usuario(id_usuario)
            
        elif opcion == "3":
            id_usuario = int(input("Ingresa el ID del usuario a ACTUALIZAR: "))
            datos_editar_usuario = inputDatos()
            actualizar_usuario(datos_editar_usuario)
        elif opcion == "4":
            id_usuario = int(input("Ingresa el ID del usuario a ELIMINAR: "))
            eliminar_usuario(id_usuario)
        elif opcion == "5":
            print("Mostrar usuarios) ")
            mostrar_usuarios()
        elif opcion == "6":
            print("Saliendo del programa...  ;) ")
            break
        elif opcion == "9":
            limpiar_tabla()
        else:
            print("Opción inválida. Inténtalo de nuevo... :(")
#Ejecutar el menú
if __name__ == "__main__":
    menu()