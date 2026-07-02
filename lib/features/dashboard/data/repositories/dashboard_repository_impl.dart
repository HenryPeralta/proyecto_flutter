import 'package:proyecto_flutter/features/dashboard/data/data_sources/local_dashboard_data_source.dart';
import 'package:proyecto_flutter/features/dashboard/data/data_sources/remote_dashboard_data_source.dart';
import 'package:proyecto_flutter/features/dashboard/data/models/user_model.dart';
import 'package:proyecto_flutter/features/dashboard/domain/entities/user.dart';
import 'package:proyecto_flutter/features/dashboard/domain/entities/user_account.dart';
import 'package:proyecto_flutter/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardRepositoryImpl extends DashboardRepository {
  final RemoteDashboardDataSource _remoteDashboardDataSource;
  final LocalDashboardDataSource? _localDashboardDataSource;

  DashboardRepositoryImpl({
    RemoteDashboardDataSource? remoteDashboardDataSource,
    LocalDashboardDataSource? localDashboardDataSource,
    SharedPreferences? sharedPreferences,
  }) : _remoteDashboardDataSource =
           remoteDashboardDataSource ?? RemoteDashboardDataSource(),
       _localDashboardDataSource = localDashboardDataSource ??
           (sharedPreferences == null
               ? null
               : LocalDashboardDataSource(sharedPreferences));

  @override
  Future<User> userPerfil(String name, String email) async {
    // Implementation for user perfil
    final userNameModel = UserModel(name: name, email: email);

    final UserModel userModel = await _remoteDashboardDataSource.userPerfil(
      userNameModel,
    );
    return User.fromModel(userModel);
  }

  @override
  Future<UserAccount> userAccount(String name, String email) async {
    final accounts = await userAccounts(name, email);
    return accounts.first;
  }

  @override
  Future<List<UserAccount>> userAccounts(String name, String email) async {
    final userNameModel = UserModel(name: name, email: email);

    try {
      final products = await _remoteDashboardDataSource.userAccounts(
        userNameModel,
      );
      await _localDashboardDataSource?.saveProducts(email, products);
      return products.map(UserAccount.fromModel).toList();
    } catch (e) {
      final cachedProducts =
          await _localDashboardDataSource?.getProducts(email) ?? [];
      if (cachedProducts.isNotEmpty) {
        return cachedProducts.map(UserAccount.fromModel).toList();
      }

      rethrow;
    }
  }
}
