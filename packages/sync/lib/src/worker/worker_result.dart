enum WorkerResult {
  /// Melambangkan task berhasil dieksekusi oleh OS
  success,

  /// Melambangkan task butuh diulang lagi di kemudian hari (karena error jaringan/sejenis)
  retry,

  /// Melambangkan task gagal secara fatal, jangan diulang
  failure,
}
