import 'package:equatable/equatable.dart';
import 'package:search_artists_app/features/artist_trivia/domain/entities/similar.dart';
import 'package:uuid/uuid.dart';

class Artist extends Equatable {
  Artist({
    required this.similar,
  });

  final Uuid id = Uuid();
  Similar similar;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': similar.info,
      'type': similar.results,
    };
  }

  @override
  List<Object> get props => [similar];
}
