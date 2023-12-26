abstract class Files {
  Future<void> delete(String path);
  Future<String?> read(String path);
  Future<void> write(String path, String content);
}
