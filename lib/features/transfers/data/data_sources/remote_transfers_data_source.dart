import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/transfer_request.dart';

abstract class RemoteTransfersDataSource {
  Future<String> createTransfer(TransferRequest request);
}

class RemoteTransfersDataSourceImpl implements RemoteTransfersDataSource {
  RemoteTransfersDataSourceImpl({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  @override
  Future<String> createTransfer(TransferRequest request) async {
    final document = await _firestore.collection('transactions').add({
      'userId': request.userId,
      'type': 'expense',
      'amountInCents': -request.amountInCents.abs(),
      'currency': request.currency,
      'description': request.description,
      'sourceAccount': request.sourceAccount,
      'destinationAccount': request.destinationAccount,
      'transferType': request.transferType,
      'status': 'completed',
      'createdAt': FieldValue.serverTimestamp(),
    });
    return document.id;
  }
}
