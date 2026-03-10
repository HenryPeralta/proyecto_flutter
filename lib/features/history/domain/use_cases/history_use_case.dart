import 'package:proyecto_flutter/features/history/data/repositories/history_repository_impl.dart';
import 'package:proyecto_flutter/features/history/domain/entities/user.dart';
import 'package:proyecto_flutter/features/history/domain/entities/user_account.dart';
import 'package:proyecto_flutter/features/history/domain/repositories/history_repository.dart';

class HistoryUseCase {
  final HistoryRepository _dashboardRepository;

  HistoryUseCase({HistoryRepository? dashboardRepository})
    : _dashboardRepository = dashboardRepository ?? HistoryRepositoryImpl();

  Future<User> call(String name, String email) async {
    return await _dashboardRepository.userPerfil(name, email);
  }

  Future<UserAccount> callAccount(String name, String email) async {
    return await _dashboardRepository.userAccount(name, email);
  }
}
