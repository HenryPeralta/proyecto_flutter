import 'package:proyecto_flutter/features/history/data/models/user_model.dart';

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});

  factory User.fromModel(UserModel userModel) {
    return User(name: userModel.name, email: userModel.email);
  }
}
