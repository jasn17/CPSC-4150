// about.dart
// A tiny, clear "About" page that explains the app purpose.

import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'Bible Quotes is a simple study companion. '
              'Browse short scripture-based quotes organized by theme '
              '(Strength, Wisdom, Faith, Grace). Tap the thumbs-up to like a quote. '
              'Liked quotes appear on the Favorites page so you can return to them quickly.',
          style: TextStyle(fontSize: 16, height: 1.35),
        ),
      ),
    );
  }
}
