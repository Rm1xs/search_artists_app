import 'package:search_artists_app/features/artist_trivia/domain/entities/info.dart';
import 'package:search_artists_app/features/history_trivia/data/datasources/db_artist_data_source.dart';
import 'package:search_artists_app/features/history_trivia/domain/repositories/db_repository.dart';

class ArtistRepositoryImpl implements DbRepository {
  final DbArtistDataSource dbArtistDataSource;

  ArtistRepositoryImpl(this.dbArtistDataSource);

  @override
  void addArtist(Info info) async {
    return dbArtistDataSource.addArtist(info);
  }

  @override
  Future deleteAllArtist() {
    return dbArtistDataSource.deleteAllArtist();
  }

  @override
  Future getAllArtist() {
    return dbArtistDataSource.getArtist();
  }
}
