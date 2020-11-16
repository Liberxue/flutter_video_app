import 'package:ciying/api/config.dart';
import 'package:ciying/grpc/proto/gateWay.pbgrpc.dart';
import 'package:ciying/grpc/proto/search.pb.dart';
import 'package:ciying/util/logger.dart';
import 'package:ciying/util/store.dart';
import 'package:grpc/grpc.dart';

class Search {
  static Future<SearchResponse> searchAPIRequest(SearchRequest data) async {
    SearchResponse searchResponse;
    Manager manager = Manager.instance;
    final stub = GateWayClient(manager.channel);
    var _token = await Cache.getToken();
    try {
      searchResponse = await stub.search(data,
          options: CallOptions(
              metadata: {"authorization": "bearer " + _token.toString()}));
    } catch (e) {
      logger.e("searchAPIRequest Caught error", '$e');
    }
    return searchResponse;
  }
}
