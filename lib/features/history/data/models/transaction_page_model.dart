import 'transaction_model.dart';

class TransactionPageModel {
  const TransactionPageModel({
    required this.items,
    required this.hasMore,
    this.lastCreatedAt,
    this.lastDocumentId,
  });

  final List<TransactionModel> items;
  final bool hasMore;
  final DateTime? lastCreatedAt;
  final String? lastDocumentId;
}
