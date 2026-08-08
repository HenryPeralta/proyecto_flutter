import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../navigation/app_router.dart';

class NotificationNavigation {
  NotificationNavigation._();

  static String? _pendingDestination;
  static final ValueNotifier<int> historyRequests = ValueNotifier<int>(0);

  static void handleData(Map<String, dynamic> data) {
    _pendingDestination = _destinationFor(data['route'] as String?);
    if (_pendingDestination!.contains('section=history')) {
      historyRequests.value++;
    }
    _navigateWhenReady();
  }

  static void handlePayload(String? payload) {
    if (payload == null || payload.isEmpty) return;
    try {
      final decoded = jsonDecode(payload);
      if (decoded is Map<String, dynamic>) {
        handleData(decoded);
        return;
      }
    } on FormatException {
      // Compatibilidad con payloads antiguos que contenían solo la ruta.
    }
    handleData({'route': payload});
  }

  static String? consumePendingDestination() {
    final destination = _pendingDestination;
    _pendingDestination = null;
    return destination;
  }

  static void _navigateWhenReady() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final context = rootNavigatorKey.currentContext;
      if (context == null) return;
      final router = GoRouter.of(context);
      final currentPath = router.routeInformationProvider.value.uri.path;
      if (currentPath == Routes.login) {
        // Durante un arranque desde terminated, AuthNotifier todavía está
        // restaurando la sesión. LoginScreen consumirá el destino pendiente
        // cuando el estado cambie a authenticated, evitando que /dashboard lo
        // sobrescriba después.
        return;
      }
      if (FirebaseAuth.instance.currentUser == null) {
        router.go(Routes.login);
        return;
      }
      final destination = consumePendingDestination();
      if (destination == null) return;
      router.go(destination);
    });
  }

  static String _destinationFor(String? route) {
    return switch (route) {
      '/dashboard' || 'dashboard' => Routes.dashboard,
      '/history' ||
      'history' ||
      '/transactions' ||
      'transactions' =>
        '${Routes.dashboard}?section=history',
      _ => '${Routes.dashboard}?section=history',
    };
  }
}
