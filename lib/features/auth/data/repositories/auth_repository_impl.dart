import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/user_model.dart';
import '../services/local_storage_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final LocalStorageService localStorageService;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localStorageService,
  });

  @override
  Future<UserEntity> login(
    String username,
    String password,
  ) async {
    final userModel = await remoteDataSource.login(
      username: username,
      password: password,
    );

    final user = userModel.toEntity();

    await saveSession(user);

    return user;
  }

  @override
  Future<void> saveSession(UserEntity user) async {
    await localStorageService.saveToken(user.token);
  }

  @override
  Future<UserEntity?> getSession() async {
    final token = await localStorageService.getToken();

    if (token == null) return null;

    return UserEntity(
      id: 0,
      username: '',
      email: '',
      token: token,
    );
  }

  @override
  Future<void> logout() async {
    await localStorageService.clearSession();
  }
}