import 'package:flutter/material.dart';

class AddAccount extends StatelessWidget {
  const AddAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => DialogAddAccount(),
        );
      },
      icon: CircleAvatar(
        backgroundColor: Colors.grey[600],
        child: Icon(Icons.add, color: Colors.white),
      ),
      label: Text(
        'Agregar nueva cuenta',
        style: TextStyle(
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
    return AlertDialog(
      title: const Text('Registrar Cuenta Destino'),
      content: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownMenu(
              width: 500,
              label: const Text('Selecciona un Banco'),
              dropdownMenuEntries: dropdownBankEntries,
              inputDecorationTheme: const InputDecorationTheme(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Número de cuenta',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            SizedBox(height: 20),
            DropdownMenu(
              width: 500,
              label: const Text('Selecciona tipo cuenta'),
              dropdownMenuEntries: dropdownAccountEntries,
              inputDecorationTheme: const InputDecorationTheme(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nombre y Apellido',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            SizedBox(height: 20),
            RadioListTile<SingingCharacter>(
              title: const Text('Quetzal'),
              value: SingingCharacter.quetzal,
              groupValue: _currency,
              onChanged: (value) {
                setState(() {
                  _currency = value;
                });
              },
            ),
            RadioListTile<SingingCharacter>(
              title: const Text('Dolar'),
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
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Enviar'),
        ),
      ],
    );
  }
}
