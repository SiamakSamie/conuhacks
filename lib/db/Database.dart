import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:conuhacks/models/Bike.dart';
import 'package:conuhacks/models/Station.dart';

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
    // await deleteDatabase(path);
    return theDb;
  }

  // Creating a table name Bike with fields
  void _onCreate(Database db, int version) async {
    // When creating the db, create the table

    Batch batch = db.batch();
    batch.execute("CREATE TABLE Bike(id INTEGER PRIMARY KEY, speed INTEGER, gear INTEGER, distance REAL, stationId INTEGER)");
    batch.execute("CREATE TABLE Station(id INTEGER PRIMARY KEY, name VARCHAR, lat REAL, long REAL, totalBikes INTEGER, availableBikes INTEGER)");

    await batch.commit();
  
    insertFiveStations();
    insertSixTeenBikes();
    print("Created tables");
  }
  
  insertFiveStations() async {
    var dbClient = await db;
    await dbClient.rawQuery('REPLACE INTO Station (name, lat, long, totalBikes, availableBikes) VALUES ("Angrignon", 45.446609, -73.602257, 10, 3)');
    await dbClient.rawQuery('REPLACE INTO Station (name, lat, long, totalBikes, availableBikes) VALUES ("Charlevoix", 45.476394, -73.569462, 10, 6)');
    await dbClient.rawQuery('REPLACE INTO Station (name, lat, long, totalBikes, availableBikes) VALUES ("Cote Vertu", 45.528420, -73.667780, 10, 5)');
    await dbClient.rawQuery('REPLACE INTO Station (name, lat, long, totalBikes, availableBikes) VALUES ("Mount Royal", 45.503232, -73.596138, 15, 6)');
    await dbClient.rawQuery('REPLACE INTO Station (name, lat, long, totalBikes, availableBikes) VALUES ("Old Port", 45.507577, -73.553091, 15, 8)');
    await dbClient.rawQuery('REPLACE INTO Station (name, lat, long, totalBikes, availableBikes) VALUES ("Concordia", 45.495246, -73.579042, 20, 6)');
    await dbClient.rawQuery('REPLACE INTO Station (name, lat, long, totalBikes, availableBikes) VALUES ("Cote des neiges", 45.496146, -73.623142, 10, 2)');
  }

    insertSixTeenBikes() async {
    var dbClient = await db;
    await dbClient.rawQuery('REPLACE INTO Bike (speed, gear, distance, stationId) VALUES (10, 5, 100, 1)');
    await dbClient.rawQuery('REPLACE INTO Bike (speed, gear, distance, stationId) VALUES (15, 6, 200, 1)');
    await dbClient.rawQuery('REPLACE INTO Bike (speed, gear, distance, stationId) VALUES (20, 4, 300, 1)');
    await dbClient.rawQuery('REPLACE INTO Bike (speed, gear, distance, stationId) VALUES (15, 5, 400, 1)');
    await dbClient.rawQuery('REPLACE INTO Bike (speed, gear, distance, stationId) VALUES (20, 3, 500, 1)');
    await dbClient.rawQuery('REPLACE INTO Bike (speed, gear, distance, stationId) VALUES (25, 2, 600, 1)');
    await dbClient.rawQuery('REPLACE INTO Bike (speed, gear, distance, stationId) VALUES (30, 3, 700, 1)');

    await dbClient.rawQuery('REPLACE INTO Bike (speed, gear, distance, stationId) VALUES (15, 4, 200, 2)');
    await dbClient.rawQuery('REPLACE INTO Bike (speed, gear, distance, stationId) VALUES (10, 4, 100, 2)');
    await dbClient.rawQuery('REPLACE INTO Bike (speed, gear, distance, stationId) VALUES (15, 3, 400, 2)');
    await dbClient.rawQuery('REPLACE INTO Bike (speed, gear, distance, stationId) VALUES (20, 4, 200, 2)');
    await dbClient.rawQuery('REPLACE INTO Bike (speed, gear, distance, stationId) VALUES (25, 4, 300, 2)');
    await dbClient.rawQuery('REPLACE INTO Bike (speed, gear, distance, stationId) VALUES (15, 3, 800, 2)');
    await dbClient.rawQuery('REPLACE INTO Bike (speed, gear, distance, stationId) VALUES (10, 2, 500, 2)');
  }

  Future<List<Bike>> getBikes() async {
    var dbClient = await db;
    var res = await dbClient.query("Bike");
    List<Bike> list =
        res.isNotEmpty ? res.map((c) => Bike.fromJson(c)).toList() : [];
    return list;
  }

  Future<List<Bike>> getBike(int id) async {
    var dbClient = await db;
    var res = await dbClient.query("Bike", where: 'id = ?', whereArgs: [id]);
    List<Bike> bike = res.isNotEmpty ? res.map((c) => Bike.fromJson(c)).toList() : [];
    return bike;
  }

  Future<List<Station>> getStations() async {
    var dbClient = await db;
    var res = await dbClient.query("Station");
    List<Station> list =
        res.isNotEmpty ? res.map((c) => Station.fromJson(c)).toList() : [];
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