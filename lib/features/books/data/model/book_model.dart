import 'package:supabase_app/features/books/domain/entity/book_entity.dart';

class BookModel extends BookEntity{
  BookModel({required super.id, required super.title, required super.publishedYear, required super.authorName, required super.authorId});

  factory BookModel.fromJson(Map<String,dynamic>json){
    return BookModel(
        id: json['id'],
        title: json['title'],
        publishedYear: json['published_year'],
      authorId: json['author_id'],
      authorName:  json['authors']?['name'],
    );
  }
}