import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_flutter/l10n/app_localizations.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/providers/auth_notifier.dart';
import '../../features/dashboard/presentation/views/dashboard_layout.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

// Crear el router una sola vez, sin depender de authState
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.login,
    routes: [
      GoRoute(
        name: Routes.login,
        path: Routes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: Routes.history,
        redirect: (context, state) =>
            '${Routes.dashboard}?section=history',
      ),
      GoRoute(
        path: Routes.transactions,
        redirect: (context, state) =>
            '${Routes.dashboard}?section=history',
      ),
      GoRoute(
        name: Routes.dashboard,
        path: Routes.dashboard,
        builder: (context, state) {
          final section = state.uri.queryParameters['section'];
          return _DashboardSimplePage(
            initialPage:
                section == 'history' ? MenuItem.history : MenuItem.dashboard,
          );
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.error)),
      body: Center(
        child: Text(
            AppLocalizations.of(context)!.errorMessage(state.error.toString())),
      ),
    ),
  );
});

abstract class Routes {
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String history = '/history';
  static const String transactions = '/transactions';
}

class _DashboardSimplePage extends ConsumerWidget {
  const _DashboardSimplePage({required this.initialPage});

  final MenuItem initialPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);

    return authState.maybeWhen(
      authenticated: (response) {
        // Definir el callback aquí donde tenemos ref
        void handleLogout() {
          ref.read(authNotifierProvider.notifier).logout();
          // El widget se reconstruirá automáticamente cuando el estado cambie
        }

        return DashboardLayout(
          initialPage: initialPage,
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
        return Scaffold(
          body: Center(
            child: Text(AppLocalizations.of(context)!.errorMessage(message)),
          ),
        );
      },
      orElse: () {
        return const LoginScreen();
      },
    );
  }
}
