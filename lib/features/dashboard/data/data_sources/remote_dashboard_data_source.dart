import 'package:proyecto_flutter/features/dashboard/data/models/user_account_model.dart';
import 'package:proyecto_flutter/features/dashboard/data/models/user_model.dart';

class RemoteDashboardDataSource {
  Future<UserModel> userPerfil(UserModel userModel) async {
    final name = userModel.name;
    final email = userModel.email;

    await Future.delayed(const Duration(seconds: 3));

    if (name.isEmpty || email.isEmpty) {
      throw Exception('Nombre y correo electronico no pueden estar vacios');
    }

    return userModel;
  }

  Future<UserAccountModel> userAccount(UserModel userModel) async {
    final products = await userAccounts(userModel);
    return products.first;
  }

  Future<List<UserAccountModel>> userAccounts(UserModel userModel) async {
    await Future.delayed(const Duration(seconds: 3));

    if (userModel.name.isEmpty || userModel.email.isEmpty) {
      throw Exception('Nombre y correo electronico no pueden estar vacios');
    }

    if (userModel.name == 'Byron Toledo' && userModel.email == 'byron.toledo') {
      return _buildProducts(
        name: userModel.name,
        primaryCard: 'Visa',
        primaryAccount: '4025 **** **** 1234',
        primaryBalance: 5000.00,
        currency: 'USD',
      );
    }

    if (userModel.name == 'Henry Peralta' &&
        userModel.email == 'henry.peralta') {
      return _buildProducts(
        name: userModel.name,
        primaryCard: 'MasterCard',
        primaryAccount: '5123 **** **** 5678',
        primaryBalance: 3000.00,
        currency: 'GTQ',
      );
    }

    if (userModel.name == 'Admin' && userModel.email == 'admin@email.com') {
      return _buildProducts(
        name: userModel.name,
        primaryCard: 'Visa',
        primaryAccount: '4532 **** **** 9999',
        primaryBalance: 10000.00,
        currency: 'USD',
      );
    }

    return _buildProducts(
      name: userModel.name,
      primaryCard: 'Visa',
      primaryAccount: '4025 **** **** 9087',
      primaryBalance: 7250.75,
      currency: 'GTQ',
    );
  }

  List<UserAccountModel> _buildProducts({
    required String name,
    required String primaryCard,
    required String primaryAccount,
    required double primaryBalance,
    required String currency,
  }) {
    return [
      UserAccountModel(
        name: name,
        productType: 'Tarjeta principal',
        card: primaryCard,
        accountNumber: primaryAccount,
        balance: primaryBalance,
        moneda: currency,
      ),
      UserAccountModel(
        name: name,
        productType: 'Cuenta monetaria',
        card: 'Cuenta',
        accountNumber: '001-245-889120',
        balance: 12450.35,
        moneda: 'GTQ',
      ),
      UserAccountModel(
        name: name,
        productType: 'Cuenta de ahorro',
        card: 'Ahorro',
        accountNumber: '002-778-331045',
        balance: 2840.00,
        moneda: 'USD',
      ),
      UserAccountModel(
        name: name,
        productType: 'Prestamo personal',
        card: 'Prestamo',
        accountNumber: 'LN-2026-00084',
        balance: 18600.00,
        moneda: 'GTQ',
      ),
    ];
  }
}
