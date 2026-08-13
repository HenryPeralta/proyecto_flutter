abstract class TransactionException implements Exception {
  const TransactionException();
}

class TransactionIndexRequiredException extends TransactionException {
  const TransactionIndexRequiredException();
}

class TransactionLoadException extends TransactionException {
  const TransactionLoadException();
}
