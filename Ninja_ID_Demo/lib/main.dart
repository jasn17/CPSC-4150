import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

/// Starts the app by calling the QuoteList() app
void main() => runApp(
    const MaterialApp(home: QuoteList())
);

/// QuoteList creates and returns a page template
class QuoteList extends StatefulWidget {
  const QuoteList({super.key});
  @override
  State<QuoteList> createState() => _QuoteListState();
}

/// _QuoteListState contains the "state" class holds quote data and re-renders UI when changed
class _QuoteListState extends State<QuoteList> {
  // Quotes are hardcoded as Quote classes
  final List<Quote> quotes = [
    Quote(
      author: 'Romans',
      text: 'For all have sinned and fall short of the glory of God.',
      theme: 'Faith',
    ),
    Quote(
      author: 'Matthew',
      text:
      'Therefore go and make disciples of all nations, baptizing them in the name of the Father and of the Son and of the Holy Spirit.',
      theme: 'Wisdom',
    ),
    Quote(
      author: 'John',
      text:
      'Jesus answered, "I am the way and the truth and the life. No one comes to the Father except through me."',
      theme: 'Grace',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Builds the standard page layout in Flutter with AppBar and Body
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Bible Quotes'),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      // Body of page, displaying card widgets
      body:
      Column(
        // For each Quote in quotes make a QuoteCard widget
        // Also passes a callback: when user presses "like", update state
        children: quotes.map<Widget>((q) => QuoteCard(quote: q, onLike: () => setState(() => q.likes++), onDelete: () => setState(() => quotes.remove(q)))).toList(),
      ),
    );
  }
}
