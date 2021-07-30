import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_artists_app/core/error/failures.dart';
import 'package:search_artists_app/core/util/input_converter.dart';
import 'package:search_artists_app/features/artist_trivia/domain/entities/artists.dart';
import 'package:search_artists_app/features/artist_trivia/domain/usecases/get_artist.dart';
import 'package:search_artists_app/features/artist_trivia/presentation/bloc/artist_event.dart';
import 'package:search_artists_app/features/artist_trivia/presentation/bloc/artist_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class ArtistBloc extends Bloc<ArtistEvent, ArtistState> {
  final GetArtist getConcreteArtist;
  final InputConverter inputConverter;

  ArtistBloc({
    required GetArtist concrete,
    required this.inputConverter,
  })  : getConcreteArtist = concrete,
        super(Empty());

  @override
  Stream<ArtistState> mapEventToState(
    ArtistEvent event,
  ) async* {
    if (event is GetArtistName) {
      final Either<Failure, String> inputEither =
          inputConverter.stringToUnsignedInteger(event.inputString);

      yield* inputEither.fold(
        (failure) async* {
          yield Error(message: INVALID_INPUT_FAILURE_MESSAGE);
        },
        (name) async* {
          yield Loading();
          final Either<Failure, Artist> failureOrTrivia =
              await getConcreteArtist(Params(name: name));
          yield* _eitherLoadedOrErrorState(failureOrTrivia);
        },
      );
    }
  }

  Stream<ArtistState> _eitherLoadedOrErrorState(
    Either<Failure, Artist> failureOrTrivia,
  ) async* {
    yield failureOrTrivia.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (trivia) => Loaded(artist: trivia),
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
