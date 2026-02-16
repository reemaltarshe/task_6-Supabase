import 'package:injectable/injectable.dart';
import 'package:supabase_app/features/authors/data/data_sources/author_remote_data_source.dart';
import 'package:supabase_app/features/authors/data/model/author_model.dart';
import 'package:supabase_app/features/authors/domain/repo/author_repo.dart';
@LazySingleton(as:AuthorRepo)
class AuthorRepoImpl implements AuthorRepo{
  final AuthorRemoteDataSource remote;

  AuthorRepoImpl({required this.remote});
  @override
  Future<void> addAuthor(String name) async {
    return remote.addAuthor(name);
  }

  @override
  Future<List<AuthorModel>> getAuthors() async{
    return remote.getAuthor();
  }

}