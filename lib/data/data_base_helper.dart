import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
//Copied from GPT.
class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final directory = await getDatabasesPath();
    final path = join(directory, 'crud_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS usuarios (
            id INTEGER PRIMARY KEY,
            email TEXT NOT NULL,
            contrasena TEXT NOT NULL,
            nombre TEXT NOT NULL,
            edad TEXT NOT NULL,
            genero TEXT NOT NULL,
            altura TEXT NOT NULL,
            color_piel TEXT NOT NULL,
            carrera TEXT NOT NULL,
            complexion TEXT NOT NULL,
            tipo_de_persona TEXT NOT NULL,
            genero_interes TEXT NOT NULL,
            altura_interes TEXT NOT NULL,
            color_piel_interes TEXT NOT NULL,
            personalidad_interes TEXT NOT NULL,
            carrera_interes TEXT NOT NULL,
            complexion_interes TEXT NOT NULL,
            etiquetas TEXT NOT NULL,
            foto BLOB
        )
        ''');
      },
    );
  }
  Future<List<Map<String, dynamic>>> getUsers()async{
    final db = await database;
    return await db.query('usuarios');
  }

  // Add CRUD methods here
}
