import 'package:flutter/material.dart';
import 'package:proyecto_flutter/core/app_colors.dart';

class MenuTransfer extends StatefulWidget {
  const MenuTransfer({super.key});

  @override
  State<MenuTransfer> createState() => _MenuTransferState();
}

class _MenuTransferState extends State<MenuTransfer> {
  String? _selectedLabel;

  @override
  Widget build(BuildContext context) {
    final options = [
      _TransferOption(label: 'A mis cuentas', icon: Icons.account_balance),
      _TransferOption(
        label: 'A otros bancos',
        icon: Icons.account_balance_outlined,
      ),
      _TransferOption(label: 'A tarjetas', icon: Icons.credit_card),
      _TransferOption(
        label: 'A otros usuarios',
        icon: Icons.people_alt_outlined,
      ),
    ];

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 20,
      runSpacing: 20,
      children: options
          .map(
            (option) => ButtonIconTransfer(
              label: option.label,
              icon: option.icon,
              selected: option.label == _selectedLabel,
              onPressed: () {
                setState(() {
                  _selectedLabel = option.label;
                });
              },
            ),
          )
          .toList(),
    );
  }
}

class _TransferOption {
  const _TransferOption({required this.label, required this.icon});

  final String label;
  final IconData icon;
}

class ButtonIconTransfer extends StatelessWidget {
  const ButtonIconTransfer({
    super.key,
    required this.label,
    required this.icon,
    required this.selected,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        backgroundColor: selected
            ? AppColors.secondaryVariant
            : Colors.grey[600],
        foregroundColor: selected
            ? AppColors.secondaryVariant
            : Colors.grey[600],
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20),
        ),
        // padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
      ),
      onPressed: onPressed,
      label: Text(''),
      icon: IconWhitStyle(label: label, icon: icon, color: Colors.white),
    );
  }
}

class IconWhitStyle extends StatelessWidget {
  const IconWhitStyle({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
  });
  final String label;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 35, color: color),
        const SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 14, color: color)),
      ],
    );
  }
}
