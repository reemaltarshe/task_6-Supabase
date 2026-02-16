import 'package:injectable/injectable.dart';
import 'package:supabase_app/features/authors/domain/repo/author_repo.dart';
@injectable
class AddAuthorUsecase {
  final AuthorRepo repository;

  AddAuthorUsecase({required this.repository});

  Future<void> call(String name) async{
    return await repository.addAuthor(name);
  }
}