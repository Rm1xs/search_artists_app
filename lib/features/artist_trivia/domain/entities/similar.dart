import 'package:search_artists_app/features/artist_trivia/domain/entities/info.dart';

class Similar {
  Similar({
    required this.info,
    required this.results,
  });

  List<Info> info;
  List<Info> results;
}
