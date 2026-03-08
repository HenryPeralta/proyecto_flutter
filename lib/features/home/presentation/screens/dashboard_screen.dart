import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../models/menu_item.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard")
      ),

      drawer: const AppDrawer(
        currentPage: MenuItem.dashboard,
      ),

      body: const Center(
        child: Text(
          "Bienvenido al Dashboard",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}