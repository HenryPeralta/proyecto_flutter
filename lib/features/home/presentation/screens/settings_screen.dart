import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../models/menu_item.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Configuración"),
      ),

      drawer: const AppDrawer(
        currentPage: MenuItem.settings
      ),

      body: const Center(
        child: Text(
          "Configuraciones de la app",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}