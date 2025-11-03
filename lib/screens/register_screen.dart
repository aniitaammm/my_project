import 'package:flutter/material.dart';
import 'package:travelmate/widgets/custom_input_field.dart';
import 'package:travelmate/widgets/custom_button.dart';

class RegisterScreen extends StatefulWidget {
  final void Function(String name) onRegister;

  const RegisterScreen({super.key, required this.onRegister});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void _register() {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _showMessage('Будь ласка, заповніть усі поля.');
      return;
    }

    if (password.length < 6) {
      _showMessage('Пароль має містити мінімум 6 символів.');
      return;
    }

    if (password != confirmPassword) {
      _showMessage('Паролі не збігаються.');
      return;
    }

    widget.onRegister(name);
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
      appBar: AppBar(title: const Text('TravelMate — Реєстрація')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomInputField(controller: nameController, hintText: 'Ім’я', icon: Icons.person),
            const SizedBox(height: 12),
            CustomInputField(controller: emailController, hintText: 'Email', icon: Icons.email),
            const SizedBox(height: 12),
            CustomInputField(controller: passwordController, hintText: 'Пароль', icon: Icons.lock, obscureText: true),
            const SizedBox(height: 12),
            CustomInputField(controller: confirmPasswordController, hintText: 'Підтвердіть пароль', icon: Icons.lock_outline, obscureText: true),
            const SizedBox(height: 24),
            CustomButton(
              text: 'Зареєструватися',
              onPressed: _register,
            ),
          ],
        ),
      ),
    );
  }
}
