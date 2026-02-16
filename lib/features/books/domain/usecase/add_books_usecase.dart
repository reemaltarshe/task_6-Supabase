import 'package:injectable/injectable.dart';
import 'package:supabase_app/features/books/domain/repo/book_repo.dart';
@injectable
class AddBooksUsecase {
  final BookRepo repository;

  AddBooksUsecase({required this.repository});

  Future<void>call(String title, int publishedYear, String authorId) async{
    return await repository.addBook(title, publishedYear, authorId);
  }
}