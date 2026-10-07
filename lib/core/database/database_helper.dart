import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const String databaseName = 'flight_database.db';
  static const int databaseVersion = 1;

  static const String flightTable = 'flights';

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return await openDatabase(
      path,
      version: databaseVersion,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $flightTable (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            flightTripKey TEXT NOT NULL,
            flightData TEXT NOT NULL
          )
        ''');
      },
    );
  }
}
