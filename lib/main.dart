import 'package:flutter/material.dart';

void main() {
  runApp(const MagicCounterApp());
}

class MagicCounterApp extends StatelessWidget {
  const MagicCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Magic Counter',
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurpleAccent,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const MagicCounterPage(),
    );
  }
}

class MagicCounterPage extends StatefulWidget {
  const MagicCounterPage({super.key});

  @override
  State<MagicCounterPage> createState() => _MagicCounterPageState();
}

class _MagicCounterPageState extends State<MagicCounterPage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  final _controller = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    );
  }

  void _updateCounter(int value) {
    setState(() {
      _counter += value;
    });
    _animationController.forward(from: 0);
  }

  void _applyMagic() {
    final text = _controller.text.trim();

    if (text.toLowerCase() == 'avada kedavra') {
      setState(() => _counter = 0);
      _showSnack('💀 Магія спрацювала! Рахунок скинуто.');
    } else {
      final number = int.tryParse(text);
      if (number != null) {
        _updateCounter(number);
      } else {
        _showSnack('🪄 Введіть число або "Avada Kedavra"');
      }
    }
    _controller.clear();
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF3F0071), Color(0xFF8E2DE2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('✨ Magic Counter ✨'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleTransition(
                  scale: _animation,
                  child: Text(
                    '$_counter',
                    style: const TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Colors.amberAccent,
                      shadows: [
                        Shadow(
                          blurRadius: 10,
                          color: Colors.amber,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: _controller,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.15),
                    hintText: 'Введіть число або закляття...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: _applyMagic,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 14),
                    backgroundColor: Colors.purpleAccent.withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  icon: const Icon(Icons.auto_awesome),
                  label: const Text(
                    'Застосувати магію',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
