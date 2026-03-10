import 'package:proyecto_flutter/features/history/data/data_sources/remote_history_data_source.dart';
import 'package:proyecto_flutter/features/history/data/models/user_account_model.dart';
import 'package:proyecto_flutter/features/history/data/models/user_model.dart';
import 'package:proyecto_flutter/features/history/domain/entities/user.dart';
import 'package:proyecto_flutter/features/history/domain/entities/user_account.dart';
import 'package:proyecto_flutter/features/history/domain/repositories/history_repository.dart';

class HistoryRepositoryImpl extends HistoryRepository {
  final RemoteHistoryDataSource _remoteHistoryDataSource;

  HistoryRepositoryImpl({
    RemoteHistoryDataSource? remoteHistoryDataSource,
  }) : _remoteHistoryDataSource =
           remoteHistoryDataSource ?? RemoteHistoryDataSource();

  @override
  Future<User> userPerfil(String name, String email) async {
    // Implementation for user perfil
    final userNameModel = UserModel(name: name, email: email);

    final UserModel userModel = await _remoteHistoryDataSource.userPerfil(
      userNameModel,
    );
    return User.fromModel(userModel);
  }

  @override
  Future<UserAccount> userAccount(String name, String email) async {

    final userNameModel = UserModel(name: name, email: email);

    final UserAccountModel userModelAccount = await _remoteHistoryDataSource.userAccount(userNameModel);
    return UserAccount.fromModel(userModelAccount);
  }
}
