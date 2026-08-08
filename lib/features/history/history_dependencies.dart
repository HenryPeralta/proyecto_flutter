import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/data_sources/remote_transaction_data_source.dart';
import 'data/repositories/transaction_repository_impl.dart';
import 'domain/repositories/transaction_repository.dart';
import 'domain/use_cases/get_transactions_page_use_case.dart';
import 'presentation/state/history_provider.dart';

final remoteTransactionDataSourceProvider =
    Provider<RemoteTransactionDataSource>(
  (ref) => RemoteTransactionDataSourceImpl(),
);

final transactionRepositoryProvider = Provider<TransactionRepository>(
  (ref) => TransactionRepositoryImpl(
    ref.watch(remoteTransactionDataSourceProvider),
  ),
);

final getTransactionsPageUseCaseProvider = Provider<GetTransactionsPageUseCase>(
  (ref) => GetTransactionsPageUseCase(
    ref.watch(transactionRepositoryProvider),
  ),
);

final historyProvider = StateNotifierProvider<HistoryNotifier, HistoryState>(
  (ref) => HistoryNotifier(
    ref.watch(getTransactionsPageUseCaseProvider),
    () => FirebaseAuth.instance.currentUser?.uid,
  ),
);
