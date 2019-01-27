import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:conuhacks/modals/Bike.dart';

class DBHelper{

  static Database _db;

  Future<Database> get db async {
    if(_db != null)
      return _db;
    _db = await initDb();
    return _db;
  }

  //Creating a database with name bixiti.dn in your directory
  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "bixicti.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  // Creating a table name Bike with fields
  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
    "CREATE TABLE Bike(id INTEGER PRIMARY KEY, speed INTEGER, gear INTEGER, distance INTEGER)");
    print("Created tables");
  }
  
  // Retrieving employees from Bike Tables
  Future<List<Bike>> getBikes() async {
    var dbClient = await db;
    var res = await dbClient.query("Bike");
    List<Bike> list =
        res.isNotEmpty ? res.map((c) => Bike.fromJson(c)).toList() : [];
    return list;
  }

  deleteAllBikes() async {
    var dbClient = await db;
    await dbClient.rawQuery('DELETE FROM bike');
  }
  
  addBike(Bike bike) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      return await txn.rawInsert(
          'INSERT INTO Bike(speed, gear, distance, stationId) VALUES(' +
              '\'' +
              bike.speed.toString() +
              '\'' +
              ',' +
              '\'' +
              bike.gear.toString() +
              '\'' +
              ',' +
              '\'' +
              bike.distance.toString() +
              '\'' +
              ',' +
              '\'' +
              bike.stationId.toString() +
              '\'' +
              ')');
    });
  }
}