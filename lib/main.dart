import 'package:flutter/material.dart';
import 'package:proyecto_flutter/core/app_colors.dart';
import 'package:proyecto_flutter/features/dashboard/presentation/views/dashboard_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Bank Wallet',
      theme: ThemeData(primaryColor: AppColors.primary),
      debugShowCheckedModeBanner: false,
      home: DashboardView(),
    );
  }
}
// https://www.figma.com/design/cERCSTNzpdYu2icip3lNeq/App-de-Finan%C3%A7as--Community-?node-id=3-376&p=f&t=0R19GnA1qWPfYAFg-0
// https://www.figma.com/design/Ybnc7SUq1L3dXzTrHgzPgl/iBank---Banking---E-Money-Management-App-%7C-FinPay-%7C-Digital-%7C-Finance-Mobile-Banking-App-Ui-Kit--Community-?node-id=386-2465&t=GThoEw4oyvF5ZLED-0