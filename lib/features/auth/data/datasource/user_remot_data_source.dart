import 'package:injectable/injectable.dart';
import 'package:supabase_app/features/auth/data/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
@injectable
class UserRemotDataSource {
  final SupabaseClient supabaseClient;

  UserRemotDataSource({required this.supabaseClient});

  Future<UserModel>signUp(String email, String password) async {
    final response = await supabaseClient.auth.signUp(
        email: email, password: password);

    final user = response.user;
    if (user == null) {
      throw Exception('SignUp failed');
    }
    return UserModel.fromSupabase(user);
  }
}
