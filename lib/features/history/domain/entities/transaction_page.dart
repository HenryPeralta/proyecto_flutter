import 'package:freezed_annotation/freezed_annotation.dart';

import 'transaction.dart';

part 'transaction_page.freezed.dart';

@freezed
class TransactionCursor with _$TransactionCursor {
  const factory TransactionCursor({
    required DateTime createdAt,
    required String documentId,
  }) = _TransactionCursor;
}

@freezed
class TransactionPage with _$TransactionPage {
  const factory TransactionPage({
    @Default(<Transaction>[]) List<Transaction> items,
    TransactionCursor? nextCursor,
    @Default(false) bool hasMore,
  }) = _TransactionPage;
}
