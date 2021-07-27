import 'package:search_artists_app/core/usecases/usecase.dart';
import 'package:search_artists_app/features/artist_trivia/domain/entities/artists.dart';
import 'package:search_artists_app/features/history_trivia/domain/repositories/db_repository.dart';

class DbAddArtist implements DbUseCase<Artist> {
  final DbRepository repository;

  DbAddArtist(this.repository);

  @override
  Future call(Artist params) async {
    repository.addArtist(params);
  }
}

