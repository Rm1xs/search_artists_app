import 'package:search_artists_app/features/artist_trivia/data/models/info.dart';
import 'package:search_artists_app/features/artist_trivia/domain/entities/similar.dart';

class SimilarModel extends Similar {
  SimilarModel({
    required this.info,
    required this.results,
  }) : super(results: results, info: info);

  final List<InfoModel> info;
  final List<InfoModel> results;

  factory SimilarModel.fromJson(Map<String, dynamic> json) => SimilarModel(
        info: List<InfoModel>.from(
            json["Info"].map((x) => InfoModel.fromJson(x))),
        results: List<InfoModel>.from(
            json["Results"].map((x) => InfoModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Info": List<dynamic>.from(info.map((x) => x.toJson())),
        "Results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
