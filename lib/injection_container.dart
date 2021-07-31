import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:search_artists_app/core/util/input_converter.dart';
import 'package:search_artists_app/core/datasources/artist_remote_data_sorce.dart';
import 'package:search_artists_app/features/artist_trivia/data/repositories/artist_repository_implement.dart';
import 'package:search_artists_app/features/artist_trivia/domain/repositories/artist_repository.dart';
import 'package:search_artists_app/features/artist_trivia/domain/usecases/get_artist.dart';

import 'core/datasources/db_artist_data_source.dart';
import 'features/artist_trivia/presentation/bloc/artist_bloc.dart';
import 'features/history_trivia/data/repositories/db_add_artist_repository_impl.dart';
import 'features/history_trivia/domain/repositories/db_repository.dart';
import 'features/history_trivia/domain/usecases/db_add_artist.dart';
import 'features/history_trivia/presentation/bloc/db_artist_bloc.dart';

final sl = GetIt.instance;
final history = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => ArtistBloc(
      concrete: sl(),
      inputConverter: sl(),
    ),
  );

  history.registerFactory(
    () => DbArtistBloc(
      getConcreteArtist: history(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetArtist(sl()));
  history.registerLazySingleton(() => DbAddArtist(history()));

  // Repository
  sl.registerLazySingleton<ArtistRepository>(
    () => ArtistRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  history.registerLazySingleton<DbRepository>(
    () => DbArtistRepositoryImpl(history()),
  );

  // Data sources
  sl.registerLazySingleton<ArtistRemoteDataSource>(
    () => ArtistRemoteDataSourceImpl(sl()),
  );

  history.registerLazySingleton<DbArtistDataSource>(
    () => DbArtistDataSourceImpl(),
  );

  //! Core
  sl.registerLazySingleton(() => InputConverter());

  //! External
  sl.registerLazySingleton(() => Client());

}
