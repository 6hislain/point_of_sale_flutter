import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_common_ffi.dart';

import '../models/user.dart';
import '../models/category.dart';
import '../models/product.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      sqfliteFfiInit();
      final databaseFactory = databaseFactoryFfi;
      final appDocumentsDir = await getApplicationDocumentsDirectory();
      final dbPath = join(appDocumentsDir.path, 'databases'. 'data.db');
      final winLinuxDB = await databaseFactory.openDatabase(
        dbPath,
        options: OpenDatabaseOptions(
          version: 1,
          onCreate: _onCreate,
        ),
      );
      return winLinuxDB;
    }
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'data.db');
    final iOSAndroidDB = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate
    );
    return iOSAndroidDB;
  }

  Future _onCreate(Database db, int version) async {
    var batch = db.batch();
    batch.execute('''
      CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        createdAt DATETIME
      )
    ''');

    await batch.commit();
  }

  Future<int> insert<T>(String table, Map<String, dynamic> data) async {
    Database db = await database;
    return await db.insert(table, data);
  }

  Future<List<T>> getAll<T>(
    String table,
    T Function(Map<String, dynamic>) fromMap, {
    int? limit,
    int? offset,
  }) async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      table,
      limit: limit,
      offset: offset,
    );
    return List.generate(maps.length, (i) => fromMap(maps[i]));
  }

  Future<int> update<T>(String table, Map<String, dynamic> data, int id) async {
    Database db = await database;
    return await db.update(table, data, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> delete(String table, int id) async {
    Database db = await database;
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> insertUser(User user) => insert('users', user.toMap());
  Future<List<User>> getUsers({int? limit, int? offset}) =>
      getAll('users', (map) => User.fromMap(map), limit: limit, offset: offset);
  Future<int> updateUser(User user) => update('users', user.toMap(), user.id!);
  Future<int> deleteUser(int id) => delete('users', id);
}
