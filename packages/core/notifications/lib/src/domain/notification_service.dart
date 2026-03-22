abstract class NotificationService {
  Future<void> initialize();
  Future<String?> getToken();
  Future<String?> checkInitialRoute();
  Stream<String> get onNotificationOpened;
}
