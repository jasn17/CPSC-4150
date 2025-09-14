import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key, required this.quotes});

  /// Pass in the SAME quotes list the catalog screen owns
  /// so deletes/likes stay in sync across pages.
  final List<Quote>? quotes;

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Quote> get _all => widget.quotes ?? <Quote>[];

  void _like(Quote q) => setState(() => q.likes++);
  void _delete(Quote q) => setState(() => _all.remove(q));

  @override
  Widget build(BuildContext context) {
    final favorites = _all.where((q) => q.likes > 0).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: favorites.isEmpty
          ? const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text('No favorites yet. Like a quote to see it here!'),
        ),
      )
          : ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, i) {
          final q = favorites[i];
          return QuoteCard(
            quote: q,
            onLike: () => _like(q),
            onDelete: () => _delete(q),
          );
        },
      ),
    );
  }
}
