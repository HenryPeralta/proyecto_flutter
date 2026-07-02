import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_flutter/features/history/domain/use_cases/history_use_case.dart';

class HistoryState {
  final String nameTitle;
  final String emailTitle;
  final String cardTitle;
  final String accountNumberTitle;
  final String balanceTitle;
  final String monedaTitle;
  final bool isLoading;
  final String? errorMessage;

  const HistoryState({
    this.nameTitle = '',
    this.emailTitle = '',
    this.cardTitle = '',
    this.accountNumberTitle = '',
    this.balanceTitle = '',
    this.monedaTitle = '',
    this.isLoading = false,
    this.errorMessage,
  });

  HistoryState copyWith({
    String? nameTitle,
    String? emailTitle,
    String? cardTitle,
    String? accountNumberTitle,
    String? balanceTitle,
    String? monedaTitle,
    bool? isLoading,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return HistoryState(
      nameTitle: nameTitle ?? this.nameTitle,
      emailTitle: emailTitle ?? this.emailTitle,
      cardTitle: cardTitle ?? this.cardTitle,
      accountNumberTitle: accountNumberTitle ?? this.accountNumberTitle,
      balanceTitle: balanceTitle ?? this.balanceTitle,
      monedaTitle: monedaTitle ?? this.monedaTitle,
      isLoading: isLoading ?? this.isLoading,
      errorMessage:
          clearErrorMessage ? null : errorMessage ?? this.errorMessage,
    );
  }
}

class HistoryNotifier extends StateNotifier<HistoryState> {
  final HistoryUseCase _historyUseCase;

  HistoryNotifier({HistoryUseCase? historyUseCase})
      : _historyUseCase = historyUseCase ?? HistoryUseCase(),
        super(const HistoryState());

  Future<void> userPerfil(String name, String email) async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);

    try {
      final user = await _historyUseCase.call(name, email);
      final account = await _historyUseCase.callAccount(name, email);
      state = state.copyWith(
        nameTitle: user.name,
        emailTitle: user.email,
        cardTitle: account.card,
        accountNumberTitle: account.accountNumber,
        balanceTitle: account.balance.toString(),
        monedaTitle: account.moneda,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString().replaceFirst('Exception: ', ''),
      );
    }
  }
}

final historyProvider = StateNotifierProvider<HistoryNotifier, HistoryState>(
  (ref) => HistoryNotifier(),
);
