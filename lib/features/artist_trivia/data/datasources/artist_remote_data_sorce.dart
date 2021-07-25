import 'dart:convert';
import 'package:search_artists_app/core/error/exeptions.dart';
import 'package:http/http.dart' as http;
import 'package:search_artists_app/features/artist_trivia/data/models/artists.dart';

abstract class ArtistRemoteDataSource {
  Future<ArtistModel> getArtist(String name);
}

class ArtistRemoteDataSourceImpl implements ArtistRemoteDataSource {
  final http.Client client;

  ArtistRemoteDataSourceImpl(this.client);

  @override
  Future<ArtistModel> getArtist(String url) =>
      _getFromUrl('http://tastedive.com/api/similar?q=$url');

  Future<ArtistModel> _getFromUrl(String url) async {
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return ArtistModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
