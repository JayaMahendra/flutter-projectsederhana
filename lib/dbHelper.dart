import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'item.dart';
import 'jual.dart';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();
  Future<Database> initDb() async {
    //untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'item.db';

    //create, read databases
    var itemDatabase = openDatabase(path, version: 4, onCreate: _createDb);

    //mengembalikan nilai object sebagai hasil dari fungsinya
    return itemDatabase;
  }

  //buat tabel baru dengan nama item
  void _createDb(Database db, int version) async {
    await db.execute('''
 CREATE TABLE item (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 nama TEXT,
 harga INTEGER,
 qty INTEGER
 )
 ''');
    await db.execute('''
 CREATE TABLE jual
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 tgl DATETIME,
 desc TEXT
 )''');
  }

//select databases
  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.initDb();
    var mapList = await db.query('item', orderBy: 'nama');
    return mapList;
  }
   Future<List<Map<String, dynamic>>> selectjual() async {
    Database db = await this.initDb();
    var mapList = await db.query('jual', orderBy: 'id');
    return mapList;
  }

//create databases
  Future<int> insert(Item object) async {
    Database db = await this.initDb();
    int count = await db.insert('item', object.toMap());
    return count;
  }
  Future<int> insertjual(Jual object) async {
    Database db = await this.initDb();
    int count = await db.insert('jual', object.toMap());
    return count;
  }

//update databases
  Future<int> update(Item object) async {
    Database db = await this.initDb();
    int count = await db
        .update('item', object.toMap(), where: 'id=?', whereArgs: [object.id]);
    return count;
  }
   Future<int> updatejual(Jual object) async {
    Database db = await this.initDb();
    int count = await db
        .update('jual', object.toMap(), where: 'id=?', whereArgs: [object.id]);
    return count;
  }

//delete databases
  Future<int> delete(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('item', where: 'id=?', whereArgs: [id]);
    return count;
  }
  Future<int> deletejual(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('jual', where: 'id=?', whereArgs: [id]);
    return count;
  }

  Future<List<Item>> getItemList() async {
    var itemMapList = await select();
    int count = itemMapList.length;
    List<Item> itemList = List<Item>();
    for (int i = 0; i < count; i++) {
      itemList.add(Item.fromMap(itemMapList[i]));
    }
    return itemList;
  }
  Future<List<Jual>> getJualList() async {
    var jualMapList = await select();
    int count = jualMapList.length;
    List<Jual> jualList = List<Jual>();
    for (int i = 0; i < count; i++) {
      jualList.add(Jual.fromMap(jualMapList[i]));
    }
    return jualList;
  }

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }
}
