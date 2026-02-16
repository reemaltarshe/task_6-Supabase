part of 'author_cubit.dart';

@immutable
sealed class AuthorState {}

final class AuthorInitial extends AuthorState {}

final class AuthorLoading extends AuthorState {}

final class AuthorLoaded extends AuthorState {
  final List<AuthorEntity> authors;

  AuthorLoaded({required this.authors});
}

final class AuthorError extends AuthorState {
  final String message;

  AuthorError({required this.message});
}

