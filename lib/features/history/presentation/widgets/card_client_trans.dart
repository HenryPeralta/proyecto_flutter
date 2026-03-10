import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_flutter/core/assets.dart';
import 'package:proyecto_flutter/features/history/presentation/state/history_provider.dart';

class CardClientTrans extends StatelessWidget {
  const CardClientTrans({super.key});

  @override
  Widget build(BuildContext context) {
    final nameTitle = context.watch<HistoryProvider>().nameTitle;
    final cardTitle = context.watch<HistoryProvider>().cardTitle;
    final accountNumberTitle = context
        .watch<HistoryProvider>()
        .accountNumberTitle;
    final balanceTitle = context.watch<HistoryProvider>().balanceTitle;
    final monedaTitle = context.watch<HistoryProvider>().monedaTitle;
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Image.asset(
          cardTitle == 'Visa' ? Assets.cardVisa : Assets.cardMastercard,
          height: 321,
          width: 527,
          fit: BoxFit.cover,
        ),
        Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nameTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Poppins',
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    cardTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    accountNumberTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    '$monedaTitle $balanceTitle',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
