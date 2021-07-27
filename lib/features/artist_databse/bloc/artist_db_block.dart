import 'dart:async';

import 'package:search_artists_app/features/artist_databse/repository/db_repository.dart';
import 'package:search_artists_app/features/artist_trivia/domain/entities/info.dart';

class ArtistDbBloc {
  final _artistRepository = DbRepository();

  final _artistController = StreamController<List<Info>>.broadcast();

  get artists => _artistController.stream;

  ArtistDbBloc() {
    getArtist();
  }

  Future getArtist() async {
    _artistController.sink.add(await _artistRepository.getAllArtist());
  }

  addArtist(Info info) async {
    await _artistRepository.addArtist(info);
    getArtist();
  }
}
