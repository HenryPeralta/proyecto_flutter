import 'package:proyecto_flutter/features/dashboard/domain/entities/user.dart';
import 'package:proyecto_flutter/features/dashboard/domain/entities/user_account.dart';

abstract class DashboardRepository {
  Future<User> userPerfil(String name, String email);
  Future<UserAccount> userAccount(String name, String email);
}
