import 'package:proyecto_flutter/features/transfers/data/data_sources/local_transfers_data_source.dart';
import 'package:proyecto_flutter/features/transfers/domain/entities/transfer_account.dart';
import 'package:proyecto_flutter/features/transfers/domain/repositories/transfers_repository.dart';

class TransfersRepositoryImpl implements TransfersRepository {
  final LocalTransfersDataSource localTransfersDataSource;

  const TransfersRepositoryImpl({
    required this.localTransfersDataSource,
  });

  @override
  List<TransferAccount> getSourceAccounts() {
    return localTransfersDataSource.getSourceAccounts();
  }

  @override
  List<TransferAccount> getDestinationAccounts() {
    return localTransfersDataSource.getDestinationAccounts();
  }

  @override
  List<String> getTransferTypes() {
    return localTransfersDataSource.getTransferTypes();
  }
}
