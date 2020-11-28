import 'package:ciying/api/search/search.dart';
import 'package:ciying/cache/cache_search.dart';
import 'package:ciying/grpc/proto/search.pb.dart';

class SearchCache {
  Future<SearchResponse> searchAction(
      SearchRequest searchRequest, String searchText) async {
    List<ResourceSection> _resourceSection = new List<ResourceSection>();
    await Search.searchAPIRequest(searchRequest)
        .then((value) => _resourceSection.addAll(value.resourceSection));
    CacheSearch().saveSearchData(_resourceSection, searchText);
    return await Search.searchAPIRequest(searchRequest);
  }
}
