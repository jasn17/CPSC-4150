/// Quote is a class with no UI
/// Represents a single quote with no text, author, likes, and date created
class Quote {
  final String text;
  final String author;
  // This is for the like counter
  int likes;
  // This is for the date
  final DateTime dateCreated;

  Quote({
    required this.text,
    required this.author,
    // Likes defaults at 0
    this.likes=0,
    // Date uses current time as default
    DateTime? dateCreated,
  }): dateCreated = dateCreated ?? DateTime.now();
}


