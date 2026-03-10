import 'package:flutter/material.dart';

class DropAccountTransfer extends StatelessWidget {
  const DropAccountTransfer({super.key});

  List<DropdownMenuEntry<String>> get dropdownMenuEntries => [
    const DropdownMenuEntry(value: '35278485', label: 'Num. Cuenta: 35278485'),
    const DropdownMenuEntry(value: '84739201', label: 'Num. Cuenta: 84739201'),
    const DropdownMenuEntry(
      value: 'Visa: 4782 4567 7896 3456',
      label: 'Visa: **** **** **** 3456',
    ),
    const DropdownMenuEntry(
      value: '4896 1234 8745 0012',
      label: 'Visa:  **** **** **** 0012',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: DropdownMenu(
            width: 500,
            label: const Text('Selecciona una cuenta'),
            dropdownMenuEntries: dropdownMenuEntries,
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
