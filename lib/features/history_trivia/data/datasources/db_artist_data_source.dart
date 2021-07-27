import 'package:path/path.dart';
import 'package:search_artists_app/features/artist_trivia/domain/entities/artists.dart';
import 'package:sqflite/sqflite.dart';

abstract class DbArtistDataSource {
  void addArtist(Artist artist);
}

class DbArtistDataSourceImpl implements DbArtistDataSource {
  @override
  void addArtist(Artist artist) async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'artist_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE artists(id INTEGER PRIMARY KEY, name TEXT, type TEXT)',
        );
      },
      version: 1,
    );
    final db = await database;
    await db.insert(
      'artists',
      artist.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}