import 'package:proyecto_flutter/features/transfers/domain/entities/transfer_account.dart';
import '../entities/transfer_request.dart';

abstract class TransfersRepository {
  List<TransferAccount> getSourceAccounts();

  List<TransferAccount> getDestinationAccounts();

  List<String> getTransferTypes();

  Future<String> createTransfer(TransferRequest request);
}
