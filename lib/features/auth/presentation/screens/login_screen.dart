import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_flutter/l10n/app_localizations.dart';
import '../providers/auth_notifier.dart';
import '../states/auth_state.dart';
import '../widgets/login_header.dart';
import '../widgets/login_form.dart';
import '../widgets/login_button.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    final authState = ref.watch(authNotifierProvider);

    // Escuchar cambios y navegar cuando esté autenticado
    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      next.whenOrNull(
        authenticated: (response) {
          print('✅ Autenticado: ${response.user.email}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.loginSuccess),
              backgroundColor: Colors.green,
            ),
          );
          // Navegar al dashboard sin delay
          Future.microtask(() {
            if (context.mounted) {
              context.go('/dashboard');
            }
          });
        },
        error: (message) {
          print('❌ Error: $message');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.errorMessage(message)),
              backgroundColor: Colors.red,
            ),
          );
        },
      );
    });

    void handleLogin() {
      final username = usernameController.text.trim();
      final password = passwordController.text;

      if (username.isEmpty || password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.completeAllFields),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      ref
          .read(authNotifierProvider.notifier)
          .login(username: username, password: password);
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const LoginHeader(),
              const SizedBox(height: 30),
              LoginForm(
                usernameController: usernameController,
                passwordController: passwordController,
              ),
              const SizedBox(height: 30),
              LoginButton(
                onTap: handleLogin,
                isLoading: authState.maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
