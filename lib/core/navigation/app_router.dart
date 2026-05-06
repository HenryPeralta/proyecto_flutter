import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/providers/auth_notifier.dart';
import '../../features/dashboard/presentation/views/dashboard_layout.dart';

// Crear el router una sola vez, sin depender de authState
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: Routes.login,
    routes: [
      GoRoute(
        name: Routes.login,
        path: Routes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: Routes.dashboard,
        path: Routes.dashboard,
        builder: (context, state) {
          // Crear un widget simple sin Consumer para evitar loops
          return const _DashboardSimplePage();
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(
        child: Text('Error: ${state.error}'),
      ),
    ),
  );
});

abstract class Routes {
  static const String login = '/login';
  static const String dashboard = '/dashboard';
}

class _DashboardSimplePage extends ConsumerWidget {
  const _DashboardSimplePage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('🏠 _DashboardSimplePage build()');
    final authState = ref.watch(authNotifierProvider);

    return authState.maybeWhen(
      authenticated: (response) {
        print('✅ Dashboard - Autenticado: ${response.user.email}');

        // Definir el callback aquí donde tenemos ref
        void handleLogout() {
          print('🚪 Logout');
          ref.read(authNotifierProvider.notifier).logout();
          // El widget se reconstruirá automáticamente cuando el estado cambie
        }

        return DashboardLayout(
          userName: '${response.user.firstName} ${response.user.lastName}',
          userEmail: response.user.email,
          onLogout: handleLogout,
        );
      },
      loading: () {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
      error: (message) {
        print('❌ Dashboard Error: $message');
        return Scaffold(
          body: Center(child: Text('Error: $message')),
        );
      },
      orElse: () {
        print('🔄 Dashboard - No autenticado');
        return const LoginScreen();
      },
    );
  }
}
