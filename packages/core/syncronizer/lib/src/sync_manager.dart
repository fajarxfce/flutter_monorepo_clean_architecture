import 'package:syncronizer/src/sync_result.dart';
import 'package:syncronizer/src/sync_task.dart';
import 'package:syncronizer/src/synchronizer.dart';

class SyncManager {
  final Synchronizer synchronizer;

  SyncManager(this.synchronizer);

  Future<SyncResult> sync(SyncTask task) async {
    try {
      final versions = await synchronizer.getVersions();
      final currentVersion = versions.getVersion(task.key);
      final changeList = await task.fetchChanges(currentVersion);
      if (changeList.isEmpty) {
        return SyncSuccess();
      }
      final deleted = changeList
          .where((e) => e.deletedAt != null)
          .map((e) => e.id)
          .toList();
      final updated = changeList
          .where((e) => e.deletedAt == null)
          .map((e) => e.id)
          .toList();
      if (deleted.isNotEmpty) {
        await task.deletedModels(deleted);
      }
      if (updated.isNotEmpty) {
        await task.updatedModels(updated);
      }

      final latestVersion = changeList.last.version;
      await synchronizer.updateVersions(
        (v) => v.update(task.key, latestVersion),
      );
      return SyncSuccess();
    } catch (e, s) {
      return SyncFailure(e, s);
    }
  }
}
