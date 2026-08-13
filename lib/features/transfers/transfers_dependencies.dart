import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/notifications/notification_service.dart';

import 'data/data_sources/local_transfers_data_source.dart';
import 'data/data_sources/remote_transfers_data_source.dart';
import 'data/repositories/transfers_repository_impl.dart';
import 'domain/repositories/transfers_repository.dart';
import 'domain/use_cases/transfers_use_case.dart';
import 'presentation/state/transfers_provider.dart';

final transfersRepositoryProvider = Provider<TransfersRepository>((ref) {
  return TransfersRepositoryImpl(
    localTransfersDataSource: LocalTransfersDataSource(),
    remoteTransfersDataSource: RemoteTransfersDataSourceImpl(),
  );
});

final transfersUseCaseProvider = Provider<TransfersUseCase>((ref) {
  return TransfersUseCase(
    transfersRepository: ref.watch(transfersRepositoryProvider),
  );
});

final transfersProvider =
    StateNotifierProvider<TransfersNotifier, TransfersState>((ref) {
  return TransfersNotifier(
    transfersUseCase: ref.watch(transfersUseCaseProvider),
    currentUserId: () => FirebaseAuth.instance.currentUser?.uid,
    showTransferCompleted: ({required amountInCents}) => notificationService
        .showTransferCompleted(amountInCents: amountInCents),
  );
});
