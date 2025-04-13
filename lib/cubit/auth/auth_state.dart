part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class RegisterLoading extends AuthState {}

final class RegisterSuccuess extends AuthState {}

final class RegisterError extends AuthState {
  final String message;

  RegisterError({required this.message});
}

final class LoginLoading extends AuthState {}

final class LoginSuccuess extends AuthState {}

final class LoginError extends AuthState {
  final String message;

  LoginError({required this.message});
}



final class UserLoading extends AuthState {}
final class UserSuccess extends AuthState {}
final class UserError extends AuthState {
  final String message;
  UserError({required this.message});
}
