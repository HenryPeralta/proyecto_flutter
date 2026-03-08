import 'package:proyecto_flutter/features/history/domain/entities/user.dart';
import 'package:proyecto_flutter/features/history/domain/entities/user_account.dart';

abstract class HistoryRepository {
  Future<User> userPerfil(String name, String email);
  Future<UserAccount> userAccount(String name, String email);
}
