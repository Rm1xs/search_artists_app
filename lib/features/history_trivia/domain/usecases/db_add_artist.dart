import 'package:search_artists_app/core/usecases/usecase.dart';
import 'package:search_artists_app/features/artist_trivia/domain/entities/artists.dart';
import 'package:search_artists_app/features/artist_trivia/domain/entities/info.dart';
import 'package:search_artists_app/features/history_trivia/domain/repositories/db_repository.dart';

class DbAddArtist implements DbUseCase<Info> {
  final DbRepository repository;

  DbAddArtist(this.repository);

  @override
  Future add(Info params) async {
    repository.addArtist(params);
  }

  @override
  Future deleteAllArtist() async {
    repository.deleteAllArtist();
  }

  @override
  Future getArtist() async {
    repository.getAllArtist();
  }
}
