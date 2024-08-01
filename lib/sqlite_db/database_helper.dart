import 'package:asasiyat/models/guest_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static const String _dbName = 'asasiyat.db';
  static const int _dbVersion = 1;

  static Future<void> createTable(Database database) async {
    await database.execute(""" CREATE TABLE Stages(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    souraNb INTEGER,
    souraName TEXT,
    grid INTEGER,
    ayahsGrid INTEGER,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
    """);
    await database.execute(""" CREATE TABLE StageAyahGrids(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    stage INTEGER,
    ayah INTEGER,
    grid INTEGER,
    )
    """);
    await database.execute(""" CREATE TABLE Ayahs(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    souraNb INTEGER,
    souraName TEXT,
    grid INTEGER,
    group INTEGER,
    gridOrdr INTEGER,  
    ordr INTEGER,  
    text TEXT,
    juz INTEGER,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
    """);
    await database.execute(""" CREATE TABLE Guests(
    tokenId KEY INTEGER PRIMARY KEY NOT NULL,
    phoneNb TEXT,
    flag TEXT,
    host INTEGER,
    collaboratorId INTEGER,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
    """);
    await database.execute(""" CREATE TABLE GuestStagegValid(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    tokenId  INTEGER ,
    stage TEXT,
    host INTEGER,
    collaboratorId INTEGER,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
    """);
  }

  late final Database _database;
  // create initialize database
  static Future<Database> db() async {
    var databasePath = getDatabasesPath();
    String path = join(databasePath as String, _dbName);
    var db = await openDatabase(path, version: _dbVersion,
        onCreate: (Database database, int databaseVersion) async {
      await createTable(database);
    });
    return db;
  }

// dispose database
  void dispose() {
    //_database.dispose();
    //_database = null;
  }
// deal with guests
  Future<List<Guest>> getAllGuests() async {
    final db = await DBHelper.db();
    var res = await db.query('Guests', orderBy: 'tokenId');
    List<Guest> guests =
        res.isNotEmpty ? res.map((a) => Guest.fromMap(a)).toList() : [];
    return guests;
  }

  /*  Future<Guest> createGuest(Guest guest) async {
    final db = await DBHelper.db();
    var res = await db.insert('Guests', guest!.toMap() as Map<String, dynamic>);
    Guest guest =
        res.toString() != '' ? res!.map((a) => Guest.fromMap(a)).toList() : [];
    return guest;
  } */

// deal with stages
  static Future<List<Guest>> getStage() async {
    final db = await DBHelper.db();
    var res = await db.query('Guests', orderBy: 'tokenId');
    List<Guest> guests =
        res.isNotEmpty ? res.map((a) => Guest.fromMap(a)).toList() : [];
    return guests;
  }

  static Future<int> validStage(
      {int? grid,
      required int guest,
      required int souraNb,
      required String souraName,
      required int host}) async {
    final db = await DBHelper.db();

    final data = {
      'grid': grid,
      'guest': guest,
      'host': host,
      'souraNb': souraNb,
      'souraName': souraName
    };
    final id = await db.insert('stages', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getValidStages() async {
    final db = await DBHelper.db();
    return await db.query('stages', orderBy: 'guest');
  }

  static Future<int> updateStages(int id, String? guest, String? grid) async {
    final db = await DBHelper.db();

    final data = {
      'guest': guest,
      'grid': grid,
    };
    final result =
        await db.update('stages', data, where: 'id = ?', whereArgs: [id]);
    return result;
  }

  static Future<void> deleteStage(int id) async {
    final db = await DBHelper.db();
    try {
      await db.delete('stages', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      print('error: ${e.toString()}');
    }
  }
}
