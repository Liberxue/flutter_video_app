import 'package:ciying/cache/database.dart';
import 'package:ciying/cache/get_cache_db_Instance.dart';

class updateDownloadStatus {
  Future<void> updateIsDownload(
      bool isDownload, String resourceId, String cachePath) async {
    AppDatabase _database = await getCacheDbInstance().getDatabaseInstance();
    final resourceSectionDao = _database.resourceSectionDao;
    _database.close();
    return await resourceSectionDao
        .updateIsDownloadResourceSectionsByResourceId(
            isDownload, cachePath, resourceId);
  }
}
