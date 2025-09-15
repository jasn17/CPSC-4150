import 'package:flutter/material.dart';
import 'quote.dart';
import 'package:intl/intl.dart';
import 'animations.dart';

// Reusable widget to display one quote preformatted
class QuoteCard extends StatelessWidget {
  const QuoteCard({
    super.key,
    // For class Quote
    required this.quote,
    // For like button
    this.onLike,
    // For delete button
    this.onDelete,
  });
  // Single quote (text, author, date)
  final Quote quote;
  // References parent that updates state
  final VoidCallback? onLike;
  // References parent that deletes quote
  final VoidCallback? onDelete;

  // Show delete confirmation dialog, this is called when the onPress for delete is called
  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Alert dialog to confirm delete with two widgets for cancel and delete
        return AlertDialog(
          title: const Text('Delete Quote'),
          content: const Text('Are you sure you want to delete this quote?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onDelete?.call();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  // Get card color based on theme
  Color _getCardColor() {
    switch (quote.theme) {
      case 'Faith':
        return Colors.purple[100]!; // light purple
      case 'Wisdom':
        return Colors.green[100]!; // light green
      case 'Grace':
        return Colors.yellow[100]!; // light yellow
      case 'Strength':
        return Colors.blue[100]!; // light blue
      default:
        return Colors.grey[100]!; // default light grey
    }
  }

  // Get theme tag color based on theme
  Color _getTagColor() {
    switch (quote.theme) {
      case 'Faith':
        return Colors.purple[800]!; // dark purple
      case 'Wisdom':
        return Colors.green[800]!; // dark green
      case 'Grace':
        return Colors.yellow[800]!; // dark yellow
      case 'Strength':
        return Colors.blue[800]!; // dark blue
      default:
        return Colors.grey[800]!; // default dark grey
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat('MMM d, yyyy').format(quote.dateCreated);
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      color: _getCardColor(), // Apply theme-based color
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top row with theme tag on the right
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getCardColor(),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: _getTagColor().withValues()),
                  ),
                  child: Text(
                    quote.theme,
                    style: TextStyle(
                      color: _getTagColor(),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Styling of the quote and author text
            Text(quote.text, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 6),
            Text('- ${quote.author}', style: TextStyle(color: Colors.grey[600])),
            const SizedBox(height: 8),
            // Bottom row displaying the date on the left, like(s) on the right
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Display date
                Text(dateStr, style: TextStyle(color: Colors.grey[500])),
                // Display thumbs up button and counter *
                Row(
                  children: [
                    AppAnimations.bounce(
                      shouldBounce: quote.likes > 0,
                      child: IconButton(
                        icon: const Icon(Icons.thumb_up),
                        // Call function given by parent
                        onPressed: onLike,
                      ),
                    ),
                    Text('${quote.likes}'),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red[400],
                      ),
                      onPressed: () => _showDeleteConfirmation(context),
                    )
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