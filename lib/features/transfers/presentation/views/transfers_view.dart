import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_flutter/features/dashboard/presentation/widgets/dashboard_header.dart';
import 'package:proyecto_flutter/features/transfers/presentation/widgets/add_account.dart';
import 'package:proyecto_flutter/features/transfers/presentation/widgets/drop_account_destination.dart';
import 'package:proyecto_flutter/features/transfers/presentation/widgets/drop_account_transfer.dart';
import 'package:proyecto_flutter/features/transfers/presentation/widgets/menu_transfer.dart';
import 'package:proyecto_flutter/features/transfers/transfers_dependencies.dart';
import 'package:proyecto_flutter/l10n/app_localizations.dart';

class Transfers extends ConsumerStatefulWidget {
  const Transfers({super.key});

  @override
  ConsumerState<Transfers> createState() => _TransfersState();
}

class _TransfersState extends ConsumerState<Transfers> {
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();
    final success = await ref.read(transfersProvider.notifier).submitTransfer(
          amount: _amountController.text,
          description: _descriptionController.text,
        );
    if (!mounted) return;

    if (!success) {
      final message = ref.read(transfersProvider).errorMessage ??
          'No fue posible registrar la transferencia.';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.red),
      );
      return;
    }

    _amountController.clear();
    _descriptionController.clear();
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.check, color: Colors.white),
            ),
            const SizedBox(height: 14),
            Text(AppLocalizations.of(context)!.transferSuccess),
            const SizedBox(height: 8),
            const Text(
              'El movimiento ya está disponible en el historial.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF666666)),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(AppLocalizations.of(context)!.accept),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final transferState = ref.watch(transfersProvider);

    return Scaffold(
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
              controller: _amountController,
              enabled: !transferState.isSubmitting,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: l10n.amountToTransfer,
                prefixText: 'GTQ ',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            child: TextFormField(
              controller: _descriptionController,
              enabled: !transferState.isSubmitting,
              maxLength: 80,
              decoration: InputDecoration(
                labelText: l10n.description,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 30),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: const Size(150, 60),
              ),
              onPressed: transferState.isSubmitting ? null : _submit,
              icon: transferState.isSubmitting
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.check),
              label: Text(
                transferState.isSubmitting ? 'Procesando...' : l10n.confirm,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
