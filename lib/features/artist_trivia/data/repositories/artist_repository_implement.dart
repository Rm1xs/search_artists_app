import 'package:dartz/dartz.dart';
import 'package:search_artists_app/core/datasources/db_artist_data_source.dart';
import 'package:search_artists_app/core/error/exeptions.dart';
import 'package:search_artists_app/core/error/failures.dart';
import 'package:search_artists_app/core/datasources/artist_remote_data_sorce.dart';
import 'package:search_artists_app/features/artist_trivia/domain/entities/artists.dart';
import 'package:search_artists_app/features/artist_trivia/domain/repositories/artist_repository.dart';

typedef Future<Artist> _ArtistChooser();

class ArtistRepositoryImpl implements ArtistRepository {
  final ArtistRemoteDataSource remoteDataSource;

  ArtistRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Artist>> getArtist(
    String name,
  ) async {
    return await _getArtist(() {
      return remoteDataSource.getArtist(name);
    });
  }

  Future<Either<Failure, Artist>> _getArtist(
    _ArtistChooser _artistChooser,
  ) async {
    try {
      final Artist remoteArtist = await _artistChooser();
      return Right(remoteArtist);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
