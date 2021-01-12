import 'package:ciying/cache/database.dart';
import 'package:ciying/cache/entity/resource_section.dart';
import 'package:ciying/cache/get_cache_db_Instance.dart';

class favoriteList {
  Future<List<CacheResourceSection>> updateIsFavorite(
      bool isFavorite, String resourceId) async {
    AppDatabase _database = await getCacheDbInstance().getDatabaseInstance();
    final resourceSectionDao = _database.resourceSectionDao;
    _database.close();
    return await resourceSectionDao.findResourceSectionsByIsFavorite(true);
  }
}
