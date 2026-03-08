import 'package:flutter/material.dart';
import 'package:proyecto_flutter/features/transfers/presentation/widgets/app_baner.dart';

class Transfers extends StatelessWidget {
  const Transfers({super.key});

  List<DropdownMenuEntry<String>> get dropdownMenuEntries => [
    const DropdownMenuEntry(value: 'Marco Lopez', label: 'Marco Lopez'),
    const DropdownMenuEntry(value: 'Carlos Gomez', label: 'Carlos Gomez'),
    const DropdownMenuEntry(
      value: 'Pamela Rodriguez',
      label: 'Pamela Rodriguez',
    ),
    const DropdownMenuEntry(value: 'Sofia Martinez', label: 'Sofia Martinez'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBanerTransferencias(),
      body: DropdownMenu(dropdownMenuEntries: dropdownMenuEntries),
      // bottomNavigationBar: BottomAppBanerNavigate(),
    );
  }
}
