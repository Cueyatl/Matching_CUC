import sqlite3

def crear_tabla():
    conexion = sqlite3.connect("crud_database.db")
    cursor = conexion.cursor()
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS usuarios (
            id INTEGER PRIMARY KEY,
            nombre TEXT NOT NULL,
            genero TEXT NOT NULL,
            edad TEXT NOT NULL,
            altura TEXT NOT NULL,
            color_piel TEXT NOT NULL,
            tipo_de_cuerpo TEXT NOT NULL,
            tipo_de_persona TEXT NOT NULL
        )
    ''')
    conexion.commit()
    conexion.close()
    print("Tabla 'usuarios' verificada o creada.")

crear_tabla()