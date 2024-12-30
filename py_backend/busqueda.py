import sqlite3

#Configuración de la base de datos
def conectar_db():
    return sqlite3.connect("crud_database.db")

#Buscar usuarios por un criterio específico
def buscar_por_criterio():
    try:
        #Conexión a la base de datos
        conexion = conectar_db()
        cursor = conexion.cursor()

        print("\n--- Buscar Usuarios por Criterio ---")
        print("1. Nombre")
        print("2. Preferencia de Genero")
        print("3. Preferencia de Edad")
        print("4. Preferencia de Altura")
        print("5. Preferencia de Color de piel")
        print("6. Preferencia de tipo de cuerpo")
        print("7. Preferencia de tipo de persona")
        opcion = input("Selecciona el criterio (1-7): ")

        #Mapear la opción al nombre de la columna
        columnas = {
            "1": "nombre",
            "2": "genero",
            "3": "edad",
            "4": "altura",
            "5": "color_piel",
            "6": "tipo_de_cuerpo",
            "7": "tipo_de_persona"
        }

        if opcion not in columnas:
            print("Opción inválida. Inténtalo de nuevo.")
            return

        columna = columnas[opcion]
        valor = input(f"Ingrese el valor para buscar en '{columna}': ")

        #Ejecutar consulta
        query = f"SELECT * FROM usuarios WHERE {columna} LIKE ?"
        cursor.execute(query, (f"%{valor}%",))
        resultados = cursor.fetchall()

        if resultados:
            print("\nUsuarios que coinciden con el criterio:")
            for usuario in resultados:
                print(f"ID: {usuario[0]}, Nombre: {usuario[1]}, Genero de Interes: {usuario[2]}, Edad de Interes: {usuario[3]}, Altura de Interes: {usuario[4]}"
                      f"Color de piel: {usuario[5]}, Tipo de cuerpo de Interes: {usuario[6]}, Tipo de persona de Interes {usuario[7]}")
        else:
            print("No se encontraron usuarios que coincidan con el criterio.")
        
        conexion.close()
    except sqlite3.Error as e:
        print(f"Error en la base de datos: {e}")

#Ejecucion
if __name__ == "__main__":
    buscar_por_criterio()
