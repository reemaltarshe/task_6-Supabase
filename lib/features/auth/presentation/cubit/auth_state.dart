part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final UserEntity user;

  AuthSuccess({required this.user});
}

class AuthLoggedOut extends AuthState {}


final class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}

