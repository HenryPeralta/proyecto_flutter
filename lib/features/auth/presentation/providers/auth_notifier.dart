import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../states/auth_state.dart';
import 'auth_providers.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final Ref ref;

  AuthNotifier(this.ref) : super(const AuthState.initial()) {
    _checkStoredSession();
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    state = const AuthState.loading();
    try {
      final loginUseCase = ref.read(loginUseCaseProvider);
      final response = await loginUseCase.call(
        username: username,
        password: password,
      );
      state = AuthState.authenticated(response);
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> logout() async {
    try {
      final logoutUseCase = ref.read(logoutUseCaseProvider);
      await logoutUseCase.call();
      state = const AuthState.unauthenticated();
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> _checkStoredSession() async {
    try {
      final getStoredSessionUseCase = ref.read(getStoredSessionUseCaseProvider);
      final session = await getStoredSessionUseCase.call();
      if (session != null) {
        state = AuthState.authenticated(session);
      } else {
        state = const AuthState.unauthenticated();
      }
    } catch (e) {
      state = const AuthState.unauthenticated();
    }
  }
}

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(ref),
);
