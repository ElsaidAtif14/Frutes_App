import 'package:bloc/bloc.dart';
import 'package:frutes_app/features/auth/domain/entites/user_entity.dart';
import 'package:frutes_app/features/auth/domain/repos/auth_repo.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());

  final AuthRepo authRepo;
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SigninLoading());

    final result = await authRepo.signInWithEmialAndPassword(email, password);

    result.fold(
      (failure) => emit(SigninFailure(message: failure.message)),
      (userEntity) => emit(SigninSuccess(user: userEntity)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SigninLoading());

    final result = await authRepo.signInWithGoogle();

    result.fold(
      (failure) => emit(SigninFailure(message: failure.message)),
      (userEntity) => emit(SigninSuccess(user: userEntity)),
    );
  }

  Future<void> signInWithFacebook() async {
    emit(SigninLoading());

    final result = await authRepo.signInWithFacebook();

    result.fold(
      (failure) => emit(SigninFailure(message: failure.message)),
      (userEntity) => emit(SigninSuccess(user: userEntity)),
    );
  }

  Future<void> signInWithApple() async {
    emit(SigninLoading());

    final result = await authRepo.signInWithApple();

    result.fold(
      (failure) => emit(SigninFailure(message: failure.message)),
      (userEntity) => emit(SigninSuccess(user: userEntity)),
    );
  }
}
