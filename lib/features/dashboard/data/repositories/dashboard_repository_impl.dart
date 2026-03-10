import 'package:proyecto_flutter/features/dashboard/data/data_sources/remote_dashboard_data_source.dart';
import 'package:proyecto_flutter/features/dashboard/data/models/user_account_model.dart';
import 'package:proyecto_flutter/features/dashboard/data/models/user_model.dart';
import 'package:proyecto_flutter/features/dashboard/domain/entities/user.dart';
import 'package:proyecto_flutter/features/dashboard/domain/entities/user_account.dart';
import 'package:proyecto_flutter/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl extends DashboardRepository {
  final RemoteDashboardDataSource _remoteDashboardDataSource;

  DashboardRepositoryImpl({
    RemoteDashboardDataSource? remoteDashboardDataSource,
  }) : _remoteDashboardDataSource =
           remoteDashboardDataSource ?? RemoteDashboardDataSource();

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

    final userNameModel = UserModel(name: name, email: email);

    final UserAccountModel userModelAccount = await _remoteDashboardDataSource.userAccount(userNameModel);
    return UserAccount.fromModel(userModelAccount);
  }
}
