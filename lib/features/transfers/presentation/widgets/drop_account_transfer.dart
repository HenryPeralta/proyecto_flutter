import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_flutter/features/transfers/presentation/state/transfers_provider.dart';

class DropAccountTransfer extends ConsumerWidget {
  const DropAccountTransfer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(transfersProvider);
    final List<DropdownMenuEntry<String>> dropdownMenuEntries = state
        .sourceAccounts
        .map(
          (account) => DropdownMenuEntry(
            value: account.value,
            label: account.label,
          ),
        )
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: DropdownMenu<String>(
            width: 500,
            label: const Text('Selecciona una cuenta'),
            dropdownMenuEntries: dropdownMenuEntries,
            onSelected: (value) => ref
                .read(transfersProvider.notifier)
                .selectSourceAccount(value),
            inputDecorationTheme: const InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
