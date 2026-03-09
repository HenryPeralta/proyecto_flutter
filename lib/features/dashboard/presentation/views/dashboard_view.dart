import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_flutter/features/dashboard/presentation/state/dashboard_provider.dart';
// import 'package:proyecto_flutter/features/dashboard/presentation/widgets/app_baner.dart';
// import 'package:proyecto_flutter/features/dashboard/presentation/widgets/bottom_app_baner.dart';
import 'package:proyecto_flutter/features/dashboard/presentation/widgets/card_client.dart';
//import 'package:proyecto_flutter/features/dashboard/presentation/widgets/wrap_menu.dart';
import 'package:proyecto_flutter/features/dashboard/presentation/widgets/dashboard_header.dart';
import 'package:proyecto_flutter/features/dashboard/presentation/widgets/recent_transactions.dart';
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
          DashboardHeader(
            title: "Dashboard"
          ),
          const SizedBox(height: 10),
          CardClient(),
          const SizedBox(height: 10),
          const RecentTransactions(),
        ],
      ),
      // bottomNavigationBar: BottomAppBanerNavigate(),
    );
  }
}
