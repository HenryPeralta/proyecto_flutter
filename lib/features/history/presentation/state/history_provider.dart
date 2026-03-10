import 'package:flutter/material.dart';
import 'package:proyecto_flutter/features/history/domain/use_cases/history_use_case.dart';

class HistoryProvider extends ChangeNotifier {
  final HistoryUseCase _historyUseCase;

  HistoryProvider({HistoryUseCase? historyUseCase})
    : _historyUseCase = historyUseCase ?? HistoryUseCase();

  String nameTitle = '';
  String emailTitle = '';
  String cardTitle = '';
  String accountNumberTitle = '';
  String balanceTitle = '';
  String monedaTitle = '';

  Future<void> userPerfil(String name, String email) async {
    try {
      final user = await _historyUseCase.call(name, email);
      final account = await _historyUseCase.callAccount(name, email);
      nameTitle = user.name;
      emailTitle = user.email;
      cardTitle = account.card;
      accountNumberTitle = account.accountNumber;
      balanceTitle = account.balance.toString();
      monedaTitle = account.moneda;
      notifyListeners();
    } catch (e) {
      notifyListeners();
      return;
      // Manejar errores aquí si es necesario
    }
  }
}
