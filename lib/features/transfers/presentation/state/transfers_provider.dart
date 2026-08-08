import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_flutter/features/transfers/domain/entities/transfer_account.dart';
import 'package:proyecto_flutter/features/transfers/domain/use_cases/transfers_use_case.dart';
import '../../domain/entities/transfer_request.dart';

class TransfersState {
  final List<TransferAccount> sourceAccounts;
  final List<TransferAccount> destinationAccounts;
  final List<String> transferTypes;
  final String? selectedSourceAccount;
  final String? selectedDestinationAccount;
  final String? selectedTransferType;
  final bool isSubmitting;
  final String? errorMessage;

  const TransfersState({
    this.sourceAccounts = const [],
    this.destinationAccounts = const [],
    this.transferTypes = const [],
    this.selectedSourceAccount,
    this.selectedDestinationAccount,
    this.selectedTransferType,
    this.isSubmitting = false,
    this.errorMessage,
  });

  TransfersState copyWith({
    List<TransferAccount>? sourceAccounts,
    List<TransferAccount>? destinationAccounts,
    List<String>? transferTypes,
    String? selectedSourceAccount,
    String? selectedDestinationAccount,
    String? selectedTransferType,
    bool? isSubmitting,
    String? errorMessage,
    bool clearError = false,
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
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }
}

class TransfersNotifier extends StateNotifier<TransfersState> {
  final TransfersUseCase _transfersUseCase;

  TransfersNotifier({
    required TransfersUseCase transfersUseCase,
    required String? Function() currentUserId,
  })  : _transfersUseCase = transfersUseCase,
        _currentUserId = currentUserId,
        super(const TransfersState()) {
    loadOptions();
  }

  final String? Function() _currentUserId;

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

  Future<bool> submitTransfer({
    required String amount,
    required String description,
  }) async {
    final userId = _currentUserId();
    final source = state.selectedSourceAccount;
    final destination = state.selectedDestinationAccount;
    final type = state.selectedTransferType;
    final amountInCents = _parseAmountInCents(amount);

    if (userId == null) {
      state = state.copyWith(errorMessage: 'La sesión no está disponible.');
      return false;
    }
    if (source == null || type == null || destination == null) {
      state = state.copyWith(
        errorMessage: 'Selecciona la cuenta, el tipo y el destino.',
      );
      return false;
    }
    if (amountInCents == null || amountInCents <= 0) {
      state = state.copyWith(errorMessage: 'Ingresa un monto válido.');
      return false;
    }

    final destinationLabel = state.destinationAccounts
        .where((account) => account.value == destination)
        .map((account) => account.label)
        .firstOrNull;
    final finalDescription = description.trim().isEmpty
        ? 'Transferencia a ${destinationLabel ?? destination}'
        : description.trim();

    state = state.copyWith(isSubmitting: true, clearError: true);
    try {
      await _transfersUseCase.createTransfer(
        TransferRequest(
          userId: userId,
          sourceAccount: source,
          destinationAccount: destination,
          transferType: type,
          amountInCents: amountInCents,
          description: finalDescription,
        ),
      );
      state = state.copyWith(isSubmitting: false, clearError: true);
      return true;
    } catch (_) {
      state = state.copyWith(
        isSubmitting: false,
        errorMessage: 'No fue posible registrar la transferencia.',
      );
      return false;
    }
  }

  int? _parseAmountInCents(String value) {
    final normalized = value.trim().replaceAll(',', '.');
    if (!RegExp(r'^\d+(\.\d{1,2})?$').hasMatch(normalized)) return null;
    final parts = normalized.split('.');
    final units = int.parse(parts.first);
    final decimals = parts.length == 1 ? '00' : parts.last.padRight(2, '0');
    return units * 100 + int.parse(decimals);
  }
}
