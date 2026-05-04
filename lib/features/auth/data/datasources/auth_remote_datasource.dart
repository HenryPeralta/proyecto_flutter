import 'package:dio/dio.dart';
import '../models/user_model.dart';

class AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSource(this.dio);

  Future<UserModel> login({
    required String username,
    required String password,
  }) async {
    final response = await dio.post(
      'https://dummyjson.com/auth/login',
      data: {
        'username': username,
        'password': password,
      },
    );

    return UserModel.fromJson(response.data);
  }
}