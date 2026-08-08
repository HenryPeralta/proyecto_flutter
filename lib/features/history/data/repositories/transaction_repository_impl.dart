import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/transaction_page.dart';
import '../../domain/errors/transaction_exception.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../data_sources/remote_transaction_data_source.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  const TransactionRepositoryImpl(this._remoteDataSource);

  final RemoteTransactionDataSource _remoteDataSource;

  @override
  Future<TransactionPage> getPage({
    required String userId,
    TransactionCursor? after,
    int pageSize = 15,
  }) async {
    try {
      final result = await _remoteDataSource.getPage(
        userId: userId,
        afterCreatedAt: after?.createdAt,
        afterDocumentId: after?.documentId,
        pageSize: pageSize,
      );

      final hasCursor =
          result.lastCreatedAt != null && result.lastDocumentId != null;
      return TransactionPage(
        items: result.items.map((model) => model.toEntity()).toList(),
        hasMore: result.hasMore,
        nextCursor: hasCursor
            ? TransactionCursor(
                createdAt: result.lastCreatedAt!,
                documentId: result.lastDocumentId!,
              )
            : null,
      );
    } on FirebaseException catch (error) {
      if (error.code == 'failed-precondition') {
        throw const TransactionIndexRequiredException();
      }
      throw const TransactionLoadException();
    }
  }
}
