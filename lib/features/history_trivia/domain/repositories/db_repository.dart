import 'package:search_artists_app/features/artist_trivia/domain/entities/info.dart';

abstract class DbRepository {
  void addArtist(Info info);

  Future<List<Info>> getAllArtist();

  Future deleteAllArtist();
}
