import 'package:proyecto_flutter/features/dashboard/data/models/user_account_model.dart';
import 'package:proyecto_flutter/features/dashboard/data/models/user_model.dart';

class RemoteDashboardDataSource {
  Future<UserModel> userPerfil(UserModel userModel) async {
    final name = userModel.name;
    final email = userModel.email;

    await Future.delayed(Duration(milliseconds: 500));

    if (name.isEmpty || email.isEmpty) {
      throw Exception('Nombre y correo electrónico no pueden estar vacíos');
    }

    if (name == 'Byron Toledo' && email == 'byron.toledo') {
      return userModel;
    }
    if (name == 'Henry Peralta' && email == 'henry.peralta') {
      return userModel;
    }
    if (name == 'Admin' && email == 'admin@email.com') {
      return userModel;
    } else {
      throw Exception('Error el usuario no existe');
    }
  }

  Future<UserAccountModel> userAccount(UserModel userModel) async {
    await Future.delayed(Duration(milliseconds: 500));

    if (userModel.name.isEmpty || userModel.email.isEmpty) {
      throw Exception('Nombre y correo electrónico no pueden estar vacíos');
    }

    if (userModel.name == 'Byron Toledo' && userModel.email == 'byron.toledo') {
      return UserAccountModel(
        name: userModel.name,
        card: 'Visa',
        accountNumber: '4025 **** **** 1234',
        balance: 5000.00,
        moneda: 'USD',
      );
    }
    if (userModel.name == 'Henry Peralta' &&
        userModel.email == 'henry.peralta') {
      return UserAccountModel(
        name: userModel.name,
        card: 'MasterCard',
        accountNumber: '5123 **** **** 5678',
        balance: 3000.00,
        moneda: 'GTQ',
      );
    }
    if (userModel.name == 'Admin' &&
        userModel.email == 'admin@email.com') {
      return UserAccountModel(
        name: userModel.name,
        card: 'Visa',
        accountNumber: '4532 **** **** 9999',
        balance: 10000.00,
        moneda: 'USD',
      );
    } else {
      throw Exception('Error el usuario no existe');
    }
  }
}
