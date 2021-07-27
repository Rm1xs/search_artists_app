import 'package:equatable/equatable.dart';
import 'package:search_artists_app/features/artist_trivia/domain/entities/artists.dart';

abstract class DbArtistState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends DbArtistState {}

class Saving extends DbArtistState {}

class Saved extends DbArtistState {
  final Artist artist;

  Saved({required this.artist});

  @override
  List<Object> get props => [artist];
}

class Error extends DbArtistState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
