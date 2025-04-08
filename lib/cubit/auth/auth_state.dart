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
