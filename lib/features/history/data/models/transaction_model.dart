import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/transaction.dart' as domain;

part 'transaction_model.freezed.dart';

@freezed
class TransactionModel with _$TransactionModel {
  const TransactionModel._();

  const factory TransactionModel({
    required String id,
    required String userId,
    required String type,
    required int amountInCents,
    required String description,
    required DateTime createdAt,
    required String status,
    @Default('USD') String currency,
  }) = _TransactionModel;

  factory TransactionModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data() ?? const <String, dynamic>{};
    return TransactionModel(
      id: document.id,
      userId: data['userId'] as String? ?? '',
      type: data['type'] as String? ?? 'expense',
      amountInCents: (data['amountInCents'] as num?)?.toInt() ?? 0,
      description: data['description'] as String? ?? 'Transacción',
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      status: data['status'] as String? ?? 'pending',
      currency: data['currency'] as String? ?? 'USD',
    );
  }

  domain.Transaction toEntity() => domain.Transaction(
        id: id,
        userId: userId,
        type: type,
        amountInCents: amountInCents,
        description: description,
        createdAt: createdAt,
        status: status,
        currency: currency,
      );
}
