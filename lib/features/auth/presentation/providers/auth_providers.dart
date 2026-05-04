import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/datasources/local_auth_datasource.dart';
import '../../data/datasources/remote_auth_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/get_stored_session_usecase.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';

// ============ DIO Provider ============
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.options = BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  );
  return dio;
});

// ============ Shared Preferences Provider ============
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError(
      'sharedPreferencesProvider must be overridden in main.dart');
});

// ============ DataSources Providers ============
final remoteAuthDataSourceProvider = Provider<RemoteAuthDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return RemoteAuthDataSourceImpl(dio);
});

final localAuthDataSourceProvider = Provider<LocalAuthDataSource>((ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  return LocalAuthDataSourceImpl(sharedPrefs);
});

// ============ Repository Provider ============
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remoteDataSource = ref.watch(remoteAuthDataSourceProvider);
  final localDataSource = ref.watch(localAuthDataSourceProvider);

  return AuthRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );
});

// ============ UseCases Providers ============
final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LoginUseCase(repository);
});

final logoutUseCaseProvider = Provider<LogoutUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LogoutUseCase(repository);
});

final getStoredSessionUseCaseProvider = Provider<GetStoredSessionUseCase>((
  ref,
) {
  final repository = ref.watch(authRepositoryProvider);
  return GetStoredSessionUseCase(repository);
});
