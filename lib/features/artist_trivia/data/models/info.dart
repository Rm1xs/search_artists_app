import 'package:search_artists_app/features/artist_trivia/domain/entities/info.dart';

class InfoModel extends Info {
  InfoModel({
    required this.name,
    required this.type,
  }) : super(name: name, type: type);

  String name;
  String type;

  factory InfoModel.fromJson(Map<String, dynamic> json) => InfoModel(
        name: json["Name"],
        type: json["Type"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Type": type,
      };
}
