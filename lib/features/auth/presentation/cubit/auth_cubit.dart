import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:supabase_app/features/auth/domain/entity/user_entity.dart';

import '../../domain/usecase/sign_up_use_case.dart';

part 'auth_state.dart';
@injectable
class AuthCubit extends Cubit<AuthState> {
  final SignUpUseCase _signUpUseCase;
  AuthCubit(this._signUpUseCase) : super(AuthInitial());

  Future<void>signUp(String email, String password) async{
    emit(AuthLoading());
    try{
      final user= await _signUpUseCase(
        email: email,
        password: password,
      );
      emit(AuthSuccess( user: user));
    }catch(e){
      emit(AuthError(message: e.toString()));

    }
  }
}
