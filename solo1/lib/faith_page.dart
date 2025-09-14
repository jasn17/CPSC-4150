import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

class FaithPage extends StatefulWidget {
  const FaithPage({super.key, required this.quotes});
  final List<Quote> quotes;

  @override
  State<FaithPage> createState() => _FaithPageState();
}

class _FaithPageState extends State<FaithPage> {
  void _like(Quote q) => setState(() => q.likes++);
  void _delete(Quote q) => setState(() => widget.quotes.remove(q));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Faith')),
      body: widget.quotes.isEmpty
          ? const Center(child: Text('No Faith quotes yet.'))
          : ListView.builder(
        itemCount: widget.quotes.length,
        itemBuilder: (context, i) {
          final q = widget.quotes[i];
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
