import 'package:flutter/material.dart';
import 'package:proyecto_flutter/l10n/app_localizations.dart';
import 'package:proyecto_flutter/features/dashboard/presentation/widgets/dashboard_header.dart';
import 'package:proyecto_flutter/features/transfers/presentation/widgets/add_account.dart';
import 'package:proyecto_flutter/features/transfers/presentation/widgets/drop_account_destination.dart';
import 'package:proyecto_flutter/features/transfers/presentation/widgets/drop_account_transfer.dart';
import 'package:proyecto_flutter/features/transfers/presentation/widgets/menu_transfer.dart';

class Transfers extends StatelessWidget {
  const Transfers({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      // appBar: const AppBanerTransferencias(),
      body: ListView(
        children: [
          DashboardHeader(title: l10n.transfersTitle),
          const SizedBox(height: 20),
          const DropAccountTransfer(),
          const SizedBox(height: 20),
          ListTile(
            title: Text(
              l10n.transferType,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
          ),
          const MenuTransfer(),
          const SizedBox(height: 20),
          ListTile(
            title: Text(
              l10n.destinationAccount,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
          ),
          const DropAccountDestination(),
          const SizedBox(height: 10),
          const ListTile(leading: AddAccount()),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: l10n.amountToTransfer,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: l10n.description,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                minimumSize:
                    WidgetStateProperty.all<Size>(const Size(150, 60)),
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
                          const CircleAvatar(
                            backgroundColor: Colors.green,
                            child: Icon(Icons.check, color: Colors.white),
                          ),
                          ListTile(title: Text(l10n.transferSuccess)),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(l10n.accept),
                      ),
                    ],
                  ),
                );
                // Acción al presionar el botón
              },
              icon: const Icon(Icons.check, color: Colors.white),
              label: Text(
                l10n.confirm,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomAppBanerNavigate(),
    );
  }
}
