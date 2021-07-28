import 'package:search_artists_app/features/artist_trivia/domain/entities/info.dart';
import 'package:search_artists_app/features/history_trivia/data/datasources/db_artist_data_source.dart';

final artistDao = DbArtistDataSourceImpl();

class DbRepository {
  void addArtist(Info info) => artistDao.addArtist(info);

  Future getAllArtist() => artistDao.getArtist();

  Future deleteAllArtist() => artistDao.deleteAllArtist();
}
