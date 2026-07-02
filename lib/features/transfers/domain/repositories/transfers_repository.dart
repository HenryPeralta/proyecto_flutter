import 'package:proyecto_flutter/features/transfers/domain/entities/transfer_account.dart';

abstract class TransfersRepository {
  List<TransferAccount> getSourceAccounts();

  List<TransferAccount> getDestinationAccounts();

  List<String> getTransferTypes();
}
