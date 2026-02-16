import 'package:injectable/injectable.dart';
import 'package:supabase_app/features/books/domain/entity/book_entity.dart';
import 'package:supabase_app/features/books/domain/repo/book_repo.dart';

import '../datasource/book_remote_data_source.dart';
@LazySingleton(as:BookRepo)
class BookRepoImpl implements BookRepo {
  final BookRemoteDataSource remote;

  BookRepoImpl({required this.remote});
  @override
  Future<void> addBook(String title, int publishedYear, String authorId) async{
    return remote.addBook(title, publishedYear, authorId);
  }

  @override
  Future<List<BookEntity>> getBooks() async {
    return remote.fetchBooks();
  }

}