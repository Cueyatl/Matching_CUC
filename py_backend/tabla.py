import sqlite3

def crear_tabla():
    conexion = sqlite3.connect("crud_database.db")
    cursor = conexion.cursor()
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS usuarios (
            id INTEGER PRIMARY KEY,
            email TEXT NOT NULL,
            contrasena TEXT NOT NULL,
            nombre TEXT NOT NULL,
            edad TEXT NOT NULL,
            genero TEXT NOT NULL,
            altura TEXT NOT NULL,
            carrera TEXT NOT NULL,
            complexion TEXT NOT NULL,
            tipo_de_persona TEXT NOT NULL,
            color_piel TEXT NOT NULL,
            genero_interes TEXT NOT NULL,
            altura_interes TEXT NOT NULL,
            color_piel_interes TEXT NOT NULL,
            personalidad_interes TEXT NOT NULL,
            carrera_interes TEXT NOT NULL,
            complexion_interes TEXT NOT NULL,
            etiquetas TEXT NOT NULL,
            foto BLOB
        )
    ''')
    conexion.commit()
    conexion.close()
    print("Tabla 'usuarios' verificada o creada.")
    
# ONLY FOR DEVOPS
def eliminar_tabla():
    conexion = sqlite3.connect("crud_database.db")
    cursor = conexion.cursor()
    cursor.execute("DROP TABLE IF EXISTS usuarios")
    conexion.commit()
    conexion.close()
    print("Tabla 'usuarios' eliminada.")
    eliminar_tabla()
    
eliminar_tabla()
crear_tabla()
