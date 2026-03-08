import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../models/menu_item.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Historial"),
      ),

      drawer: const AppDrawer(
        currentPage: MenuItem.history
      ),

      body: const Center(
        child: Text(
          "Historial de movimientos",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}