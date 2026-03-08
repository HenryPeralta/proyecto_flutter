import 'package:flutter/material.dart';
import 'package:proyecto_flutter/core/app_colors.dart';

class BottomAppBanerNavigate extends StatelessWidget {
  const BottomAppBanerNavigate({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: Container(
          height: 50,
          alignment: Alignment.center,
          child: Wrap(
            spacing: 25,
            runSpacing: 25,
            alignment: WrapAlignment.center,
            children: [
              BottomAppBarMenu(label: 'Home', icon: Icons.home),
              BottomAppBarMenu(label: 'Pagar', icon: Icons.payment),
              BottomAppBarMenu(
                label: 'CUIK',
                icon: Icons.qr_code_scanner_outlined,
              ),
              BottomAppBarMenu(label: 'Solicitar', icon: Icons.request_quote),
              BottomAppBarMenu(label: 'Más', icon: Icons.menu),
            ],
          ),
        ),
      );
  }
}

class BottomAppBarMenu extends StatelessWidget {
  const BottomAppBarMenu({super.key, required this.label, required this.icon});
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      label: Text(''),
      icon: IconWithLabelBottonAppBar(label: label, icon: icon),
    );
  }
}

class IconWithLabelBottonAppBar extends StatelessWidget {
  const IconWithLabelBottonAppBar({
    super.key,
    required this.label,
    required this.icon,
  });
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 35, color: AppColors.primary),
        const SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}