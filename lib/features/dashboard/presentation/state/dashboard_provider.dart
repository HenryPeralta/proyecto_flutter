import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_flutter/features/auth/presentation/providers/auth_providers.dart';
import 'package:proyecto_flutter/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:proyecto_flutter/features/dashboard/domain/entities/user_account.dart';
import 'package:proyecto_flutter/features/dashboard/domain/use_cases/dashboard_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardState {
  final String nameTitle;
  final String emailTitle;
  final String cardTitle;
  final String accountNumberTitle;
  final String balanceTitle;
  final String monedaTitle;
  final List<UserAccount> products;
  final bool isLoading;
  final String? errorMessage;

  const DashboardState({
    this.nameTitle = '',
    this.emailTitle = '',
    this.cardTitle = '',
    this.accountNumberTitle = '',
    this.balanceTitle = '',
    this.monedaTitle = '',
    this.products = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  DashboardState copyWith({
    String? nameTitle,
    String? emailTitle,
    String? cardTitle,
    String? accountNumberTitle,
    String? balanceTitle,
    String? monedaTitle,
    List<UserAccount>? products,
    bool? isLoading,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return DashboardState(
      nameTitle: nameTitle ?? this.nameTitle,
      emailTitle: emailTitle ?? this.emailTitle,
      cardTitle: cardTitle ?? this.cardTitle,
      accountNumberTitle: accountNumberTitle ?? this.accountNumberTitle,
      balanceTitle: balanceTitle ?? this.balanceTitle,
      monedaTitle: monedaTitle ?? this.monedaTitle,
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      errorMessage:
          clearErrorMessage ? null : errorMessage ?? this.errorMessage,
    );
  }
}

class DashboardNotifier extends StateNotifier<DashboardState> {
  final DashboardUseCase _dashboardUseCase;

  DashboardNotifier({
    DashboardUseCase? dashboardUseCase,
    SharedPreferences? sharedPreferences,
  })  : _dashboardUseCase = dashboardUseCase ??
            DashboardUseCase(
              dashboardRepository: DashboardRepositoryImpl(
                sharedPreferences: sharedPreferences,
              ),
            ),
        super(const DashboardState());

  Future<void> userPerfil(String name, String email) async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);

    try {
      final user = await _dashboardUseCase.call(name, email);
      final accounts = await _dashboardUseCase.callAccounts(name, email);
      final account = accounts.first;

      state = state.copyWith(
        nameTitle: user.name,
        emailTitle: user.email,
        cardTitle: account.card,
        accountNumberTitle: account.accountNumber,
        balanceTitle: account.balance.toStringAsFixed(2),
        monedaTitle: account.moneda,
        products: accounts,
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

final dashboardProvider =
    StateNotifierProvider<DashboardNotifier, DashboardState>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return DashboardNotifier(sharedPreferences: sharedPreferences);
});
