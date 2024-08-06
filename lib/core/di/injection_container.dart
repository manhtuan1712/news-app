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
import 'package:news_app/features/news/data/datasources/news_remote_data_source.dart';
import 'package:news_app/features/news/data/repository/new_repository_impl.dart';
import 'package:news_app/features/news/domain/repository/news_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Data source
  sl.registerLazySingleton<AuthenticationRemoteDataSource>(
    () => AuthenticationRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<NewsRemoteDataSource>(
    () => NewsRemoteDataSourceImpl(
      baseRestService: sl(),
    ),
  );

  // Repository
  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      authenticationRemoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(
      newsRemoteDataSource: sl(),
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
