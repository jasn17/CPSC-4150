// content.dart
// The main content screen (called SecondScreen to match your starter).
// - Shows ALL quotes (hardcoded here).
// - Top row: 4 tiny "tabs" (buttons) that navigate to category pages.
// - AppBar actions: favorites + about.
// - Uses QuoteCard for display and simple like/delete handlers.
// - "Favorites" = quotes with likes > 0 (keeps logic easy for beginners).

import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';
import 'favorites.dart';
import 'about.dart';
import 'strength_page.dart';
import 'wisdom_page.dart';
import 'faith_page.dart';
import 'grace_page.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  // Hardcoded starter data — easy to see and edit.
  // Tip: keep themes exactly 'Strength' | 'Wisdom' | 'Faith' | 'Grace'
  // so filtering stays simple and readable.
  final List<Quote> _quotes = [
    Quote(
      text: 'I can do all things through Christ who strengthens me.',
      author: 'Philippians 4:13',
      theme: 'Strength',
    ),
    Quote(
      text: 'The fear of the Lord is the beginning of wisdom.',
      author: 'Proverbs 9:10',
      theme: 'Wisdom',
    ),
    Quote(
      text: 'We walk by faith, not by sight.',
      author: '2 Corinthians 5:7',
      theme: 'Faith',
    ),
    Quote(
      text: 'My grace is sufficient for you, for my power is made perfect in weakness.',
      author: '2 Corinthians 12:9',
      theme: 'Grace',
    ),
    Quote(
      text: 'Be strong and courageous.',
      author: 'Joshua 1:9',
      theme: 'Strength',
    ),
    Quote(
      text: 'If any of you lacks wisdom, ask God.',
      author: 'James 1:5',
      theme: 'Wisdom',
    ),
  ];

  // Like handler — mutates the Quote and rebuilds the list.
  void _likeQuote(Quote q) {
    setState(() {
      q.likes++;
    });
  }

  // Delete handler — removes the quote from the global list.
  void _deleteQuote(Quote q) {
    setState(() {
      _quotes.remove(q);
    });
  }

  // Convenience method: push a category page with filtered quotes.
  void _openCategory(BuildContext context, String theme) {
    final filtered = _quotes.where((q) => q.theme == theme).toList();
    Widget page;
    switch (theme) {
      case 'Strength':
        page = StrengthPage(quotes: filtered);
        break;
      case 'Wisdom':
        page = WisdomPage(quotes: filtered);
        break;
      case 'Faith':
        page = FaithPage(quotes: filtered);
        break;
      case 'Grace':
        page = GracePage(quotes: filtered);
        break;
      default:
        page = StrengthPage(quotes: filtered);
    }
    Navigator.push(context, MaterialPageRoute(builder: (_) => page)).then((_) {
      // After returning, rebuild in case likes/deletes happened on the child page.
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Quotes'),
        actions: [
          IconButton(
            tooltip: 'Favorites',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => FavoritesScreen(quotes: _quotes)),
              ).then((_) => setState(() {}));
            },
            icon: const Icon(Icons.favorite),
          ),
          IconButton(
            tooltip: 'About',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AboutPage()),
              );
            },
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      body: Column(
        children: [
          // Small "tabs" row (kept as simple Buttons to keep the mental model easy).
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Wrap(
              spacing: 8,
              children: [
                _CategoryChip(label: 'Strength', onTap: () => _openCategory(context, 'Strength')),
                _CategoryChip(label: 'Wisdom',  onTap: () => _openCategory(context, 'Wisdom')),
                _CategoryChip(label: 'Faith',    onTap: () => _openCategory(context, 'Faith')),
                _CategoryChip(label: 'Grace',    onTap: () => _openCategory(context, 'Grace')),
              ],
            ),
          ),
          const Divider(height: 0),
          // The main list of ALL quotes.
          Expanded(
            child: _quotes.isEmpty
                ? const _EmptyState(message: 'No quotes yet.')
                : ListView.builder(
              itemCount: _quotes.length,
              itemBuilder: (context, i) {
                final q = _quotes[i];
                return QuoteCard(
                  quote: q,
                  onLike: () => _likeQuote(q),
                  onDelete: () => _deleteQuote(q),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// Tiny helper for the category "tabs".
class _CategoryChip extends StatelessWidget {
  const _CategoryChip({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(label),
      onPressed: onTap,
      visualDensity: VisualDensity.compact,
    );
  }
}

/// Simple empty state widget to keep code tidy.
class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          message,
          style: TextStyle(color: Colors.grey[600]),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
