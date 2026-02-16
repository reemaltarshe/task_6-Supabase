import 'package:supabase_app/features/authors/domain/entity/author_entity.dart';

abstract class AuthorRepo {
  Future<List<AuthorEntity>>getAuthors();
  Future<void>addAuthor(String name);
}