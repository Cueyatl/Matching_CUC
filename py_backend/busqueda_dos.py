import sqlite3
import random

# Configuración de la base de datos
def conectar_db():
    return sqlite3.connect("crud_database.db")

# Simulación de métodos en base.py
class Base:
    @staticmethod
    def guardar_compatibilidad(usuario_id, compatibilidad):
        print(f"Compatibilidad del usuario con ID {usuario_id} guardada: {compatibilidad}%")

# Simulación de métodos en restful_api.py
class RestfulAPI:
    @staticmethod
    def enviar_respuesta(mensaje):
        print(f"Respuesta de la API: {mensaje}")

# Buscar usuarios por un criterio específico
def buscar_por_criterio():
    try:
        # Conexión a la base de datos
        conexion = conectar_db()
        cursor = conexion.cursor()

        print("\n--- Buscar Usuarios por Criterio ---")
        print("1. Nombre")
        print("2. Preferencia de Género")
        print("3. Preferencia de Edad")
        print("4. Preferencia de Altura")
        print("5. Preferencia de Color de piel")
        print("6. Preferencia de tipo de cuerpo")
        print("7. Preferencia de tipo de persona")
        opcion = input("Selecciona el criterio (1-7): ")

        # Mapear la opción al nombre de la columna
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

        # Ejecutar consulta
        query = f"SELECT * FROM usuarios WHERE {columna} LIKE ?"
        cursor.execute(query, (f"%{valor}%",))
        resultados = cursor.fetchall()

        if resultados:
            print("\nUsuarios que coinciden con el criterio:")
            usuarios_encontrados = {}
            for usuario in resultados:
                usuario_id = random.randint(1000, 9999)  # Generar un ID aleatorio
                usuarios_encontrados[usuario_id] = {
                    "nombre": usuario[1],
                    "genero": usuario[2],
                    "edad": usuario[3],
                    "altura": usuario[4],
                    "color_piel": usuario[5],
                    "tipo_de_cuerpo": usuario[6],
                    "tipo_de_persona": usuario[7]
                }
                print(f"ID: {usuario_id}, Nombre: {usuario[1]}, Género: {usuario[2]}, Edad: {usuario[3]}, Altura: {usuario[4]}, "
                      f"Color de piel: {usuario[5]}, Tipo de cuerpo: {usuario[6]}, Tipo de persona: {usuario[7]}")

            calcular_compatibilidad(usuarios_encontrados)
        else:
            print("No se encontraron usuarios que coincidan con el criterio.")
        
        conexion.close()
    except sqlite3.Error as e:
        print(f"Error en la base de datos: {e}")

# Calcular compatibilidad con los usuarios encontrados
def calcular_compatibilidad(usuarios_encontrados):
    print("\nCalculando compatibilidad...")
    compatibilidades = {}
    for usuario_id, datos in usuarios_encontrados.items():
        # Simular compatibilidad con un valor aleatorio
        compatibilidad = random.randint(50, 100)
        compatibilidades[usuario_id] = compatibilidad
        Base.guardar_compatibilidad(usuario_id, compatibilidad)
    
    mostrar_resultados_compatibilidad(compatibilidades)

# Mostrar resultados de compatibilidad
def mostrar_resultados_compatibilidad(compatibilidades):
    print("\nResultados de compatibilidad:")
    for usuario_id, compatibilidad in compatibilidades.items():
        print(f"Usuario ID: {usuario_id} - Compatibilidad: {compatibilidad}%")
    RestfulAPI.enviar_respuesta("Resultados de compatibilidad enviados exitosamente.")

# Ejecución
if _name_ == "_main_":
    buscar_por_criterio()