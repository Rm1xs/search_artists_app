import 'dart:convert';
import 'package:search_artists_app/core/error/exeptions.dart';
import 'package:http/http.dart' as http;
import 'package:search_artists_app/features/artist_databse/bloc/artist_db_block.dart';

import 'package:search_artists_app/features/artist_trivia/data/models/artists.dart';
import 'package:search_artists_app/features/artist_trivia/domain/entities/info.dart';

abstract class ArtistRemoteDataSource {
  Future<ArtistModel> getArtist(String name);
}

class ArtistRemoteDataSourceImpl implements ArtistRemoteDataSource {
  final http.Client client;
  ArtistRemoteDataSourceImpl(this.client);
  final ArtistDbBloc artBloc = ArtistDbBloc();
  @override
  Future<ArtistModel> getArtist(String url) =>
      _getFromUrl('https://tastedive.com/api/similar?q=$url');

  Future<ArtistModel> _getFromUrl(String url) async {
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var data = ArtistModel.fromJson(json.decode(response.body));

      data.similar.results.forEach((val) {

        artBloc.addArtist(val);
      });

      //var t = artBloc.getArtist();


      return data;
    } else {
      throw ServerException();
    }
  }
}
