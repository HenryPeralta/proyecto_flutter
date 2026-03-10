import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {

  final String title;

  const DashboardHeader({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),

      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF6A72FF),
            Color(0xFFFFB86C),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),

      child: Column(
        children: [

          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          )

        ],
      ),
    );
  }
}