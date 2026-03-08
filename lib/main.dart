import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_flutter/core/app_colors.dart';
import 'package:proyecto_flutter/features/dashboard/presentation/state/dashboard_provider.dart';
import 'package:proyecto_flutter/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:proyecto_flutter/features/history/presentation/state/history_provider.dart';
import 'package:proyecto_flutter/features/history/presentation/views/history_trans_view.dart';
import 'package:proyecto_flutter/features/transfers/presentation/views/transfers_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Bank Wallet',
      initialRoute: '/',
      routes: {
        '/': (context) => ChangeNotifierProvider<DashboardProvider>(
          create: (_) => DashboardProvider(),
          child: DashboardView(),
        ),
        '/transfers': (context) => Transfers(),
        '/history': (context) => ChangeNotifierProvider<HistoryProvider>(
          create: (_) => HistoryProvider(),
          child: HistoryTransView(),
        ),
      },
      theme: ThemeData(primaryColor: AppColors.primary),
      debugShowCheckedModeBanner: false,
    );
  }
}
// https://www.figma.com/design/cERCSTNzpdYu2icip3lNeq/App-de-Finan%C3%A7as--Community-?node-id=3-376&p=f&t=0R19GnA1qWPfYAFg-0
// https://www.figma.com/design/Ybnc7SUq1L3dXzTrHgzPgl/iBank---Banking---E-Money-Management-App-%7C-FinPay-%7C-Digital-%7C-Finance-Mobile-Banking-App-Ui-Kit--Community-?node-id=386-2465&t=GThoEw4oyvF5ZLED-0