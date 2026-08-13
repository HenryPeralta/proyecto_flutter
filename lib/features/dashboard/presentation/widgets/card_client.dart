import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_flutter/core/assets.dart';
import 'package:proyecto_flutter/features/dashboard/presentation/state/dashboard_provider.dart';

class CardClient extends ConsumerWidget {
  const CardClient({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboard = ref.watch(dashboardProvider);
    final width = MediaQuery.sizeOf(context).width;
    final cardWidth = (width - 32).clamp(280.0, 527.0).toDouble();

    return Center(
      child: SizedBox(
        width: cardWidth,
        child: AspectRatio(
          aspectRatio: 527 / 321,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                dashboard.cardTitle == 'Visa'
                    ? Assets.cardVisa
                    : Assets.cardMastercard,
                fit: BoxFit.cover,
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  final scale = (constraints.maxWidth / 527).clamp(0.50, 1.0);
                  final horizontalPadding = 36 * scale;
                  final verticalPadding = 24 * scale;
                  final detailSize = (18 * scale).clamp(11.0, 18.0);
                  final gap = (12 * scale).clamp(5.0, 12.0);

                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                      vertical: verticalPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dashboard.nameTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: (26 * scale).clamp(15.0, 26.0),
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const Spacer(),
                        Text(
                          dashboard.cardTitle,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: detailSize,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        SizedBox(height: gap),
                        Text(
                          dashboard.accountNumberTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: detailSize,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        SizedBox(height: gap),
                        Text(
                          '${dashboard.monedaTitle} ${dashboard.balanceTitle}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: (24 * scale).clamp(14.0, 24.0),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
