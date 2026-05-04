import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/auth_user.dart';
import '../../domain/entities/auth_response.dart';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

@freezed
class LoginResponseModel with _$LoginResponseModel {
  const factory LoginResponseModel({
    required int id,
    required String username,
    required String email,
    required String firstName,
    required String lastName,
    required String accessToken,
    required String refreshToken,
    String? image,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  const LoginResponseModel._();

  AuthResponse toEntity() {
    final user = AuthUser(
      id: id,
      username: username,
      email: email,
      firstName: firstName,
      lastName: lastName,
      image: image,
    );

    return AuthResponse(
      user: user,
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
