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
            nombre TEXT NOT NULL,
            genero TEXT NOT NULL,
            edad TEXT NOT NULL,
            altura TEXT NOT NULL,
            color_piel TEXT NOT NULL,
            tipo_de_cuerpo TEXT NOT NULL,
            tipo_de_persona TEXT NOT NULL
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
