import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {

  final VoidCallback onTap;

  const LoginButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,

      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),

        padding: const EdgeInsets.symmetric(vertical: 16),

        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFFFF5F6D),
              Color(0xFFFFC371),
            ],
          ),

          borderRadius: BorderRadius.circular(30),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10,
              offset: const Offset(0, 5),
            )
          ],
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [

            Text(
              "Sign in",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(width: 10),

            Icon(
              Icons.arrow_forward,
              color: Colors.white,
            )

          ],
        ),
      ),
    );
  }
}