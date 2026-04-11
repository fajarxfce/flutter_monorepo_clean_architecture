import 'worker_result.dart';

abstract class WorkerTask {
  /// Nama Unik dari Task. String ini harus sama dengan yang di register pada Workmanager
  String get taskName;

  /// Logika utama yang akan dieksekusi di background oleh OS
  /// inputData adalah data yang dipassing oleh workmanager
  Future<WorkerResult> execute(Map<String, dynamic>? inputData);
}
