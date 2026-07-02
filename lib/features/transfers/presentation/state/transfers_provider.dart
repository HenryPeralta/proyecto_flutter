import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_flutter/features/transfers/data/data_sources/local_transfers_data_source.dart';
import 'package:proyecto_flutter/features/transfers/data/repositories/transfers_repository_impl.dart';
import 'package:proyecto_flutter/features/transfers/domain/entities/transfer_account.dart';
import 'package:proyecto_flutter/features/transfers/domain/use_cases/transfers_use_case.dart';

class TransfersState {
  final List<TransferAccount> sourceAccounts;
  final List<TransferAccount> destinationAccounts;
  final List<String> transferTypes;
  final String? selectedSourceAccount;
  final String? selectedDestinationAccount;
  final String? selectedTransferType;

  const TransfersState({
    this.sourceAccounts = const [],
    this.destinationAccounts = const [],
    this.transferTypes = const [],
    this.selectedSourceAccount,
    this.selectedDestinationAccount,
    this.selectedTransferType,
  });

  TransfersState copyWith({
    List<TransferAccount>? sourceAccounts,
    List<TransferAccount>? destinationAccounts,
    List<String>? transferTypes,
    String? selectedSourceAccount,
    String? selectedDestinationAccount,
    String? selectedTransferType,
  }) {
    return TransfersState(
      sourceAccounts: sourceAccounts ?? this.sourceAccounts,
      destinationAccounts: destinationAccounts ?? this.destinationAccounts,
      transferTypes: transferTypes ?? this.transferTypes,
      selectedSourceAccount:
          selectedSourceAccount ?? this.selectedSourceAccount,
      selectedDestinationAccount:
          selectedDestinationAccount ?? this.selectedDestinationAccount,
      selectedTransferType: selectedTransferType ?? this.selectedTransferType,
    );
  }
}

class TransfersNotifier extends StateNotifier<TransfersState> {
  final TransfersUseCase _transfersUseCase;

  TransfersNotifier({
    required TransfersUseCase transfersUseCase,
  })  : _transfersUseCase = transfersUseCase,
        super(const TransfersState()) {
    loadOptions();
  }

  void loadOptions() {
    state = state.copyWith(
      sourceAccounts: _transfersUseCase.getSourceAccounts(),
      destinationAccounts: _transfersUseCase.getDestinationAccounts(),
      transferTypes: _transfersUseCase.getTransferTypes(),
    );
  }

  void selectSourceAccount(String? value) {
    state = state.copyWith(selectedSourceAccount: value);
  }

  void selectDestinationAccount(String? value) {
    state = state.copyWith(selectedDestinationAccount: value);
  }

  void selectTransferType(String value) {
    state = state.copyWith(selectedTransferType: value);
  }
}

final transfersProvider =
    StateNotifierProvider<TransfersNotifier, TransfersState>((ref) {
  final dataSource = LocalTransfersDataSource();
  final repository = TransfersRepositoryImpl(
    localTransfersDataSource: dataSource,
  );
  final useCase = TransfersUseCase(transfersRepository: repository);

  return TransfersNotifier(transfersUseCase: useCase);
});
