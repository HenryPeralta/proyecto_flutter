import 'package:flutter/material.dart';

class IconWithLabel extends StatelessWidget {
  final String asset;
  final String label;

  const IconWithLabel(this.asset, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(asset, height: 65, width: 65, fit: BoxFit.cover),
        const SizedBox(height: 20),
        // límite de ancho para forzar el salto de línea
        SizedBox(
          width: 100, // o cualquier ancho que necesites
          child: Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 2, // opcional: máximo dos líneas
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
