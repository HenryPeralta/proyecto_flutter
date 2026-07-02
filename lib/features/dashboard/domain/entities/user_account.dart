import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proyecto_flutter/features/dashboard/data/models/user_account_model.dart';

part 'user_account.freezed.dart';

@freezed
class UserAccount with _$UserAccount {
  const UserAccount._();

  const factory UserAccount({
    required String name,
    required String productType,
    required String card,
    required String accountNumber,
    required double balance,
    required String moneda,
  }) = _UserAccount;

  factory UserAccount.fromModel(UserAccountModel userAccountModel) {
    return UserAccount(
      name: userAccountModel.name,
      productType: userAccountModel.productType,
      card: userAccountModel.card,
      accountNumber: userAccountModel.accountNumber,
      balance: userAccountModel.balance,
      moneda: userAccountModel.moneda,
    );
  }
}
