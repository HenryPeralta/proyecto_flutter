import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/transaction.dart';
import '../../domain/entities/transaction_page.dart';
import '../../domain/errors/transaction_exception.dart';
import '../../domain/use_cases/get_transactions_page_use_case.dart';

part 'history_provider.freezed.dart';

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState({
    @Default(<Transaction>[]) List<Transaction> transactions,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    @Default(true) bool hasMore,
    String? errorMessage,
  }) = _HistoryState;
}

class HistoryNotifier extends StateNotifier<HistoryState> {
  HistoryNotifier(this._getTransactionsPage, this._currentUserId)
      : super(const HistoryState());

  final GetTransactionsPageUseCase _getTransactionsPage;
  final String? Function() _currentUserId;
  TransactionCursor? _cursor;

  Future<void> loadFirstPage() async {
    final userId = _currentUserId();
    if (userId == null) return;
    state = const HistoryState(isLoading: true);
    try {
      final page = await _getTransactionsPage(userId: userId);
      _cursor = page.nextCursor;
      state = HistoryState(transactions: page.items, hasMore: page.hasMore);
    } catch (error) {
      state = HistoryState(errorMessage: _friendlyError(error));
    }
  }

  Future<void> loadNextPage() async {
    final userId = _currentUserId();
    if (userId == null || state.isLoadingMore || !state.hasMore) return;
    state = state.copyWith(isLoadingMore: true, errorMessage: null);
    try {
      final page = await _getTransactionsPage(
        userId: userId,
        after: _cursor,
      );
      _cursor = page.nextCursor ?? _cursor;
      final byId = {for (final item in state.transactions) item.id: item};
      for (final item in page.items) {
        byId[item.id] = item;
      }
      state = state.copyWith(
        transactions: byId.values.toList(),
        isLoadingMore: false,
        hasMore: page.hasMore,
      );
    } catch (error) {
      state = state.copyWith(
        isLoadingMore: false,
        errorMessage: _friendlyError(error),
      );
    }
  }

  String _friendlyError(Object error) {
    if (error is TransactionIndexRequiredException) {
      return 'Firestore requiere el índice de transacciones. Despliega firestore.indexes.json.';
    }
    return 'No fue posible cargar las transacciones.';
  }
}
