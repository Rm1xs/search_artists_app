import 'package:equatable/equatable.dart';
import 'package:search_artists_app/features/artist_trivia/domain/entities/similar.dart';

class Artist extends Equatable {
  Artist({
    required this.similar,
  });

  Similar similar;

  @override
  List<Object> get props => [similar];
}
