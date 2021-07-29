import 'package:search_artists_app/features/artist_trivia/domain/entities/info.dart';
import 'package:search_artists_app/features/history_trivia/data/datasources/db_provider.dart';
import 'package:sqflite_common/sqlite_api.dart';

abstract class DbArtistDataSource {
  void addArtist(Info info);

  Future getArtist();

  Future deleteAllArtist();
}

final dbProvider = DatabaseProvider.dbProvider;

class DbArtistDataSourceImpl {
  void addArtist(Info info) async {
    final Database? db = await dbProvider.database;
    db?.insert('artists', info.toMap());
  }

  Future<List<Info>> getArtist() async {
    final Database? db = await dbProvider.database;
    final List<Map<String, Object?>> tables = await db!.rawQuery('SELECT * FROM artists');

    List<Info> artist = tables.isNotEmpty
        ? tables.map((item) => Info.fromDatabaseJson(item)).toList()
        : [];
    return artist;
  }

  Future deleteAllArtist() async {
    final Database? db = await dbProvider.database;
    int result = await db!.delete(
      'artists',
    );
    return result;
  }
}
