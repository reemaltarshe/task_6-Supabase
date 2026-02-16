import 'package:supabase_app/features/books/domain/entity/book_entity.dart';

abstract class BookRepo {
  Future<List<BookEntity>> getBooks();
  Future<void> addBook(String title, int publishedYear, String authorId);
}