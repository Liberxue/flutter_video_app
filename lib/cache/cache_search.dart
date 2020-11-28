import 'package:ciying/cache/database.dart';
import 'package:ciying/cache/entity/resource_section.dart';
import 'package:ciying/grpc/proto/search.pb.dart';

class CacheSearch {
  getDatabaseInstance() async {
    return await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  }

  // first seachCache by searchText
  Future<List<CacheResourceSection>> cacheSearchBySearchText(
      String searchText) async {
    final resourceSectionDao = getDatabaseInstance().resourceSectionDao;
    return await resourceSectionDao
        .findResourceSectionsBySearchText(searchText);
  }

  //  cache by duration is null ; start request remote and save remote response to cache
  Future<void> saveSearchData(
      List<ResourceSection> _resourceSection, String searchText) async {
    final resourceSectionDao = getDatabaseInstance().resourceSectionDao;
    List<CacheResourceSection> _cacheResourceSectionData =
        new List<CacheResourceSection>();
    _resourceSection.forEach((element) {
      _cacheResourceSectionData.add(CacheResourceSection(
        element.resourceID,
        element.duration,
        element.sourceName,
        element.emotionCode.value,
        element.resourceAddress,
        element.sourceID,
        element.isFavorite,
        element.isDownload,
        element.sourceName,
        searchText,
        null,
      ));
    });
    await resourceSectionDao.insertResourceSections(_cacheResourceSectionData);
    final result = await resourceSectionDao.findAllResourceSection();
    List<CacheResourceSection> resourceSectionData = result;
    print(resourceSectionData);
  }

  Future<void> updateIsFavorite(bool isFavorite, String resourceId) async {
    final resourceSectionDao = getDatabaseInstance().resourceSectionDao;
    return await resourceSectionDao
        .updateIsFavoriteResourceSectionsByResourceId(isFavorite, resourceId);
  }

  Future<void> updateIsDownload(
      bool isDownload, String resourceId, String cachePath) async {
    final resourceSectionDao = getDatabaseInstance().resourceSectionDao;
    return resourceSectionDao.updateIsDownloadResourceSectionsByResourceId(
        isDownload, resourceId, cachePath);
  }
}
