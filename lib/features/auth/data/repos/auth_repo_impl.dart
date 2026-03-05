// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frutes_app/constants.dart';
import 'package:frutes_app/core/errors/exception.dart';
import 'package:frutes_app/core/errors/failure.dart';
import 'package:frutes_app/core/services/database_service.dart';
import 'package:frutes_app/core/services/firebase_auth_services.dart';
import 'package:frutes_app/core/services/shared_preferences_singleton.dart';
import 'package:frutes_app/core/utils/backend_endpoint.dart';
import 'package:frutes_app/features/auth/data/models/user_model.dart';
import 'package:frutes_app/features/auth/domain/entites/user_entity.dart';
import 'package:frutes_app/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  FirebaseAuthServices firebaseAuthServices;
  DatabaseService databaseService;
  AuthRepoImpl({
    required this.firebaseAuthServices,
    required this.databaseService,
  });
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmialAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
      user = await firebaseAuthServices.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEnity = UserEntity(name: name, email: email, uId: user.uid);
      await addUserData(user: userEnity);
      return right(userEnity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log(
        'Excepetion with Firebase in create user with emil and password${e.toString()} ',
      );
      return left(ServerFailure('حدث خطأ غير متوقع، حاول مرة أخرى'));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthServices.deleteUser();
    }
  }

  //------------------------------------
  //signin with email and password
  @override
  Future<Either<Failure, UserEntity>> signInWithEmialAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthServices.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = await getUserData(uId: user.uid);
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Excepetion with Firebase in sign in with emil and password${e.toString()} ',
      );
      return left(ServerFailure('حدث خطأ غير متوقع، حاول مرة أخرى'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      // await addUserData(user: userEnity);
      await saveUserData(user: userEntity);

      var isUserExist = await databaseService.isDataExists(
        path: BackendEndpoint.isUserExists,
        documentId: user.uid,
      );
      if (isUserExist) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log('Excepetion with Firebase in sign in with Google ${e.toString()} ');
      return left(ServerFailure('حدث خطأ غير متوقع، حاول مرة أخرى'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      await saveUserData(user: userEntity);
      await addUserData(user: userEntity);
      var isUserExist = await databaseService.isDataExists(
        path: BackendEndpoint.isUserExists,
        documentId: user.uid,
      );
      if (isUserExist) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log('Excepetion with Firebase in sign in with Facebook ${e.toString()} ');
      return left(ServerFailure('حدث خطأ غير متوقع، حاول مرة أخرى'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async {
    try {
      var user = await firebaseAuthServices.signInWithApple();
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Excepetion with Firebase in sign in with Apple ${e.toString()} ');
      return left(ServerFailure('حدث خطأ غير متوقع، حاول مرة أخرى'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndpoint.addUserData,
      data: UserModel.fromEntity(user).toMap(),
      documentId: user.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var data = await databaseService.getData(
      path: BackendEndpoint.getUserData,
      documentId: uId,
    );
    return UserModel.fromJson(data);
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await Prefs.setString(kUserData, jsonData);
  }
}
