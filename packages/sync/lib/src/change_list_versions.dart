class ChangeListVersions {
  final Map<String, int> versions;
  ChangeListVersions(this.versions);
  int getVersion(String key) => versions[key] ?? 0;

  ChangeListVersions update(String key, int version) {
    final newVersions = Map<String, int>.from(versions);
    newVersions[key] = version;
    return ChangeListVersions(newVersions);
  }
}
