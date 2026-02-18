import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:supabase_app/features/auth/domain/entity/user_entity.dart';

import '../../domain/usecase/log_out_use_case.dart';
import '../../domain/usecase/sign_in_use_case.dart';
import '../../domain/usecase/sign_up_use_case.dart';

part 'auth_state.dart';
@injectable
class AuthCubit extends Cubit<AuthState> {
  final SignUpUseCase _signUpUseCase;
  final SignInUseCase signInUseCase;
  final LogOutUseCase logOutUseCase;
  AuthCubit(this._signUpUseCase, {required this.signInUseCase, required this.logOutUseCase}) : super(AuthInitial());

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
  Future<void>signIn(String email , String password) async{
    emit(AuthLoading());
    try{
      final user= await signInUseCase(
        email:  email,
        password: password
      );
      emit(AuthAuthenticated(user));

    }catch(e){
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void>logOut() async {
    emit(AuthLoading());
    try {
      await logOutUseCase();
      emit(AuthUnauthenticated());
    }catch(e){
      emit(AuthError(message: e.toString()));
    }
  }
}
