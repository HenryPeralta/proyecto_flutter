import 'package:proyecto_flutter/features/transfers/domain/entities/transfer_account.dart';
import 'package:proyecto_flutter/features/transfers/domain/repositories/transfers_repository.dart';

class TransfersUseCase {
  final TransfersRepository transfersRepository;

  const TransfersUseCase({
    required this.transfersRepository,
  });

  List<TransferAccount> getSourceAccounts() {
    return transfersRepository.getSourceAccounts();
  }

  List<TransferAccount> getDestinationAccounts() {
    return transfersRepository.getDestinationAccounts();
  }

  List<String> getTransferTypes() {
    return transfersRepository.getTransferTypes();
  }
}
