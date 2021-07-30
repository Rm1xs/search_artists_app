import 'package:search_artists_app/features/artist_trivia/domain/entities/info.dart';
import 'package:search_artists_app/core/datasources/db_artist_data_source.dart';
import 'package:search_artists_app/features/history_trivia/domain/repositories/db_repository.dart';

class DbArtistRepositoryImpl implements DbRepository {
  final DbArtistDataSource dbArtistDataSource;

  DbArtistRepositoryImpl(this.dbArtistDataSource);

  @override
  void addArtist(Info info) async {
    return dbArtistDataSource.addArtist(info);
  }

  @override
  Future deleteAllArtist() {
    return dbArtistDataSource.deleteAllArtist();
  }

  @override
  Future<List<Info>> getAllArtist() {
    return dbArtistDataSource.getArtist();
  }
}
