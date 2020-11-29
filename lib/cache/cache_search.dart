import 'package:ciying/api/search/search.dart';
import 'package:ciying/cache/database.dart';
import 'package:ciying/cache/entity/resource_section.dart';
import 'package:ciying/grpc/proto/search.pb.dart';

class CacheSearch {
  getDatabaseInstance() async {
    return await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  }

  // first seachCache by searchText
  Future<List<CacheResourceSection>> cacheSearchBySearchText(
      SearchRequest searchRequest) async {
    //
    List<ResourceSection> _resourceSection = new List<ResourceSection>();

    List<CacheResourceSection> cacheResourceSection;
    AppDatabase _database = await getDatabaseInstance();
    final resourceSectionDao = _database.resourceSectionDao;
    cacheResourceSection =
        await resourceSectionDao.findResourceSectionsBySearchText(
            searchRequest.text, searchRequest.limit, searchRequest.offset);
    // cache by duration is null ;
    if (cacheResourceSection.length <= 0) {
      //start request remote
      print("start search request");
      SearchResponse searchResponse =
          await Search.searchAPIRequest(searchRequest);
      // check searchResponse status
      print(searchResponse);
      print(searchResponse.code);
      if (SearchResponse != null)
        _resourceSection.addAll(searchResponse.resourceSection);
      // save remote response to cache
      return await saveSearchData(_resourceSection, searchRequest.text);
    }
    return cacheResourceSection;

    //@Query(
    //     'SELECT * FROM CacheResourceSection WHERE searchText = :searchText order by resourceId LIMIT :=limit OFFSET := offset')
    // Future<List<CacheResourceSection>> findResourceSectionsBySearchText(
    //     String searchText, Int64 limit, Int64 offset);
    // List<CacheResourceSection> _cacheResourceSection;
    // print(searchRequest.text);
    // AppDatabase _database =
    //     await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    // List<Map<String, dynamic>> output = await _database.database.rawQuery(
    //     'SELECT * FROM CacheResourceSection WHERE SEARCHTEXT = 12221 order by resourceId  LIMIT $searchRequest.limit OFFSET  $searchRequest.offset');
    // print(output);
    // print(output.length != 0);
  }

  //  cache by duration is null ; start request remote and save remote response to cache
  Future<List<CacheResourceSection>> saveSearchData(
      List<ResourceSection> _resourceSection, String searchText) async {
    AppDatabase _database = await getDatabaseInstance();
    final resourceSectionDao = _database.resourceSectionDao;
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
    // print(resourceSectionData);
    return resourceSectionData;
  }

  Future<List<CacheResourceSection>> updateIsFavorite(
      bool isFavorite, String resourceId) async {
    AppDatabase _database = await getDatabaseInstance();
    final resourceSectionDao = _database.resourceSectionDao;
    return await resourceSectionDao
        .updateIsFavoriteResourceSectionsByResourceId(isFavorite, resourceId);
  }

  Future<List<CacheResourceSection>> updateIsDownload(
      bool isDownload, String resourceId, String cachePath) async {
    AppDatabase _database = await getDatabaseInstance();
    final resourceSectionDao = _database.resourceSectionDao;
    return await resourceSectionDao
        .updateIsDownloadResourceSectionsByResourceId(
            isDownload, cachePath, resourceId);
  }
}
