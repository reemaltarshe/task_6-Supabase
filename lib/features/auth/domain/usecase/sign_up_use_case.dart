import 'package:injectable/injectable.dart';
import 'package:supabase_app/features/auth/domain/entity/user_entity.dart';
import 'package:supabase_app/features/auth/domain/repo/user_repo.dart';
@injectable
class SignUpUseCase {
  final UserRepo repository;

  SignUpUseCase({required this.repository});

  Future<UserEntity>call({required String email, required String password}) async{
    return await repository.signUp(email: email, password: password);
  }
}