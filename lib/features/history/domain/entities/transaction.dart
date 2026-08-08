import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';

@freezed
class Transaction with _$Transaction {
  const Transaction._();

  const factory Transaction({
    required String id,
    required String userId,
    required String type,
    required int amountInCents,
    required String description,
    required DateTime createdAt,
    required String status,
    @Default('USD') String currency,
  }) = _Transaction;

  bool get isIncome => type == 'income' || amountInCents > 0;
}
