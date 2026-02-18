import 'package:injectable/injectable.dart';
import 'package:supabase_app/features/auth/domain/entity/user_entity.dart';

import '../repo/user_repo.dart';
@injectable
class SignInUseCase {
  final UserRepo repository;

  SignInUseCase({required this.repository});

  Future<UserEntity>call({required String email,required String password}) async{
    return await repository.signIn(email: email, password: password);
  }
}