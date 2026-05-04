import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/login_response_model.dart';

abstract class LocalAuthDataSource {
  Future<void> saveSession(LoginResponseModel response);
  Future<LoginResponseModel?> getStoredSession();
  Future<void> clearSession();
}

class LocalAuthDataSourceImpl implements LocalAuthDataSource {
  final SharedPreferences sharedPreferences;

  static const String _tokenKey = 'auth_token';
  static const String _sessionKey = 'auth_session';

  LocalAuthDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> saveSession(LoginResponseModel response) async {
    await sharedPreferences.setString(
      _sessionKey,
      jsonEncode(response.toJson()),
    );
    await sharedPreferences.setString(_tokenKey, response.accessToken);
  }

  @override
  Future<LoginResponseModel?> getStoredSession() async {
    try {
      final sessionJson = sharedPreferences.getString(_sessionKey);
      if (sessionJson == null) return null;

      final json = jsonDecode(sessionJson) as Map<String, dynamic>;
      return LoginResponseModel.fromJson(json);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> clearSession() async {
    await sharedPreferences.remove(_sessionKey);
    await sharedPreferences.remove(_tokenKey);
  }
}
