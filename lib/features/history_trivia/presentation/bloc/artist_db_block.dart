import 'dart:async';
import 'package:search_artists_app/features/artist_trivia/domain/entities/info.dart';
import 'package:search_artists_app/features/history_trivia/data/datasources/db_artist_data_source.dart';

class ArtistDbBloc {
  final _artistRepository = DbArtistDataSourceImpl();

  final _artistController = StreamController<List<Info>>.broadcast();

  get artists => _artistController.stream;

  ArtistDbBloc() {
    getArtist();
  }

  Future getArtist() async {
    _artistController.sink.add(await _artistRepository.getArtist());
  }

  addArtist(Info info) {
    _artistRepository.addArtist(info);
    getArtist();
  }

  deleteAll(){
    _artistRepository.deleteAllArtist();
  }

  dispose() {
    _artistController.close();
  }
}
