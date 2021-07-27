import 'package:search_artists_app/features/artist_databse/data/artist_add_dao.dart';
import 'package:search_artists_app/features/artist_trivia/domain/entities/info.dart';

class DbRepository {
  final artistDao = ArtistAddDao();

  Future getAllArtist() => artistDao.getArtist();

  Future addArtist(Info info) => artistDao.createArtist(info);

  Future deleteAllArtist() => artistDao.deleteAllArtist();
}
