abstract class ArtistEvent {
  @override
  List<Object> get props => [];
}

class GetArtistName extends ArtistEvent {
  final String inputString;

  GetArtistName(this.inputString);

  @override
  List<Object> get props => [inputString];
}
