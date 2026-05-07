import 'package:flutter/material.dart';
import 'package:proyecto_flutter/l10n/app_localizations.dart';

class AddAccount extends StatelessWidget {
  const AddAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return TextButton.icon(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => DialogAddAccount(),
        );
      },
      icon: CircleAvatar(
        backgroundColor: Colors.grey[600],
        child: const Icon(Icons.add, color: Colors.white),
      ),
      label: Text(
        l10n.addNewAccount,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

enum SingingCharacter { quetzal, dolar }

class DialogAddAccount extends StatefulWidget {
  const DialogAddAccount({super.key});

  @override
  State<DialogAddAccount> createState() => _DialogAddAccountState();
}

class _DialogAddAccountState extends State<DialogAddAccount> {
  SingingCharacter? _currency = SingingCharacter.quetzal;

  List<DropdownMenuEntry<String>> get dropdownBankEntries => const [
        DropdownMenuEntry(value: '1', label: 'BANCO BAM'),
        DropdownMenuEntry(value: '2', label: 'BANCO INDUSTRIAL'),
        DropdownMenuEntry(value: '3', label: 'BANCO G&T'),
        DropdownMenuEntry(value: '4', label: 'BANCO PROMERICA'),
      ];

  List<DropdownMenuEntry<String>> get dropdownAccountEntries => const [
        DropdownMenuEntry(value: '1', label: 'Monetario'),
        DropdownMenuEntry(value: '2', label: 'Ahorro'),
      ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(l10n.registerDestinationAccount),
      content: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownMenu(
              width: 500,
              label: Text(l10n.selectBank),
              dropdownMenuEntries: dropdownBankEntries,
              inputDecorationTheme: const InputDecorationTheme(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: l10n.accountNumber,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            DropdownMenu(
              width: 500,
              label: Text(l10n.selectAccountType),
              dropdownMenuEntries: dropdownAccountEntries,
              inputDecorationTheme: const InputDecorationTheme(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: l10n.fullName,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            RadioListTile<SingingCharacter>(
              title: Text(l10n.quetzal),
              value: SingingCharacter.quetzal,
              groupValue: _currency,
              onChanged: (value) {
                setState(() {
                  _currency = value;
                });
              },
            ),
            RadioListTile<SingingCharacter>(
              title: Text(l10n.dollar),
              value: SingingCharacter.dolar,
              groupValue: _currency,
              onChanged: (value) {
                setState(() {
                  _currency = value;
                });
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.cancel),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(l10n.submit),
        ),
      ],
    );
  }
}
