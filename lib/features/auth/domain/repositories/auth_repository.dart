import '../entities/auth_response.dart';

abstract class AuthRepository {
  /// Login con username y password
  Future<AuthResponse> login({
    required String username,
    required String password,
  });

  /// Logout
  Future<void> logout();

  /// Verificar si existe sesión activa
  Future<AuthResponse?> getStoredSession();

  /// Guardar sesión localmente
  Future<void> saveSession(AuthResponse response);

  /// Limpiar sesión
  Future<void> clearSession();
}
