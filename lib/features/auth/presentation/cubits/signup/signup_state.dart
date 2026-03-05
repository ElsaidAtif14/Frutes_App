part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSucces extends SignupState {
  final UserEntity userEntity;

  SignupSucces({required this.userEntity});
}

class SignupFailure extends SignupState {
  final String message;
  SignupFailure({required this.message});
}
