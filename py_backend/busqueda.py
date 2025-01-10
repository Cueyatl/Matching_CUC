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

