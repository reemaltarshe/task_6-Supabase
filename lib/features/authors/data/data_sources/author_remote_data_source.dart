import 'package:injectable/injectable.dart';
import 'package:supabase_app/features/authors/data/model/author_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
@injectable
class AuthorRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthorRemoteDataSource(this.supabaseClient);
  
  Future<List<AuthorModel>>getAuthor() async{
    final response= await supabaseClient.from('authors').select('id,name,books(count)');
    return (response as List).map((e) => AuthorModel.fromJson(e)).toList();
  }

  Future<void>addAuthor(String name) async{
    final response= await supabaseClient.from('authors').insert({'name' : name});
  }
}