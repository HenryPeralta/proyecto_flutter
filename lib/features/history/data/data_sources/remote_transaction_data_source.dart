import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/transaction_model.dart';
import '../models/transaction_page_model.dart';

abstract class RemoteTransactionDataSource {
  Future<TransactionPageModel> getPage({
    required String userId,
    DateTime? afterCreatedAt,
    String? afterDocumentId,
    int pageSize = 15,
  });
}

class RemoteTransactionDataSourceImpl implements RemoteTransactionDataSource {
  RemoteTransactionDataSourceImpl({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  @override
  Future<TransactionPageModel> getPage({
    required String userId,
    DateTime? afterCreatedAt,
    String? afterDocumentId,
    int pageSize = 15,
  }) async {
    Query<Map<String, dynamic>> query = _firestore
        .collection('transactions')
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .orderBy(FieldPath.documentId, descending: true)
        .limit(pageSize);

    if (afterCreatedAt != null && afterDocumentId != null) {
      query = query.startAfter([afterCreatedAt, afterDocumentId]);
    }

    final snapshot = await query.get();
    final models = snapshot.docs.map(TransactionModel.fromFirestore).toList();
    final last = models.lastOrNull;

    return TransactionPageModel(
      items: models,
      hasMore: models.length == pageSize,
      lastCreatedAt: last?.createdAt,
      lastDocumentId: last?.id,
    );
  }
}
