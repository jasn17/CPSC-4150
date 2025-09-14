import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

class WisdomPage extends StatefulWidget {
  const WisdomPage({super.key, required this.quotes});
  final List<Quote> quotes;

  @override
  State<WisdomPage> createState() => _WisdomPageState();
}

class _WisdomPageState extends State<WisdomPage> {
  void _like(Quote q) => setState(() => q.likes++);
  void _delete(Quote q) => setState(() => widget.quotes.remove(q));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wisdom')),
      body: widget.quotes.isEmpty
          ? const Center(child: Text('No Wisdom quotes yet.'))
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
