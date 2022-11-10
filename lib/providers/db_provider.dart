import 'dart:io';
import 'package:app_tecnicos/models/models.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:app_tecnicos/models/models.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  
  static final DBProvider instance = DBProvider.init();
  
  static Database? _database;
  DBProvider.init();

  final String tableMsgItems = 'Messages';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB('Msg.db');

    return _database!;
  }

  Future<Database> initDB(String filePath) async {
    //Path donde almacenamos la base de datos.
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    print(path);
    return await openDatabase(path, version: 1, onCreate: _onCreateDB);
  }

  Future _onCreateDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableMsgItems(
      id INTEGER PRIMARY KEY,
      name TEXT,
      price INTEGER,
      quantity INTEGER
    )
    ''');
  }

  Future<void> insert(CartItem item) async {
    final db = await instance.database;
    await db.insert(tableMsgItems, item.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace);//en el caso de agregar el mismo elemento 2 veces este sera reemplazado
  }

    Future<List<CartItem>> getAllItems() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(tableMsgItems);

    return List.generate(maps.length, (i) {
      return CartItem(
        id: maps[i]['id'],
        name: maps[i]['name'],
        price: maps[i]['price'],
        quantity: maps[i]['quantity'],
      );
    });
  }
}
/*C:\Users\Urano\AppData\Local\Google\AndroidStudio2021.3\device-explorer\Pixel_6_API_33 [emulator-5554]\data\user\0\com.example.app_tecnicos\databases */