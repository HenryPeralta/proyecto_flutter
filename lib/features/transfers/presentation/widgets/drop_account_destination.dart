import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_flutter/features/transfers/presentation/state/transfers_provider.dart';

class DropAccountDestination extends ConsumerWidget {
  const DropAccountDestination({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(transfersProvider);
    final List<DropdownMenuEntry<String>> dropdownMenuEntries = state
        .destinationAccounts
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
                .selectDestinationAccount(value),
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
