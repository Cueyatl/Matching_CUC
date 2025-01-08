import sqlite3

def conectar_db():
    return sqlite3.connect("crud_database.db")

def calcular_similitud(preferencias_usuario, usuario):
    coincidencias = sum(1 for key in preferencias_usuario if preferencias_usuario[key] == usuario[key])
    total_criterios = len(preferencias_usuario)
    return coincidencias / total_criterios

def buscar_por_similitud(preferencias_usuario):
    try:
        # Conexión a la base de datos
        conexion = conectar_db()
        cursor = conexion.cursor()

        # Traer todos los usuarios de la base de datos
        query = "SELECT * FROM usuarios"
        cursor.execute(query)
        usuarios = cursor.fetchall()

        # Procesar los resultados y calcular similitud
        resultados = []
        for usuario in usuarios:
            usuario_dict = {
                "id": usuario[0],
                "nombre": usuario[1],
                "genero": usuario[2],
                "edad": usuario[3],
                "altura": usuario[4],
                "color_piel": usuario[5],
                "tipo_de_cuerpo": usuario[6],
                "tipo_de_persona": usuario[7],
            }
            similitud = calcular_similitud(preferencias_usuario, usuario_dict)
            resultados.append({"usuario": usuario_dict, "similitud": similitud})

        # Ordenar los resultados por mayor similitud
        resultados.sort(key=lambda x: x["similitud"], reverse=True)

        conexion.close()
        return resultados

    except sqlite3.Error as e:
        print(f"Error en la base de datos: {e}")
        return []

if __name__ == "__main__":
    preferencias = {}
    print("\n--- Introduzca sus preferencias ---")
    preferencias["genero"] = input("Género de preferencia: ")
    preferencias["edad"] = input("Edad de preferencia: ")
    preferencias["altura"] = input("Altura de preferencia (en cm): ")
    preferencias["color_piel"] = input("Color de piel de preferencia: ")
    preferencias["tipo_de_cuerpo"] = input("Tipo de cuerpo de preferencia: ")
    preferencias["tipo_de_persona"] = input("Tipo de persona de preferencia: ")

    resultados = buscar_por_similitud(preferencias)
    print("\nUsuarios similares ordenados por similitud:")
    for resultado in resultados:
        usuario = resultado["usuario"]
        similitud = resultado["similitud"]
        print(f"Nombre: {usuario['nombre']}, Similitud: {similitud * 100:.2f}%")


"""
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


"""