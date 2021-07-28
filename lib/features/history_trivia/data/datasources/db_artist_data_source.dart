import 'package:search_artists_app/features/artist_trivia/domain/entities/info.dart';
import 'package:search_artists_app/features/history_trivia/data/datasources/db_provider.dart';

abstract class DbArtistDataSource {
  void addArtist(Info info);

  Future getArtist();

  Future deleteAllArtist();
}

final dbProvider = DatabaseProvider.dbProvider;

class DbArtistDataSourceImpl {
  void addArtist(Info info) async {
    final db = await dbProvider.database;
    db?.insert('artists', info.toMap());
  }

  Future<List<Info>> getArtist() async {
    final db = await dbProvider.database;
    final tables = await db!.rawQuery('SELECT * FROM artists');

    List<Info> artist = tables.isNotEmpty
        ? tables.map((item) => Info.fromDatabaseJson(item)).toList()
        : [];
    return artist;
  }

  Future deleteAllArtist() async {
    final db = await dbProvider.database;
    var result = await db!.delete(
      'artists',
    );
    return result;
  }
}
