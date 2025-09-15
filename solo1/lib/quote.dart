/// Class for a quote
class Quote {
  final String text;
  final String author;
  int likes;
  final DateTime dateCreated;
  final String theme;

  Quote({
    required this.text,
    required this.author,
    this.likes = 0,
    DateTime? dateCreated,
    required this.theme,
  }) : dateCreated = dateCreated ?? DateTime.now();
}
