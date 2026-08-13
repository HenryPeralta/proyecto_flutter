import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_request.freezed.dart';

@freezed
class TransferRequest with _$TransferRequest {
  const factory TransferRequest({
    required String userId,
    required String sourceAccount,
    required String destinationAccount,
    required String transferType,
    required int amountInCents,
    required String description,
    @Default('GTQ') String currency,
  }) = _TransferRequest;
}
