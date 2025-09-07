import 'package:flutter_test/flutter_test.dart';
import 'package:ninja_id_demo/quote.dart';

void main() {
  group('Quote Model Tests', () {
    test('Quote should have default likes of 0', () {
      // Arrange & Act
      final quote = Quote(
        text: 'Test quote',
        author: 'Test Author',
        theme: 'Test Theme',
      );

      // Assert
      expect(quote.likes, equals(0));
    });

    test('Quote should have current date when dateCreated is not provided', () {
      // Arrange
      final beforeCreation = DateTime.now();
      
      // Act
      final quote = Quote(
        text: 'Test quote',
        author: 'Test Author',
        theme: 'Test Theme',
      );
      
      final afterCreation = DateTime.now();

      // Assert
      expect(quote.dateCreated.isAfter(beforeCreation.subtract(const Duration(seconds: 1))), isTrue);
      expect(quote.dateCreated.isBefore(afterCreation.add(const Duration(seconds: 1))), isTrue);
    });

    test('Quote should use provided dateCreated when specified', () {
      // Arrange
      final specificDate = DateTime(2023, 1, 1);

      // Act
      final quote = Quote(
        text: 'Test quote',
        author: 'Test Author',
        theme: 'Test Theme',
        dateCreated: specificDate,
      );

      // Assert
      expect(quote.dateCreated, equals(specificDate));
    });

    test('Quote should allow likes to be incremented', () {
      // Arrange
      final quote = Quote(
        text: 'Test quote',
        author: 'Test Author',
        theme: 'Test Theme',
      );

      // Act
      quote.likes++;

      // Assert
      expect(quote.likes, equals(1));
    });

    test('Quote should store all properties correctly', () {
      // Arrange
      const text = 'Test quote text';
      const author = 'Test Author';
      const theme = 'Test Theme';
      final date = DateTime(2023, 1, 1);

      // Act
      final quote = Quote(
        text: text,
        author: author,
        theme: theme,
        dateCreated: date,
        likes: 5,
      );

      // Assert
      expect(quote.text, equals(text));
      expect(quote.author, equals(author));
      expect(quote.theme, equals(theme));
      expect(quote.dateCreated, equals(date));
      expect(quote.likes, equals(5));
    });
  });
}
