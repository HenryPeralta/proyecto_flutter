import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_flutter/features/dashboard/presentation/state/dashboard_provider.dart';
import 'package:proyecto_flutter/features/dashboard/presentation/widgets/app_baner.dart';
import 'package:proyecto_flutter/features/dashboard/presentation/widgets/bottom_app_baner.dart';
import 'package:proyecto_flutter/features/dashboard/presentation/widgets/card_client.dart';
import 'package:proyecto_flutter/features/dashboard/presentation/widgets/wrap_menu.dart';
// import 'package:proyecto_flutter/core/assets.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<DashboardProvider>().userPerfil(
      // 'Henry Peralta',
      // 'henry.peralta',
      'Byron Toledo',
      'byron.toledo',
    );
    return Scaffold(
      appBar: const AppBaner(),
      body: Column(children: [SizedBox(height: 20), CardClient(), WrapMenu()]),
      bottomNavigationBar: BottomAppBanerNavigate(),
    );
  }
}
