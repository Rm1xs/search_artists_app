import 'dart:convert';
import 'package:search_artists_app/features/artist_trivia/data/models/similar.dart';
import 'package:search_artists_app/features/artist_trivia/domain/entities/artists.dart';

ArtistModel artistFromJson(String str) =>
    ArtistModel.fromJson(json.decode(str));

String artistToJson(ArtistModel data) => json.encode(data.toJson());

class ArtistModel extends Artist {
  ArtistModel({
    required this.similarModel,
  }) : super(similar: similarModel);

  SimilarModel similarModel;

  factory ArtistModel.fromJson(Map<String, dynamic> json) => ArtistModel(
        similarModel: SimilarModel.fromJson(json["Similar"]),
      );

  Map<String, dynamic> toJson() => {"Similar": similarModel.toJson(),};
}

enum Type { MUSIC }

final EnumValues<Type> typeValues = EnumValues({'music': Type.MUSIC});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));

    return reverseMap;
  }
}
