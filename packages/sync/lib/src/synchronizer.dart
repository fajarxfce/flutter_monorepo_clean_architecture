import 'change_list_versions.dart';

abstract class Synchronizer {
  Future<ChangeListVersions> getVersions();
  Future<void> updateVersions(
    ChangeListVersions Function(ChangeListVersions) update,
  );
}
