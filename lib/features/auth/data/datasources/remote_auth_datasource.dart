import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/login_response_model.dart';

abstract class RemoteAuthDataSource {
  Future<LoginResponseModel> login({
    required String username,
    required String password,
  });
}

class RemoteAuthDataSourceImpl implements RemoteAuthDataSource {
  RemoteAuthDataSourceImpl({
    required this.firebaseAuth,
    required this.firestore,
  });

  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  @override
  Future<LoginResponseModel> login({
    required String username,
    required String password,
  }) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: username.trim(),
        password: password,
      );
      return await _toModel(credential.user!);
    } on FirebaseAuthException catch (error) {
      throw Exception(_messageFor(error.code));
    }
  }

  Future<LoginResponseModel?> currentSession() async {
    final user = firebaseAuth.currentUser;
    return user == null ? null : _toModel(user);
  }

  Future<void> logout() => firebaseAuth.signOut();

  Future<LoginResponseModel> _toModel(User user) async {
    final displayName = (user.displayName ?? '').trim();
    final names =
        displayName.isEmpty ? <String>[] : displayName.split(RegExp(r'\s+'));
    Map<String, dynamic> profile = const {};
    try {
      profile =
          (await firestore.collection('users').doc(user.uid).get()).data() ??
              const {};
    } on FirebaseException {
      // El perfil es complementario; Auth sigue siendo la fuente de la sesión.
    }

    final email = user.email ?? '';
    final emailAlias = email.contains('@') ? email.split('@').first : email;
    final firstName = (profile['firstName'] as String?)?.trim();
    final lastName = (profile['lastName'] as String?)?.trim();
    return LoginResponseModel(
      id: user.uid.hashCode,
      username: (profile['username'] as String?)?.trim().isNotEmpty == true
          ? (profile['username'] as String).trim()
          : emailAlias,
      email: email,
      firstName: firstName?.isNotEmpty == true
          ? firstName!
          : (names.isNotEmpty ? names.first : emailAlias),
      lastName: lastName?.isNotEmpty == true
          ? lastName!
          : (names.length > 1 ? names.sublist(1).join(' ') : ''),
      image: (profile['photoUrl'] as String?) ?? user.photoURL,
      accessToken: '',
      refreshToken: '',
    );
  }

  String _messageFor(String code) => switch (code) {
        'invalid-email' => 'El correo electrónico no es válido',
        'invalid-credential' ||
        'user-not-found' ||
        'wrong-password' =>
          'Correo o contraseña incorrectos',
        'user-disabled' => 'Esta cuenta está deshabilitada',
        'too-many-requests' => 'Demasiados intentos. Intenta más tarde',
        'network-request-failed' => 'Verifica tu conexión a internet',
        _ => 'No fue posible iniciar sesión',
      };
}
