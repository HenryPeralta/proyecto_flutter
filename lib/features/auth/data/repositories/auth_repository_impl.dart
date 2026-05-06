import '../../domain/entities/auth_response.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/local_auth_datasource.dart';
import '../datasources/remote_auth_datasource.dart';
import '../models/login_response_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteAuthDataSource remoteDataSource;
  final LocalAuthDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<AuthResponse> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await remoteDataSource.login(
        username: username,
        password: password,
      );
      final authResponse = response.toEntity();
      // Guardar la sesión localmente
      await saveSession(authResponse);
      return authResponse;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    // Por ahora solo limpia. Tu compañero puede agregar lógica si es necesaria
  }

  @override
  Future<AuthResponse?> getStoredSession() async {
    try {
      final sessionModel = await localDataSource.getStoredSession();
      if (sessionModel == null) return null;
      return sessionModel.toEntity();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> saveSession(AuthResponse response) async {
    // Convertir AuthResponse de vuelta a Model para guardar
    final model = _authResponseToModel(response);
    await localDataSource.saveSession(model);
  }

  @override
  Future<void> clearSession() async {
    await localDataSource.clearSession();
  }

  // Helper para convertir AuthResponse a LoginResponseModel
  LoginResponseModel _authResponseToModel(AuthResponse response) {
    // Nota: Esto es un helper. Podrías mejorar esto en tu implementación
    return LoginResponseModel(
      id: response.user.id,
      username: response.user.username,
      email: response.user.email,
      firstName: response.user.firstName,
      lastName: response.user.lastName,
      image: response.user.image,
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
    );
  }
}
