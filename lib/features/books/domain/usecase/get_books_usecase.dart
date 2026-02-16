import 'package:injectable/injectable.dart';
import 'package:supabase_app/features/books/domain/entity/book_entity.dart';

import '../repo/book_repo.dart';
@injectable
class GetBooksUsecase {
  final BookRepo repository;

  GetBooksUsecase({required this.repository});

 Future<List<BookEntity>> call() async{
    return await repository.getBooks();
  }
}