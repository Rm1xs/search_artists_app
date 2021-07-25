import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:search_artists_app/core/error/failures.dart';
import 'package:search_artists_app/core/usecases/usecase.dart';
import 'package:search_artists_app/features/artist_trivia/domain/entities/artists.dart';
import 'package:search_artists_app/features/artist_trivia/domain/repositories/artist_repository.dart';

class GetArtist implements UseCase<Artist, Params> {
  final ArtistRepository repository;

  GetArtist(this.repository);

  @override
  Future<Either<Failure, Artist>> call(Params params) async {
    return await repository.getArtist(params.name);
  }
}

class Params extends Equatable {
  final String name;

  Params({required this.name});

  @override
  List<Object> get props => [name];
}
