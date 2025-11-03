import 'package:flutter/material.dart';
import 'package:travelmate/screens/login_screen.dart';
import 'package:travelmate/screens/register_screen.dart';
import 'package:travelmate/screens/home_screen.dart';
import 'package:travelmate/screens/profile_screen.dart';
import 'package:travelmate/screens/destination_details_screen.dart';
import 'package:travelmate/models/destination.dart';

void main() {
  runApp(TravelMateApp());
}

class TravelMateApp extends StatefulWidget {
  const TravelMateApp({super.key});

  @override
  State<TravelMateApp> createState() => _TravelMateAppState();
}

class _TravelMateAppState extends State<TravelMateApp> {
  String? userName;

  void setUserName(String name) {
    setState(() {
      userName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TravelMate',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => RegisterScreen(onRegister: setUserName),
        '/home': (context) => HomeScreen(userName: userName ?? 'Користувач'),
        '/profile': (context) => ProfileScreen(userName: userName ?? 'Користувач'),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/destination') {
          final destination = settings.arguments as Destination;
          return MaterialPageRoute(
            builder: (_) => DestinationDetailsScreen(destination: destination),
          );
        }
        return null;
      },
    );
  }
}
