import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_artists_app/core/error/failures.dart';
import 'package:search_artists_app/core/util/input_converter.dart';
import 'package:search_artists_app/features/artist_trivia/domain/entities/artists.dart';
import 'package:search_artists_app/features/history_trivia/domain/usecases/db_add_artist.dart';
import 'package:search_artists_app/features/history_trivia/presentation/bloc/db_artist_event.dart';
import 'package:search_artists_app/features/history_trivia/presentation/bloc/db_artist_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class DbArtistBloc extends Bloc<DbArtistEvent, DbArtistState> {
  final DbAddArtist addArtist;
  final InputConverter inputConverter;

  DbArtistBloc({
    required DbAddArtist concrete,
    required this.inputConverter
  })
      : addArtist = concrete,
        super(Empty());

  @override
  Stream<DbArtistState> mapEventToState(DbArtistEvent event) async* {
    if (event is AddArtist) {
      final inputEither =
          inputConverter.checkDb(event.artist);

      yield* inputEither.fold(
            (failure) async* {
          yield Error(message: INVALID_INPUT_FAILURE_MESSAGE);
        },
            (artist) async* {
          yield Saving();
          final failureOrTrivia = await addArtist(artist);
          yield* _eitherLoadedOrErrorState(failureOrTrivia);
        },
      );
    }
  }
  Stream<DbArtistState> _eitherLoadedOrErrorState(
      Either<Failure, Artist> failureOrTrivia,
      ) async* {
    yield failureOrTrivia.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (trivia) => Saved(artist: trivia),
    );
  }
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
