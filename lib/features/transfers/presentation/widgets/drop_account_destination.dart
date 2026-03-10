import 'package:flutter/material.dart';

class DropAccountDestination extends StatelessWidget {
  const DropAccountDestination({super.key});
  List<DropdownMenuEntry<String>> get dropdownMenuEntries => [
    const DropdownMenuEntry(
      value: '35278485',
      label: 'Carlos Lopez - 35278485 - BI',
    ),
    const DropdownMenuEntry(
      value: '84739201',
      label: 'Maria Reyes -  84739201 - BAM',
    ),
    const DropdownMenuEntry(
      value: 'Visa: 4782 4567 7896 3456',
      label: 'Karla Hernandez - 578556881 - BANCO PROMERICA',
    ),
    const DropdownMenuEntry(
      value: '4896 1234 8745 0012',
      label: 'Cristina Medina - 85525885 - BI',
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
