import 'package:get_it/get_it.dart';
import 'package:news_app/core/api/service/base/base_rest_service.dart';
import 'package:news_app/core/helpers/secure_storage.dart';
import 'package:news_app/core/theme/theme_style.dart';
import 'package:news_app/features/authentication/data/datasources/authetication_remote_data_source.dart';
import 'package:news_app/features/authentication/data/repository/authentication_repository_impl.dart';
import 'package:news_app/features/authentication/domain/repository/authentication_repository.dart';
import 'package:news_app/features/authentication/domain/usecase/login.dart';
import 'package:news_app/features/authentication/domain/usecase/sign_up.dart';
import 'package:news_app/features/authentication/presentation/cubit/login_cubit.dart';
import 'package:news_app/features/authentication/presentation/cubit/sign_up_cubit.dart';
import 'package:news_app/features/home/data/datasoures/home_local_data_source.dart';
import 'package:news_app/features/home/data/datasoures/home_remote_data_source.dart';
import 'package:news_app/features/home/data/repository/home_repository_impl.dart';
import 'package:news_app/features/home/domain/repository/home_repository.dart';
import 'package:news_app/features/home/domain/usecase/get_sources.dart';
import 'package:news_app/features/home/domain/usecase/get_top_headlines.dart';
import 'package:news_app/features/home/domain/usecase/get_top_headlines_local.dart';
import 'package:news_app/features/home/domain/usecase/save_top_headlines_local.dart';
import 'package:news_app/features/home/presentation/cubit/home_article_cubit.dart';
import 'package:news_app/features/home/presentation/cubit/home_source_cubit.dart';
import 'package:news_app/features/profile/presentation/cubit/profile_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Data source
  sl.registerLazySingleton<AuthenticationRemoteDataSource>(
    () => AuthenticationRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(
      baseRestService: sl(),
    ),
  );
  sl.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(),
  );

  // Repository
  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      authenticationRemoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      homeRemoteDataSource: sl(),
      homeLocalDataSource: sl(),
    ),
  );

  // Use case
  sl.registerLazySingleton<SignUp>(
    () => SignUp(
      authenticationRepository: sl(),
    ),
  );
  sl.registerLazySingleton<Login>(
    () => Login(
      authenticationRepository: sl(),
    ),
  );
  sl.registerLazySingleton<GetTopHeadlines>(
    () => GetTopHeadlines(
      homeRepository: sl(),
    ),
  );
  sl.registerLazySingleton<GetSources>(
    () => GetSources(
      homeRepository: sl(),
    ),
  );
  sl.registerLazySingleton<SaveTopHeadlinesLocal>(
    () => SaveTopHeadlinesLocal(
      homeRepository: sl(),
    ),
  );
  sl.registerLazySingleton<GetTopHeadlinesLocal>(
    () => GetTopHeadlinesLocal(
      homeRepository: sl(),
    ),
  );

  // Cubit
  sl.registerFactory<SignUpCubit>(
    () => SignUpCubit(
      signUp: sl(),
    ),
  );
  sl.registerFactory<LoginCubit>(
    () => LoginCubit(
      login: sl(),
    ),
  );
  sl.registerFactory<HomeArticleCubit>(
    () => HomeArticleCubit(
      getTopHeadlines: sl(),
      saveTopHeadlinesLocal: sl(),
      getTopHeadlinesLocal: sl(),
    ),
  );
  sl.registerFactory<HomeSourceCubit>(
    () => HomeSourceCubit(
      getSources: sl(),
    ),
  );
  sl.registerFactory<ProfileCubit>(
    () => ProfileCubit(),
  );

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
