import 'package:injectable/injectable.dart';
import 'package:supabase_app/features/authors/domain/entity/author_entity.dart';
import 'package:supabase_app/features/authors/domain/repo/author_repo.dart';
@injectable
class GetAuthorsUsecase {
  final AuthorRepo repository;

  GetAuthorsUsecase({required this.repository});
  Future<List<AuthorEntity>>call() async{
    return await repository.getAuthors();
  }
}