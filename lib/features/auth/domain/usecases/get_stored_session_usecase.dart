import '../entities/auth_response.dart';
import '../repositories/auth_repository.dart';

class GetStoredSessionUseCase {
  final AuthRepository repository;

  GetStoredSessionUseCase(this.repository);

  Future<AuthResponse?> call() async {
    return await repository.getStoredSession();
  }
}
