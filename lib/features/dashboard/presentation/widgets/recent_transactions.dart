import 'package:flutter/material.dart';
import 'package:proyecto_flutter/l10n/app_localizations.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.recentTransactions,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.shopping_cart),
                  title: const Text("Amazon"),
                  subtitle: Text(l10n.onlinePurchase),
                  trailing: const Text("-GTQ 230"),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.local_taxi),
                  title: const Text("Uber"),
                  subtitle: Text(l10n.transportation),
                  trailing: const Text("-GTQ 45"),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.attach_money),
                  title: const Text("Salario"),
                  subtitle: Text(l10n.monthlySalary),
                  trailing: const Text("+GTQ 3500"),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.movie),
                  title: const Text("Netflix"),
                  subtitle: Text(l10n.subscription),
                  trailing: const Text("-GTQ 85"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
