import 'package:equatable/equatable.dart';
import 'package:search_artists_app/features/artist_trivia/domain/entities/artists.dart';

abstract class ArtistState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends ArtistState {}

class Loading extends ArtistState {}

class Loaded extends ArtistState {
  final Artist artist;

  Loaded({required this.artist});

  @override
  List<Object> get props => [artist];
}

class Error extends ArtistState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
