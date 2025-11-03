import 'package:flutter/material.dart';
import 'package:travelmate/widgets/custom_input_field.dart';
import 'package:travelmate/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login() {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      _showMessage('Введіть email та пароль.');
      return;
    }

    if (password.length < 6) {
      _showMessage('Пароль занадто короткий (мінімум 6 символів).');
      return;
    }

    Navigator.pushReplacementNamed(context, '/home');
  }

  void _showMessage(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text), backgroundColor: Colors.redAccent),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TravelMate — Логін')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomInputField(
              controller: emailController,
              hintText: 'Email',
              icon: Icons.email,
            ),
            const SizedBox(height: 12),
            CustomInputField(
              controller: passwordController,
              hintText: 'Пароль',
              icon: Icons.lock,
              obscureText: true,
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: 'Увійти',
              onPressed: _login,
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/register'),
              child: const Text('Ще не маєте акаунта? Зареєструйтесь'),
            ),
          ],
        ),
      ),
    );
  }
}
