class NetworkChangeList {
  final int id;
  final int version;
  final DateTime? deletedAt;

  NetworkChangeList({required this.id, required this.version, this.deletedAt});
}
