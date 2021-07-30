import 'dart:convert';
import 'package:search_artists_app/core/datasources/db_artist_data_source.dart';
import 'package:search_artists_app/core/error/exeptions.dart';
import 'package:http/http.dart' as http;
import 'package:search_artists_app/features/artist_trivia/data/models/artists.dart';

abstract class ArtistRemoteDataSource {
  Future<ArtistModel> getArtist(String name);
}

class ArtistRemoteDataSourceImpl implements ArtistRemoteDataSource {
  final http.Client client;

  ArtistRemoteDataSourceImpl(this.client);

  final DbArtistDataSourceImpl artBloc = DbArtistDataSourceImpl();

  @override
  Future<ArtistModel> getArtist(String url) =>
      _getFromUrl('https://tastedive.com/api/similar?q=$url');

  Future<ArtistModel> _getFromUrl(String url) async {
    final http.Response response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      ArtistModel data = ArtistModel.fromJson(json.decode(response.body));
      artBloc.deleteAllArtist();
      data.similar.results.forEach((val) {
        artBloc.addArtist(val);
      });
      return data;
    } else {
      throw ServerException();
    }
  }
}
