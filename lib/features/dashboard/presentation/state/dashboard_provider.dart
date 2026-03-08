import 'package:flutter/material.dart';
import 'package:proyecto_flutter/features/dashboard/domain/use_cases/dashboard_use_case.dart';

class DashboardProvider extends ChangeNotifier {
  final DashboardUseCase _dashboardUseCase;

  DashboardProvider({DashboardUseCase? dashboardUseCase})
    : _dashboardUseCase = dashboardUseCase ?? DashboardUseCase();

  String nameTitle = '';
  String emailTitle = '';
  String cardTitle = '';
  String accountNumberTitle = '';
  String balanceTitle = '';
  String monedaTitle = '';

  Future<void> userPerfil(String name, String email) async {
    try {
      final user = await _dashboardUseCase.call(name, email);
      final account = await _dashboardUseCase.callAccount(name, email);
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
