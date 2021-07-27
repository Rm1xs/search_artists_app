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
    final database = openDatabase(
      join(await getDatabasesPath(), 'artist_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $tableName(id INTEGER PRIMARY KEY, name TEXT, type TEXT)',
        );
      },
      version: 1,
    );
    return database;
  }

  void onUpgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {}
  }
}
