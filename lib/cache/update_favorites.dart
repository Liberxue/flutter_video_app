import 'package:ciying/cache/database.dart';
import 'package:ciying/cache/get_cache_db_Instance.dart';

class updateFavoriteStatus {
  Future<void> updateIsFavorite(bool isFavorite, String resourceId) async {
    print(isFavorite);
    print(resourceId);
    AppDatabase _database = await getCacheDbInstance().getDatabaseInstance();
    final resourceSectionDao = _database.resourceSectionDao;
    _database.close();
    return await resourceSectionDao
        .updateIsFavoriteResourceSectionsByResourceId(isFavorite, resourceId);
  }
}
