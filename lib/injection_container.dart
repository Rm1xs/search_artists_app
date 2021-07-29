import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:search_artists_app/core/platform/network_info.dart';
import 'package:search_artists_app/core/util/input_converter.dart';
import 'package:search_artists_app/features/artist_trivia/data/datasources/artist_remote_data_sorce.dart';
import 'package:search_artists_app/features/artist_trivia/data/repositories/artist_repository_implement.dart';
import 'package:search_artists_app/features/artist_trivia/domain/repositories/artist_repository.dart';
import 'package:search_artists_app/features/artist_trivia/domain/usecases/get_artist.dart';

import 'features/artist_trivia/presentation/bloc/artist_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => ArtistBloc(
      concrete: sl(),
      inputConverter: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetArtist(sl()));

  // Repository
  sl.registerLazySingleton<ArtistRepository>(
    () => ArtistRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<ArtistRemoteDataSource>(
    () => ArtistRemoteDataSourceImpl(sl()),
  );

  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() => Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
