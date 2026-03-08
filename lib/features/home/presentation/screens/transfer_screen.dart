import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../models/menu_item.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Transferencias"),
      ),

      drawer: const AppDrawer(
        currentPage: MenuItem.transfer
      ),

      body: const Center(
        child: Text(
          "Pantalla de Transferencias",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}