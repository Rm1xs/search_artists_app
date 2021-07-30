import 'package:search_artists_app/features/artist_trivia/domain/entities/info.dart';

abstract class DbArtistState {}

class Empty extends DbArtistState {}

class Loading extends DbArtistState {}

class Loaded extends DbArtistState {
  final List<Info> list;

  Loaded({required this.list});
}

class Error extends DbArtistState {
  final String message;

  Error({required this.message});
}
