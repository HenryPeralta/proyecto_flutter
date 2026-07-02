import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_account_model.freezed.dart';
part 'user_account_model.g.dart';

@freezed
class UserAccountModel with _$UserAccountModel {
  const factory UserAccountModel({
    required String name,
    required String productType,
    required String card,
    required String accountNumber,
    required double balance,
    required String moneda,
  }) = _UserAccountModel;

  factory UserAccountModel.fromJson(Map<String, dynamic> json) =>
      _$UserAccountModelFromJson(json);
}
