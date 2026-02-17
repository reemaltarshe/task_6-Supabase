import 'package:supabase_app/features/auth/domain/entity/user_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserModel extends UserEntity{
  UserModel({required super.id, required super.email});

  factory UserModel.fromSupabase(User user){
    return UserModel(
        id: user.id, email: user.email??'');
  }
}