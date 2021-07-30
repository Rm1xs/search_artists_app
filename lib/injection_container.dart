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
final hstr = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => ArtistBloc(
      concrete: sl(),
      inputConverter: sl(),
    ),
  );

  hstr.registerFactory(
    () => DbArtistBloc(
      getConcreteArtist: hstr(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetArtist(sl()));
  hstr.registerLazySingleton(() => DbAddArtist(hstr()));

  // Repository
  sl.registerLazySingleton<ArtistRepository>(
    () => ArtistRepositoryImpl(
      //networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Repository
  hstr.registerLazySingleton<DbRepository>(
    () => DbArtistRepositoryImpl(hstr()),
  );

  // Data sources
  sl.registerLazySingleton<ArtistRemoteDataSource>(
    () => ArtistRemoteDataSourceImpl(sl()),
  );

  hstr.registerLazySingleton<DbArtistDataSource>(
    () => DbArtistDataSourceImpl(),
  );

  //! Core
  sl.registerLazySingleton(() => InputConverter());
  //sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() => Client());

  //sl.registerLazySingleton(() => DataConnectionChecker());
}
