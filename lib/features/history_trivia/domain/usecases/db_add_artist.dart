import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:search_artists_app/core/error/failures.dart';
import 'package:search_artists_app/core/usecases/usecase.dart';
import 'package:search_artists_app/features/artist_trivia/domain/entities/artists.dart';
import 'package:search_artists_app/features/history_trivia/domain/repositories/db_repository.dart';

class DbAddArtist implements DbUseCase<Artist, Params> {
  final DbRepository repository;

  DbAddArtist(this.repository);

  @override
  Future<Either<Failure, Artist>> call(Params params) async {
    return await repository.addArtist(params.name);
  }
}

class Params extends Equatable {
  final String name;

  Params({required this.name});

  @override
  List<Object> get props => [name];
}
