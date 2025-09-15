import 'package:flutter/material.dart';
import 'content.dart';
import 'favorites.dart';
import 'about.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solo App 1',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue, // modern theming; keeps code simple
        useMaterial3: true,
      ),
      home: const FirstScreen(),
    );
  }
}

/// Landing page with image, title and button
class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text('Our Cross †'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'https://www.freepnglogos.com/uploads/cross-png/cross-vector-png-transparent-image-pngpix-18.png',
                height: 160,
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome Home',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              // Primary CTA — goes to the quote catalog (SecondScreen)
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SecondScreen()),
                  );
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Get Started'),
              ),
              const SizedBox(height: 12),
              // About and Favorites buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const AboutPage()),
                      );
                    },
                    child: const Text('About'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const FavoritesScreen(quotes: null)),
                      );
                    },
                    child: const Text('Favorites'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
