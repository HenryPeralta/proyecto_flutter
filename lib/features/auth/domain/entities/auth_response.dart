import 'package:freezed_annotation/freezed_annotation.dart';
import 'auth_user.dart';

part 'auth_response.freezed.dart';

@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    required AuthUser user,
    required String accessToken,
    required String refreshToken,
  }) = _AuthResponse;
}
