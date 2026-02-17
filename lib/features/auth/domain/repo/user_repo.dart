import 'package:supabase_app/features/auth/domain/entity/user_entity.dart';

abstract class UserRepo {
  Future<UserEntity>signUp({
    required String email ,
    required String password});
}