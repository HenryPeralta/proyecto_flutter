import 'package:proyecto_flutter/features/dashboard/data/models/user_account_model.dart';

class UserAccount {
  final String name;
  final String card;
  final String accountNumber;
  final double balance;
  final String moneda;

  UserAccount({
    required this.name,
    required this.card,
    required this.accountNumber,
    required this.balance,
    required this.moneda,
  });

  factory UserAccount.fromModel(UserAccountModel userAccountModel) {
    return UserAccount(
      name: userAccountModel.name,
      card: userAccountModel.card,
      accountNumber: userAccountModel.accountNumber,
      balance: userAccountModel.balance,
      moneda: userAccountModel.moneda,
    );
  }
}
