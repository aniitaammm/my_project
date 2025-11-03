import 'package:flutter/material.dart';
import 'package:travelmate/widgets/destination_card.dart';
import 'package:travelmate/models/destination.dart';

class HomeScreen extends StatelessWidget {
  final String userName;

  HomeScreen({super.key, required this.userName});

  final List<Destination> destinations = [
    Destination(
      name: 'Париж, Франція',
      description: 'Місто кохання та мистецтва. Ейфелева вежа, Лувр, круасани!',
      imageUrl: 'https://images.unsplash.com/photo-1502602898657-3e91760cbb34',
    ),
    Destination(
      name: 'Кіото, Японія',
      description: 'Храми, сакура і спокійна атмосфера давніх часів.',
      imageUrl: 'https://images.unsplash.com/photo-1554797589-7241bb691973',
    ),
    Destination(
      name: 'Нью-Йорк, США',
      description: 'Місто, що ніколи не спить. Центр світового життя.',
      imageUrl: 'https://images.unsplash.com/photo-1534447677768-be436bb09401',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Привіт, $userName 👋'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Navigator.pushNamed(context, '/profile'),
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/destination',
                arguments: destinations[index],
              );
            },
            child: DestinationCard(destination: destinations[index]),
          );
        },
      ),
    );
  }
}
