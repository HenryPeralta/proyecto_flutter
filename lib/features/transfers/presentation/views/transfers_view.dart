import 'package:flutter/material.dart';
import 'package:proyecto_flutter/features/dashboard/presentation/widgets/dashboard_header.dart';
import 'package:proyecto_flutter/features/transfers/presentation/widgets/add_account.dart';
import 'package:proyecto_flutter/features/transfers/presentation/widgets/drop_account_destination.dart';
import 'package:proyecto_flutter/features/transfers/presentation/widgets/drop_account_transfer.dart';
import 'package:proyecto_flutter/features/transfers/presentation/widgets/menu_transfer.dart';

class Transfers extends StatelessWidget {
  const Transfers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const AppBanerTransferencias(),
      body: ListView(
        children: [
          DashboardHeader(title: "Transferencias"),
          const SizedBox(height: 20),
          DropAccountTransfer(),

          const SizedBox(height: 20),

          ListTile(
            title: Text(
              'Tipo de transferencia',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
          ),

          MenuTransfer(),
          const SizedBox(height: 20),

          ListTile(
            title: Text(
              'Cuenta Destino',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
          ),

          DropAccountDestination(),

          const SizedBox(height: 10),

          ListTile(leading: AddAccount()),

          const SizedBox(height: 20),

          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 25),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Monto a Transferir',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 25, vertical: 30),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Descripcion',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 25),
            child: ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                minimumSize: WidgetStateProperty.all<Size>(Size(150, 60)),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: Form(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.green,
                            child: Icon(Icons.check, color: Colors.white),
                          ),
                          ListTile(title: Text('Transferencia Exitosa!')),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Aceptar'),
                      ),
                    ],
                  ),
                );
                // Acción al presionar el botón
              },
              icon: const Icon(Icons.check, color: Colors.white),
              label: const Text(
                'Confirmar',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomAppBanerNavigate(),
    );
  }
}
