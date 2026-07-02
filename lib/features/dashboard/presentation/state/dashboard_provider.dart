import 'package:flutter/material.dart';
import 'package:proyecto_flutter/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:proyecto_flutter/features/dashboard/domain/entities/user_account.dart';
import 'package:proyecto_flutter/features/dashboard/domain/use_cases/dashboard_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardProvider extends ChangeNotifier {
  final DashboardUseCase _dashboardUseCase;

  DashboardProvider({
    DashboardUseCase? dashboardUseCase,
    SharedPreferences? sharedPreferences,
  }) : _dashboardUseCase = dashboardUseCase ??
            DashboardUseCase(
              dashboardRepository: DashboardRepositoryImpl(
                sharedPreferences: sharedPreferences,
              ),
            );

  String nameTitle = '';
  String emailTitle = '';
  String cardTitle = '';
  String accountNumberTitle = '';
  String balanceTitle = '';
  String monedaTitle = '';
  List<UserAccount> products = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> userPerfil(String name, String email) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final user = await _dashboardUseCase.call(name, email);
      final accounts = await _dashboardUseCase.callAccounts(name, email);
      final account = accounts.first;

      nameTitle = user.name;
      emailTitle = user.email;
      cardTitle = account.card;
      accountNumberTitle = account.accountNumber;
      balanceTitle = account.balance.toStringAsFixed(2);
      monedaTitle = account.moneda;
      products = accounts;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      errorMessage = e.toString().replaceFirst('Exception: ', '');
      notifyListeners();
    }
  }
}
