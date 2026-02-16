import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:supabase_app/features/books/data/model/book_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
@injectable
class BookRemoteDataSource {
  final SupabaseClient supabaseClient;

  BookRemoteDataSource({required this.supabaseClient});

  Future<List<BookModel>>fetchBooks() async{
    final response = await supabaseClient.from('books').select('id,title,published_year,author_id,authors(name)');
    return (response as List).map((e) => BookModel.fromJson(e)).toList();
  }

  Future<void>addBook(String title, int publishedYear, String authorId) async{
    final response = await supabaseClient.from('books').insert({'title':title, 'published_year':publishedYear,'author_id':authorId});

  }
}