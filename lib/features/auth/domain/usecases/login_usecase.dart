import '../entities/auth_response.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<AuthResponse> call({
    required String username,
    required String password,
  }) async {
    final response = await repository.login(
      username: username,
      password: password,
    );

    // Guardar sesión después del login exitoso
    await repository.saveSession(response);

    return response;
  }
}
