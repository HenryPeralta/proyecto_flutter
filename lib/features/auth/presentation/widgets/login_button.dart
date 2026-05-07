import 'package:flutter/material.dart';
import 'package:proyecto_flutter/l10n/app_localizations.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isLoading;

  const LoginButton({super.key, required this.onTap, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFFF5F6D), Color(0xFFFFC371)],
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Color(0x26FF6A6A),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading) ...[
              const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 2,
                ),
              ),
              const SizedBox(width: 10),
            ],
            Text(
              isLoading ? l10n.loggingIn : l10n.signIn,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (!isLoading) ...[
              const SizedBox(width: 10),
              const Icon(Icons.arrow_forward, color: Colors.white),
            ],
          ],
        ),
      ),
    );
  }
}
