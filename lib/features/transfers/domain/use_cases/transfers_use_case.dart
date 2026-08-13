import 'package:proyecto_flutter/features/transfers/domain/entities/transfer_account.dart';
import 'package:proyecto_flutter/features/transfers/domain/repositories/transfers_repository.dart';
import '../entities/transfer_request.dart';

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

  Future<String> createTransfer(TransferRequest request) {
    if (request.amountInCents <= 0) {
      throw const FormatException('El monto debe ser mayor que cero.');
    }
    return transfersRepository.createTransfer(request);
  }
}
