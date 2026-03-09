import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_flutter/features/dashboard/presentation/state/dashboard_provider.dart';
// import 'package:proyecto_flutter/features/dashboard/presentation/widgets/app_baner.dart';
// import 'package:proyecto_flutter/features/dashboard/presentation/widgets/bottom_app_baner.dart';
import 'package:proyecto_flutter/features/dashboard/presentation/widgets/card_client.dart';
import 'package:proyecto_flutter/features/dashboard/presentation/widgets/wrap_menu.dart';
// import 'package:proyecto_flutter/core/assets.dart';

class DashboardView extends StatefulWidget {
  final String userName;
  final String userEmail;

  const DashboardView({
    super.key,
    required this.userName,
    required this.userEmail,
  });

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  void initState() {
    super.initState();
    // Cargar datos del usuario
    context.read<DashboardProvider>().userPerfil(
      widget.userName,
      widget.userEmail,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 106, 114, 255),
                  Color(0xFFFFB86C),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Center(
              child: Text(
                'Dashboard',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          CardClient(),
          WrapMenu()
        ],
      ),
      // bottomNavigationBar: BottomAppBanerNavigate(),
    );
  }
}
