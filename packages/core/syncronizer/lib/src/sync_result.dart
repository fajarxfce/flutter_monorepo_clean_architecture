sealed class SyncResult {}

class SyncSuccess extends SyncResult {}

class SyncFailure extends SyncResult {
  final Object error;
  final StackTrace stackTrace;
  SyncFailure(this.error, this.stackTrace);
}
