import 'package:flutter/material.dart';
import 'quote.dart';
import 'package:intl/intl.dart';

// Reusable widget to display one quote preformatted
class QuoteCard extends StatelessWidget {
  const QuoteCard({
    super.key,
    // For class Quote
    required this.quote,
    // For like button
    this.onLike,
  });
  // Single quote (text, author, date)
  final Quote quote;
  // References parent that updates state
  final VoidCallback? onLike;

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat('MMM d, yyyy').format(quote.dateCreated);

    return Card(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Styling of the quote and author text
            Text(quote.text, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 6),
            Text('- ${quote.author}', style: TextStyle(color: Colors.grey[600])),
            const SizedBox(height: 8),
            // Bottom row displaying the date on teh left, like(s) on the right
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Display date
                Text(dateStr, style: TextStyle(color: Colors.grey[500])),
                // Display thumbs up button and counter
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.thumb_up),
                      // Call function given by parent
                      onPressed: onLike,
                    ),
                    Text('${quote.likes}'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}