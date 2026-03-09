import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/dashboard/presentation/state/dashboard_provider.dart';
import 'features/history/presentation/state/history_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
        ChangeNotifierProvider(create: (_) => HistoryProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}