import 'package:flutter/material.dart';
import '../widgets/login_header.dart';
import '../widgets/login_form.dart';
import '../widgets/login_button.dart';
import '../../../home/presentation/screens/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() {

    String username = usernameController.text;
    String password = passwordController.text;

    if (username == "admin" && password == "12345") {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login correcto ✅"),
        ),
      );

      /// IR AL DASHBOARD
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        ),
      );

    } else {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Usuario o contraseña incorrectos ❌"),
        ),
      );

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              const LoginHeader(),

              const SizedBox(height: 30),

              LoginForm(
                usernameController: usernameController,
                passwordController: passwordController,
              ),

              const SizedBox(height: 30),

              LoginButton(
                onTap: login,
              ),

              const SizedBox(height: 40),

            ],
          ),
        ),
      ),
    );
  }
}