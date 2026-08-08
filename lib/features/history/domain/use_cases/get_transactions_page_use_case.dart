import '../entities/transaction_page.dart';
import '../repositories/transaction_repository.dart';

class GetTransactionsPageUseCase {
  const GetTransactionsPageUseCase(this._repository);

  final TransactionRepository _repository;

  Future<TransactionPage> call({
    required String userId,
    TransactionCursor? after,
    int pageSize = 15,
  }) {
    return _repository.getPage(
      userId: userId,
      after: after,
      pageSize: pageSize,
    );
  }
}
