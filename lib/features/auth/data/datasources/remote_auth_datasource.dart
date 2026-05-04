import 'package:dio/dio.dart';
import '../models/login_response_model.dart';

abstract class RemoteAuthDataSource {
  Future<LoginResponseModel> login({
    required String username,
    required String password,
  });
}

class RemoteAuthDataSourceImpl implements RemoteAuthDataSource {
  final Dio dio;

  RemoteAuthDataSourceImpl(this.dio);

  @override
  Future<LoginResponseModel> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        'https://dummyjson.com/auth/login',
        data: {'username': username, 'password': password},
      );

      return LoginResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw Exception('Usuario o contraseña incorrectos');
      } else if (e.response?.statusCode == 401) {
        throw Exception('No autorizado');
      } else if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Conexión perdida. Verifica tu internet');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('La solicitud tardó demasiado');
      }
      throw Exception('Error en login: ${e.message}');
    } catch (e) {
      throw Exception('Error inesperado: $e');
    }
  }
}
