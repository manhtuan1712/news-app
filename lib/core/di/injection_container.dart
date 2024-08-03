import 'package:get_it/get_it.dart';
import 'package:news_app/core/api/service/base/base_rest_service.dart';
import 'package:news_app/core/helpers/secure_storage.dart';
import 'package:news_app/core/theme/theme_style.dart';
import 'package:news_app/features/news/data/datasources/news_remote_data_source.dart';
import 'package:news_app/features/news/data/repository/new_repository_impl.dart';
import 'package:news_app/features/news/domain/repository/news_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Data source
  sl.registerLazySingleton<NewsRemoteDataSource>(
    () => NewsRemoteDataSourceImpl(
      baseRestService: sl(),
    ),
  );

  // Repository
  sl.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(
      newsRemoteDataSource: sl(),
    ),
  );

  // Use case

  // Cubit

  // Services
  sl.registerLazySingleton<BaseRestService>(
    () => BaseRestService(),
  );

  // Other
  sl.registerLazySingleton<ThemeStyle>(
    () => ThemeStyle(),
  );
  sl.registerFactory<SecureStorage>(
    () => SecureStorage(),
  );
}
