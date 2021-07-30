import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_artists_app/features/artist_trivia/domain/entities/info.dart';
import 'package:search_artists_app/features/history_trivia/domain/usecases/db_add_artist.dart';
import 'package:search_artists_app/features/history_trivia/presentation/bloc/db_artist_event.dart';
import 'package:search_artists_app/features/history_trivia/presentation/bloc/db_artist_state.dart';

class DbArtistBloc extends Bloc<DbArtistEvent, DbArtistState> {
  final DbAddArtist getConcreteArtist;

  DbArtistBloc({required this.getConcreteArtist}) : super(Empty()) {
    add(GetAllArtist());
  }

  DbArtistState get initialState => Empty();

  @override
  Stream<DbArtistState> mapEventToState(
    DbArtistEvent event,
  ) async* {
    if (event is GetAllArtist) {
      yield Loading();
      try {
        final List<Info> _loadedList = await getConcreteArtist.getArtist();
        yield Loaded(list: _loadedList);
      } catch (_e) {
        yield Error(message: _e.toString());
      }
    }
  }
}
