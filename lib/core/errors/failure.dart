sealed class Failure {
  const Failure(this.message);
  final String message;
}

class StorageFailure extends Failure {
  const StorageFailure([super.message = 'Erreur de stockage']);
}

class ValidationFailure extends Failure {
  const ValidationFailure([super.message = 'Données invalides']);
}
