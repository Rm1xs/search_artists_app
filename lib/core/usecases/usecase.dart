import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:search_artists_app/core/error/failures.dart';
import 'package:search_artists_app/features/artist_trivia/domain/entities/info.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
abstract class DbUseCase<Artist> {
  void add(Info params);

  Future getArtist();

  Future deleteAllArtist();
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}