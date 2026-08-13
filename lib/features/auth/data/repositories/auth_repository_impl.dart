import '../../domain/entities/auth_response.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/local_auth_datasource.dart';
import '../datasources/remote_auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final RemoteAuthDataSource remoteDataSource;
  final LocalAuthDataSource localDataSource;

  RemoteAuthDataSourceImpl get _firebaseSource =>
      remoteDataSource as RemoteAuthDataSourceImpl;

  @override
  Future<AuthResponse> login({
    required String username,
    required String password,
  }) async {
    final response = await remoteDataSource.login(
      username: username,
      password: password,
    );
    return response.toEntity();
  }

  @override
  Future<void> logout() async {
    await _firebaseSource.logout();
    await clearSession();
  }

  @override
  Future<AuthResponse?> getStoredSession() async =>
      (await _firebaseSource.currentSession())?.toEntity();

  @override
  Future<void> saveSession(AuthResponse response) async {
    // Firebase Auth persiste y renueva la sesión de forma segura.
  }

  @override
  Future<void> clearSession() => localDataSource.clearSession();
}
