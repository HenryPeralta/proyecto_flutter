import 'package:flutter/material.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          const Text(
            "Últimos movimientos",
            style: TextStyle(
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
              children: const [

                ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text("Amazon"),
                  subtitle: Text("Compra online"),
                  trailing: Text("-GTQ 230"),
                ),

                Divider(height: 1),

                ListTile(
                  leading: Icon(Icons.local_taxi),
                  title: Text("Uber"),
                  subtitle: Text("Transporte"),
                  trailing: Text("-GTQ 45"),
                ),

                Divider(height: 1),

                ListTile(
                  leading: Icon(Icons.attach_money),
                  title: Text("Salario"),
                  subtitle: Text("Ingreso mensual"),
                  trailing: Text("+GTQ 3500"),
                ),

                Divider(height: 1),

                ListTile(
                  leading: Icon(Icons.movie),
                  title: Text("Netflix"),
                  subtitle: Text("Suscripción"),
                  trailing: Text("-GTQ 85"),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}