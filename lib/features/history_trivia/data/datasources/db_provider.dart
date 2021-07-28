import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final tableName = 'artists';

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();
  Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }

  createDatabase() async {
    String path = join(await getDatabasesPath(), "artist_database.db");

    var database = await openDatabase(path,
        version: 1, onCreate: initDb, onUpgrade: onUpgrade);
    return database;
  }

  void onUpgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {}
  }

  void initDb(Database database, int version) async {
    await database.execute(
      'CREATE TABLE $tableName(id INTEGER PRIMARY KEY, name TEXT, type TEXT)',
    );
  }
}
