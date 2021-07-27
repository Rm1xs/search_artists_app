import 'package:search_artists_app/features/artist_trivia/domain/entities/artists.dart';
import 'package:search_artists_app/features/history_trivia/data/datasources/db_artist_data_source.dart';
import 'package:search_artists_app/features/history_trivia/domain/repositories/db_repository.dart';

class ArtistRepositoryImpl implements DbRepository {
  final DbArtistDataSource dbArtistDataSource;

  ArtistRepositoryImpl(this.dbArtistDataSource);
  @override
  void addArtist(Artist artist) async {

      return dbArtistDataSource.addArtist(artist);
    }
  }