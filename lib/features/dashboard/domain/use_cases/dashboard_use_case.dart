import 'package:proyecto_flutter/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:proyecto_flutter/features/dashboard/domain/entities/user.dart';
import 'package:proyecto_flutter/features/dashboard/domain/entities/user_account.dart';
import 'package:proyecto_flutter/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardUseCase {
  final DashboardRepository _dashboardRepository;

  DashboardUseCase({DashboardRepository? dashboardRepository})
    : _dashboardRepository = dashboardRepository ?? DashboardRepositoryImpl();

  Future<User> call(String name, String email) async {
    return await _dashboardRepository.userPerfil(name, email);
  }

  Future<UserAccount> callAccount(String name, String email) async {
    return await _dashboardRepository.userAccount(name, email);
  }
}
