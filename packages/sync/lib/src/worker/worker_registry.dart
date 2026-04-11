import 'worker_result.dart';
import 'worker_task.dart';

class WorkerRegistry {
  final Map<String, WorkerTask> _tasks = {};

  /// Mendaftarkan sebuah worker task
  void registerTask(WorkerTask task) {
    _tasks[task.taskName] = task;
  }

  /// Mendaftarkan list dari worker task
  void registerTasks(List<WorkerTask> tasks) {
    for (final task in tasks) {
      registerTask(task);
    }
  }

  /// Metode utama yang dipanggil oleh callbackDispatcher() dari Workmanager di main.dart
  Future<WorkerResult> executeTask(
    String taskName,
    Map<String, dynamic>? inputData,
  ) async {
    final task = _tasks[taskName];
    if (task != null) {
      try {
        return await task.execute(inputData);
      } catch (e) {
        // Jika terjadi error dari eksekusi worker
        // opsional: log ke Firebase Crashlytics dll di sini
        return WorkerResult.failure;
      }
    }
    // Task name tidak terdaftar di memori kita, report sebagai kegagalan
    return WorkerResult.failure;
  }
}
