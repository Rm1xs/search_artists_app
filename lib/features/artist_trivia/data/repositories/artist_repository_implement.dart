import 'package:dartz/dartz.dart';
import 'package:search_artists_app/core/error/exeptions.dart';
import 'package:search_artists_app/core/error/failures.dart';
import 'package:search_artists_app/core/platform/network_info.dart';
import 'package:search_artists_app/features/artist_trivia/data/datasources/artist_remote_data_sorce.dart';
import 'package:search_artists_app/features/artist_trivia/domain/entities/artists.dart';
import 'package:search_artists_app/features/artist_trivia/domain/repositories/artist_repository.dart';

typedef Future<Artist> _ArtistChooser();

class ArtistRepositoryImpl implements ArtistRepository {
  final ArtistRemoteDataSource remoteDataSource;
  //final NetworkInfo networkInfo;

  ArtistRepositoryImpl({
    required this.remoteDataSource,
    //required this.networkInfo,
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

      try {
        final Artist artistTrivia = await _artistChooser();
        return Right(artistTrivia);
      } on CacheException {
        return Left(CacheFailure());
      }

  }
}
