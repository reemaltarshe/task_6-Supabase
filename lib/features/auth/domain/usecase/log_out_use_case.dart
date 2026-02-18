import 'package:injectable/injectable.dart';
import 'package:supabase_app/features/auth/domain/repo/user_repo.dart';
@injectable
class LogOutUseCase {
  final UserRepo repository;

  LogOutUseCase({required this.repository});

 Future<void> call() async{
    return await repository.logOut();
  }
}