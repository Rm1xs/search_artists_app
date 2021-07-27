import 'package:search_artists_app/features/artist_databse/database/database.dart';
import 'package:search_artists_app/features/artist_trivia/domain/entities/info.dart';

class ArtistAddDao {
  final dbProvider = DatabaseProvider.dbProvider;

  createArtist(Info info) async {
    final db = await dbProvider.database;
    db?.insert('artists', info.toMap());
  }

  Future<List<Info>> getArtist() async {
    final db = await dbProvider.database;
    final tables = await db!.rawQuery('SELECT * FROM artists ORDER BY name;');

    List<Info> todos = tables.isNotEmpty
        ? tables.map((item) => Info.fromDatabaseJson(item)).toList()
        : [];
    return todos;
  }

  Future deleteAllArtist() async {
    final db = await dbProvider.database;
    var result = await db!.delete(
      'artists',
    );
    return result;
  }
}
