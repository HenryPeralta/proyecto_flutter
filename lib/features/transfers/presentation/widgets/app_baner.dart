import 'package:flutter/material.dart';
import 'package:proyecto_flutter/core/app_colors.dart';

class AppBanerTransferencias extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBanerTransferencias({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      toolbarHeight: 80,
      elevation: 0,
      title: Text(
        'Transferencias',
        style: TextStyle(
          fontSize: 22,
          color: AppColors.letterswhite,
          fontFamily: 'Poppins',
        ),
      ),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
