import 'package:supabase_app/features/authors/domain/entity/author_entity.dart';

class AuthorModel extends AuthorEntity{
  AuthorModel({required super.id, required super.name, required super.booksCount});

  factory AuthorModel.fromJson(Map<String,dynamic> json){
    return AuthorModel(
        id: json['id'],
        name: json['name'],
        booksCount: json['books'][0]['count']
    );
  }

}