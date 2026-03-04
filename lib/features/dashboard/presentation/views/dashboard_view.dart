import 'package:flutter/material.dart';
import 'package:proyecto_flutter/core/assets.dart';
import 'package:proyecto_flutter/features/dashboard/presentation/widgets/app_baner.dart';
import 'package:proyecto_flutter/features/dashboard/presentation/widgets/card_client.dart';
import 'package:proyecto_flutter/features/dashboard/presentation/widgets/menu_icon.dart';
// import 'package:proyecto_flutter/core/assets.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBaner(),
      body: Column(
        children: [
          SizedBox(height: 20),
          CardClient(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                IconWithLabel(Assets.wallet, 'Cuentas y Tarjetas'),
                IconWithLabel(Assets.transfer, 'Transferencias'),
                IconWithLabel(Assets.reportTrans, 'Reporte de Transacciones'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
