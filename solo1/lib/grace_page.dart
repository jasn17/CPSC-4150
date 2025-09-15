import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

class GracePage extends StatefulWidget {
  const GracePage({super.key, required this.quotes});
  final List<Quote> quotes;

  @override
  State<GracePage> createState() => _GracePageState();
}

class _GracePageState extends State<GracePage> {
  void _like(Quote q) => setState(() => q.likes++);
  void _delete(Quote q) => setState(() => widget.quotes.remove(q));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grace')),
      // If there is no content to display, show a message.
      body: widget.quotes.isEmpty
          ? const Center(child: Text('No Grace quotes yet.'))
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
