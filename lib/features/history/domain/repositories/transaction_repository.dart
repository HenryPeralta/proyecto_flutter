import '../entities/transaction_page.dart';

abstract class TransactionRepository {
  Future<TransactionPage> getPage({
    required String userId,
    TransactionCursor? after,
    int pageSize = 15,
  });
}
