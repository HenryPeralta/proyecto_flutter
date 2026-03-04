import 'package:flutter/material.dart';
import 'package:proyecto_flutter/core/app_colors.dart';
import 'package:proyecto_flutter/core/assets.dart';

class AppBaner extends StatelessWidget implements PreferredSizeWidget {
  const AppBaner({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      toolbarHeight: 80,
      elevation: 0,
      leading: const Padding(
        padding: EdgeInsets.all(4),
        child: CircleAvatar(backgroundImage: AssetImage(Assets.perfilOne)),
      ),
      title: Text(
        'Hola, Byron Toledo',
        style: TextStyle(
          fontSize: 20,
          color: AppColors.letterswhite,
          fontFamily: 'Poppins',
        ),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () {
            // Acción para cerrar sesión
          },
          icon: Icon(Icons.logout, color: AppColors.letterswhite, size: 35),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
