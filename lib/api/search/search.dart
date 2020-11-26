import 'package:ciying/api/call_config.dart';
import 'package:ciying/api/config.dart';
import 'package:ciying/grpc/proto/gateWay.pbgrpc.dart';
import 'package:ciying/grpc/proto/search.pb.dart';
import 'package:ciying/Utils/logger.dart';

class Search {
  static Future<SearchResponse> searchAPIRequest(SearchRequest data) async {
    SearchResponse searchResponse;
    Manager manager = Manager.instance;
    final stub = GateWayClient(manager.channel);
    var callConfig = await callOptionsConf();
    if (callConfig.metadata.map != null) {
      try {
        searchResponse = await stub.search(data, options: callConfig);
      } catch (e) {
        logger.e("searchAPIRequest Caught error", '$e');
        return null;
      }
      return searchResponse;
    }
    return searchResponse;
  }
}
