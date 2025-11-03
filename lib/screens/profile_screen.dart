import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String userName;

  const ProfileScreen({super.key, required this.userName});

  final List<String> travelHistory = const [
    'Париж — 2024',
    'Берлін — 2023',
    'Прага — 2022',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Мій профіль')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            const SizedBox(height: 16),
            Text(userName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text('Історія подорожей', style: TextStyle(fontSize: 18)),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: travelHistory.length,
                itemBuilder: (context, index) => ListTile(
                  leading: const Icon(Icons.location_on, color: Colors.teal),
                  title: Text(travelHistory[index]),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
              child: const Text('Вийти'),
            ),
          ],
        ),
      ),
    );
  }
}
