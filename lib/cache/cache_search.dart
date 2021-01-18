import 'package:ciying/api/search/search.dart';
import 'package:ciying/cache/database.dart';
import 'package:ciying/cache/entity/resource_section.dart';
import 'package:ciying/cache/get_cache_db_Instance.dart';
import 'package:ciying/grpc/proto/common.pbenum.dart';
import 'package:ciying/grpc/proto/search.pb.dart';

class CacheSearch {
  // first seachCache by searchText
  Future<List<CacheResourceSection>> cacheSearchBySearchText(
      SearchRequest searchRequest) async {
    //
    List<ResourceSection> _resourceSection = <ResourceSection>[];

    List<CacheResourceSection> cacheResourceSection;
    AppDatabase _database = await getCacheDbInstance().getDatabaseInstance();
    final resourceSectionDao = _database.resourceSectionDao;
    print(
        "text $searchRequest.text, limit $searchRequest.limit, offest $searchRequest.offset");
    cacheResourceSection =
        await resourceSectionDao.findResourceSectionsBySearchText(
            searchRequest.text, searchRequest.limit, searchRequest.offset);
    cacheResourceSection.forEach((element) {
      print(element.isFavorite);
      print(element.resourceAddress);
      print(element.resourceId);
      print("searchText $element.searchText");
      print(element.sourceId);
      print(element.sourceName);
    });
    // cache by duration is null ;
    if (cacheResourceSection.length <= 0) {
      //start request remote
      SearchResponse searchResponse =
          await Search.searchAPIRequest(searchRequest);
      // check searchResponse status
      // print(searchResponse);
      // print(searchResponse.code);
      if (SearchResponse == null) {
        return null;
      } else if (searchResponse.code == ResponseCode.SUCCESSFUL) {
        print(_resourceSection.map((e) => print("_resourceSection $e")));
        _resourceSection.addAll(searchResponse.resourceSection);
        print(_resourceSection.map((e) => print(e)));
        // save remote response to cache
        return await saveSearchData(_resourceSection, searchRequest.text);
      }
    }
    // _database.close();
    print(cacheResourceSection);
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
    AppDatabase _database = await getCacheDbInstance().getDatabaseInstance();
    final resourceSectionDao = _database.resourceSectionDao;
    List<CacheResourceSection> _cacheResourceSectionData =
        <CacheResourceSection>[];
    _resourceSection.forEach((element) {
      var resourceAddressCachePath;
      _cacheResourceSectionData.add(CacheResourceSection(
        element.resourceID,
        element.duration,
        element.sourceName,
        element.emotionCode.value,
        element.resourceAddress,
        element.sourceID,
        element.isFavorite,
        element.isDownload,
        searchText,
        resourceAddressCachePath,
      ));
    });
    await resourceSectionDao.insertResourceSections(_cacheResourceSectionData);
    final result = await resourceSectionDao.findAllResourceSection();
    List<CacheResourceSection> resourceSectionData = result;
    // print(resourceSectionData);
    _database.close();
    return resourceSectionData;
  }
}
