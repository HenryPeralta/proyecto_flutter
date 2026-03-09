import 'package:flutter/material.dart';
import '../widgets/login_header.dart';
import '../widgets/login_form.dart';
import '../widgets/login_button.dart';
import '../../../dashboard/presentation/views/dashboard_layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Mapa de usuarios: {usuario: {nombre, email}}
  final Map<String, Map<String, String>> users = {
    'admin': {'name': 'Admin', 'email': 'admin@email.com'},
    'henry': {'name': 'Henry Peralta', 'email': 'henry.peralta'},
    'byron': {'name': 'Byron Toledo', 'email': 'byron.toledo'},
  };

  void login() {

    String username = usernameController.text.trim().toLowerCase();
    String password = passwordController.text;

    if (users.containsKey(username) && password == "12345") {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login correcto ✅"),
        ),
      );

      String userName = users[username]!['name']!;
      String userEmail = users[username]!['email']!;

      /// IR AL DASHBOARD
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardLayout(
            userName: userName,
            userEmail: userEmail,
          ),
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