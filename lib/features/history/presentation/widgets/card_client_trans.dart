import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_flutter/core/assets.dart';
import 'package:proyecto_flutter/features/history/presentation/state/history_provider.dart';

class CardClientTrans extends ConsumerWidget {
  const CardClientTrans({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = ref.watch(historyProvider);
    final nameTitle = history.nameTitle;
    final cardTitle = history.cardTitle;
    final accountNumberTitle = history.accountNumberTitle;
    final balanceTitle = history.balanceTitle;
    final monedaTitle = history.monedaTitle;
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
