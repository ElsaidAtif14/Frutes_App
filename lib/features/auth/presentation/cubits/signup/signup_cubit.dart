import 'package:bloc/bloc.dart';
import 'package:frutes_app/features/auth/domain/entites/user_entity.dart';
import 'package:frutes_app/features/auth/domain/repos/auth_repo.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());
  final AuthRepo authRepo;
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(SignupLoading());

    final result = await authRepo.createUserWithEmialAndPassword(
      email,
      password,
      name,
    );

    result.fold(
      (failure) => emit(SignupFailure(message: failure.message)),
      (userEntity) => emit(SignupSucces(userEntity: userEntity)),
    );
  }
}
