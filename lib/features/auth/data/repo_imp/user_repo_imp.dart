import 'package:injectable/injectable.dart';
import 'package:supabase_app/features/auth/domain/entity/user_entity.dart';
import 'package:supabase_app/features/auth/domain/repo/user_repo.dart';

import '../datasource/user_remot_data_source.dart';
@LazySingleton(as: UserRepo)
class UserRepoImp implements UserRepo{
  final UserRemotDataSource remote;

  UserRepoImp({required this.remote});
  @override
  Future<UserEntity> signUp({required String email, required String password}) {
    return remote.signUp(email, password);
  }

  @override
  Future<void> logOut() {
    return remote.logOut();
  }

  @override
  Future<UserEntity> signIn({required String email, required String password}) {
    return remote.signIn(email, password);
  }
}