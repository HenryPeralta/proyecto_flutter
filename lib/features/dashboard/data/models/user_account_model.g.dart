// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAccountModelImpl _$$UserAccountModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserAccountModelImpl(
      name: json['name'] as String,
      productType: json['productType'] as String,
      card: json['card'] as String,
      accountNumber: json['accountNumber'] as String,
      balance: (json['balance'] as num).toDouble(),
      moneda: json['moneda'] as String,
    );

Map<String, dynamic> _$$UserAccountModelImplToJson(
        _$UserAccountModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'productType': instance.productType,
      'card': instance.card,
      'accountNumber': instance.accountNumber,
      'balance': instance.balance,
      'moneda': instance.moneda,
    };
