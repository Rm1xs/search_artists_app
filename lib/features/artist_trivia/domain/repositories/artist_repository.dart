import 'package:dartz/dartz.dart';
import 'package:search_artists_app/core/error/failures.dart';
import 'package:search_artists_app/features/artist_trivia/domain/entities/artists.dart';

abstract class ArtistRepository {
  Future<Either<Failure, Artist>> getArtist(String name);
}
