import 'package:search_artists_app/features/artist_trivia/domain/entities/artists.dart';

abstract class DbArtistEvent {
  @override
  List<Object> get props => [];
}

class AddArtist extends DbArtistEvent {
  final Artist artist;

  AddArtist(this.artist);

  @override
  List<Object> get props => [artist];
}
