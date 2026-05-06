import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

// ============ Validadores Formz ============
enum EmailValidationError { invalid }

enum PasswordValidationError { invalid, tooShort }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) return null; // Campo vacío es válido en form puro

    // Validar formato de email
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return EmailValidationError.invalid;
    }
    return null;
  }
}

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) return null; // Campo vacío es válido en form puro

    if (value.length < 6) {
      return PasswordValidationError.tooShort;
    }
    return null;
  }
}

class Username extends FormzInput<String, PasswordValidationError> {
  const Username.pure() : super.pure('');
  const Username.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) return null;

    if (value.length < 3) {
      return PasswordValidationError.tooShort;
    }
    return null;
  }
}

// ============ Validation State ============
class FormState {
  final Email email;
  final Username username;
  final Password password;
  final bool isValid;

  FormState({
    Email? email,
    Username? username,
    Password? password,
    this.isValid = false,
  })  : email = email ?? const Email.pure(),
        username = username ?? const Username.pure(),
        password = password ?? const Password.pure() {
    // Calcular isValid aquí si es necesario
  }

  FormState copyWith({
    Email? email,
    Username? username,
    Password? password,
  }) {
    final newEmail = email ?? this.email;
    final newUsername = username ?? this.username;
    final newPassword = password ?? this.password;

    return FormState(
      email: newEmail,
      username: newUsername,
      password: newPassword,
      isValid: Formz.validate([newEmail, newUsername, newPassword]),
    );
  }
}

final usernameProvider = StateProvider<String>((ref) => '');
final passwordProvider = StateProvider<String>((ref) => '');

final emailProvider = StateProvider<String>((ref) => '');
