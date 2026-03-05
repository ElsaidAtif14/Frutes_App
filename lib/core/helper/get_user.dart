import 'dart:convert';
import 'package:frutes_app/constants.dart';
import 'package:frutes_app/core/services/shared_preferences_singleton.dart';
import 'package:frutes_app/features/auth/data/models/user_model.dart';
import 'package:frutes_app/features/auth/domain/entites/user_entity.dart';

UserEntity getUser() {
  var jsonString = Prefs.getString(kUserData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
