import 'package:flutter/material.dart';
import 'package:proyecto_flutter/core/assets.dart';
import 'package:proyecto_flutter/l10n/app_localizations.dart';
import 'package:proyecto_flutter/features/dashboard/presentation/widgets/menu_icon.dart';

class WrapMenu extends StatelessWidget {
  const WrapMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.start,
      children: [
        /*const ButtomMenu(
          asset: Assets.wallet,
          label: 'Cuentas',
          route: '/account',
        ),*/
        ButtomMenu(
          asset: Assets.creditCard,
          label: l10n.creditCards,
          route: '/transfers',
        ),
        ButtomMenu(
          asset: Assets.transfer,
          label: l10n.transfersTitle,
          route: '/transfers',
        ),
        ButtomMenu(
          asset: Assets.reportTrans,
          label: l10n.reportsAndMovements,
          route: '/history',
        ),
        /*const ButtomMenu(
          asset: Assets.prestamo,
          label: 'Préstamos',
          route: '/loans',
        ),*/
      ],
    );
  }
}

class ButtomMenu extends StatelessWidget {
  final String asset;
  final String label;
  final String route;
  const ButtomMenu({
    super.key,
    required this.asset,
    required this.label,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      label: Text(''),
      icon: IconWithLabel(asset, label),
    );
  }
}
