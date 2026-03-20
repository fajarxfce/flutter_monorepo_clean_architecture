import 'package:syncronizer/src/model/network_change_list.dart';

class SyncTask {
  final String key;
  final Future<List<NetworkChangeList>> Function(int version) fetchChanges;
  final Future<void> Function(List<int> ids) deletedModels;
  final Future<void> Function(List<int> ids) updatedModels;

  SyncTask({
    required this.key,
    required this.fetchChanges,
    required this.deletedModels,
    required this.updatedModels,
  });
}
